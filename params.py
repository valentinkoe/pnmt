import numpy as np
from collections import OrderedDict

from utils import get_layer_name


np.random.seed(1234)


def _ortho_weight(ndim):
    W = np.random.randn(ndim, ndim)
    u, s, v = np.linalg.svd(W)
    return u


def _norm_weight(nin, nout=None, scale=0.01, ortho=True):
    if nout is None:
        nout = nin
    if nout == nin and ortho:
        W = _ortho_weight(nin)
    else:
        W = scale * np.random.randn(nin, nout)
    return W


# feedforward layer: affine transformation + point-wise nonlinearity
def _param_init_fflayer(nin, nout, prefix="ff", ortho=True):
    ff_params = OrderedDict()
    ff_params[get_layer_name(prefix, "W")] = _norm_weight(nin, nout, scale=0.01, ortho=ortho)
    ff_params[get_layer_name(prefix, "b")] = np.zeros((nout,))
    return ff_params


# GRU layer
def _param_init_gru(nin, dim_rnn, prefix="gru"):
    gru_params = OrderedDict()
    # embedding to gates transformation weights, biases
    gru_params[get_layer_name(prefix, "W")] = np.concatenate([_norm_weight(nin, dim_rnn),
                                                              _norm_weight(nin, dim_rnn)], axis=1)
    gru_params[get_layer_name(prefix, "b")] = np.zeros((2 * dim_rnn,))
    # recurrent transformation weights for gates
    gru_params[get_layer_name(prefix, "U")] = np.concatenate([_ortho_weight(dim_rnn),
                                                              _ortho_weight(dim_rnn)], axis=1)
    # embedding to hidden state proposal weights, biases
    gru_params[get_layer_name(prefix, "Wx")] = _norm_weight(nin, dim_rnn)
    gru_params[get_layer_name(prefix, "bx")] = np.zeros((dim_rnn,))
    # recurrent transformation weights for hidden state proposal
    gru_params[get_layer_name(prefix, "Ux")] = _ortho_weight(dim_rnn)
    return gru_params


# Conditional GRU layer with Attention
def _param_init_gru_cond(nin, dim_rnn, dimctx,
                         prefix="gru_cond",
                         nin_nonlin=None, dim_nonlin=None):

    if nin_nonlin is None:
        nin_nonlin = nin
    if dim_nonlin is None:
        dim_nonlin = dim_rnn

    gru_cond_params = OrderedDict()
    gru_cond_params[get_layer_name(prefix, "W")] = np.concatenate([_norm_weight(nin, dim_rnn),
                                                                   _norm_weight(nin, dim_rnn)], axis=1)
    gru_cond_params[get_layer_name(prefix, "b")] = np.zeros((2 * dim_rnn,))
    gru_cond_params[get_layer_name(prefix, "U")] = np.concatenate([_ortho_weight(dim_nonlin),
                                                                   _ortho_weight(dim_nonlin)], axis=1)
    gru_cond_params[get_layer_name(prefix, "Wx")] = _norm_weight(nin_nonlin, dim_nonlin)
    gru_cond_params[get_layer_name(prefix, "Ux")] = _ortho_weight(dim_nonlin)
    gru_cond_params[get_layer_name(prefix, "bx")] = np.zeros((dim_nonlin,))
    gru_cond_params[get_layer_name(prefix, "U_nl")] = np.concatenate([_ortho_weight(dim_nonlin),
                                                             _ortho_weight(dim_nonlin)], axis=1)
    gru_cond_params[get_layer_name(prefix, "b_nl")] = np.zeros((2 * dim_nonlin,))
    gru_cond_params[get_layer_name(prefix, "Ux_nl")] = _ortho_weight(dim_nonlin)
    gru_cond_params[get_layer_name(prefix, "bx_nl")] = np.zeros((dim_nonlin,))
    gru_cond_params[get_layer_name(prefix, "Wc")] = _norm_weight(dimctx, dim_rnn * 2)
    gru_cond_params[get_layer_name(prefix, "Wcx")] = _norm_weight(dimctx, dim_rnn)
    # attention: combined -> hidden
    gru_cond_params[get_layer_name(prefix, "W_comb_att")] = _norm_weight(dim_rnn, dimctx)
    # attention: context -> hidden
    gru_cond_params[get_layer_name(prefix, "Wc_att")] = _norm_weight(dimctx)
    # attention: hidden bias
    gru_cond_params[get_layer_name(prefix, "b_att")] = np.zeros((dimctx,))
    # attention:
    gru_cond_params[get_layer_name(prefix, "U_att")] = _norm_weight(dimctx, 1)
    gru_cond_params[get_layer_name(prefix, "c_tt")] = np.zeros((1,))
    return gru_cond_params


def init_params(n_words_src, n_words_target, dim_emb, dim_rnn, dtype="float32"):
    """initializes all parameters used """

    params = OrderedDict()

    # embedding
    params["Wemb"] = _norm_weight(n_words_src, dim_emb)
    params["Wemb_dec"] = _norm_weight(n_words_target, dim_emb)

    # encoder: bidirectional RNN
    params.update(_param_init_gru(prefix="encoder", nin=dim_emb, dim_rnn=dim_rnn))
    params.update(_param_init_gru(prefix="encoder_r", nin=dim_emb, dim_rnn=dim_rnn))
    ctxdim = 2 * dim_rnn

    # init_state, init_cell
    params.update(_param_init_fflayer(prefix="ff_state", nin=ctxdim, nout=dim_rnn))
    # decoder
    params.update(_param_init_gru_cond(prefix="decoder", nin=dim_emb, dim_rnn=dim_rnn, dimctx=ctxdim))
    # readout
    params.update(_param_init_fflayer(prefix="ff_logit_rnn", nin=dim_rnn, nout=dim_emb, ortho=False))
    params.update(_param_init_fflayer(prefix="ff_logit_prev", nin=dim_emb, nout=dim_emb, ortho=False))
    params.update(_param_init_fflayer(prefix="ff_logit_ctx", nin=ctxdim, nout=dim_emb, ortho=False))
    params.update(_param_init_fflayer(prefix="ff_logit", nin=dim_emb, nout=n_words_target))

    cast_to_dtype(params, dtype=dtype)
    return params


def cast_to_dtype(param_dict, dtype):
    for param_name in param_dict:
        param_dict[param_name] = param_dict[param_name].astype(dtype)


def load_params(filename):
    with open(filename, "rb") as f:
        return OrderedDict(np.load(f))
