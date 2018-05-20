import numpy as np

from utils import get_layer_name


def build_model(tparams, **kwargs):

    import theano
    import theano.tensor as T
    from theano.sandbox.rng_mrg import MRG_RandomStreams as RandomStreams

    import theano.sandbox.cuda.basic_ops

    TRNG = RandomStreams(1234)

    def concatenate(tensor_list, axis=0):
        """
        Alternative implementation of `theano.tensor.concatenate`.
        This function does exactly the same thing, but contrary to Theano's own
        implementation, the gradient is implemented on the GPU.
        Backpropagating through `theano.tensor.concatenate` yields slowdowns
        because the inverse operation (splitting) needs to be done on the CPU.
        This implementation does not have that problem.
        :usage:
            >>> x, y = theano.tensor.matrices("x", "y")
            >>> c = concatenate([x, y], axis=1)
        :parameters:
            - tensor_list : list
                list of Theano tensor expressions that should be concatenated.
            - axis : int
                the tensors will be joined along this axis.
        :returns:
            - out : tensor
                the concatenated tensor expression.
        """
        concat_size = sum(tt.shape[axis] for tt in tensor_list)

        output_shape = ()
        for k in range(axis):
            output_shape += (tensor_list[0].shape[k],)
        output_shape += (concat_size,)
        for k in range(axis + 1, tensor_list[0].ndim):
            output_shape += (tensor_list[0].shape[k],)

        out = T.zeros(output_shape)
        offset = 0
        for tt in tensor_list:
            indices = ()
            for k in range(axis):
                indices += (slice(None),)
            indices += (slice(offset, offset + tt.shape[axis]),)
            for k in range(axis + 1, tensor_list[0].ndim):
                indices += (slice(None),)

            out = T.set_subtensor(out[indices], tt)
            offset += tt.shape[axis]

        return out

    def dropout_layer(state_before, noise):
        proj = T.switch(
            noise,
            state_before * TRNG.binomial(state_before.shape, p=0.5, n=1,
                                         dtype=state_before.dtype),
            state_before * 0.5)
        return proj

    # linear activation function
    def linear(x):
        return x

    # tanh acitvation function
    tanh = T.tanh

    def fflayer(tparams, state_below, prefix="ff", activ=tanh):
        return activ(T.dot(state_below, tparams[get_layer_name(prefix, "W")]) +
                     tparams[get_layer_name(prefix, "b")])

    def gru_layer(tparams, state_below, prefix="gru", mask=None):
        nsteps = state_below.shape[0]
        if state_below.ndim == 3:
            n_samples = state_below.shape[1]
        else:
            n_samples = 1

        dim = tparams[get_layer_name(prefix, "Ux")].shape[1]

        if mask is None:
            mask = T.ones((state_below.shape[0], 1))

        # utility function to slice a tensor
        def _slice(_x, n, dim):
            if _x.ndim == 3:
                return _x[:, :, n * dim:(n + 1) * dim]
            return _x[:, n * dim:(n + 1) * dim]

        # state_below is the input word embeddings
        # input to the gates, concatenated
        state_below_ = T.dot(state_below, tparams[get_layer_name(prefix, "W")]) + \
                       tparams[get_layer_name(prefix, "b")]
        # input to compute the hidden state proposal
        state_belowx = T.dot(state_below, tparams[get_layer_name(prefix, "Wx")]) + \
                       tparams[get_layer_name(prefix, "bx")]

        # step function to be used by scan
        # arguments    | sequences |outputs-info| non-seqs
        def _step_slice(m_, x_, xx_, h_, U, Ux):
            preact = T.dot(h_, U)
            preact += x_

            # reset and update gates
            r = T.nnet.sigmoid(_slice(preact, 0, dim))
            u = T.nnet.sigmoid(_slice(preact, 1, dim))

            # compute the hidden state proposal
            preactx = T.dot(h_, Ux)
            preactx = preactx * r
            preactx = preactx + xx_

            # hidden state proposal
            h = T.tanh(preactx)

            # leaky integrate and obtain next hidden state
            h = u * h_ + (1. - u) * h
            h = m_[:, None] * h + (1. - m_)[:, None] * h_

            return h

        # prepare scan arguments
        seqs = [mask, state_below_, state_belowx]
        init_states = [T.zeros((n_samples, dim))]
        _step = _step_slice
        shared_vars = [tparams[get_layer_name(prefix, "U")],
                       tparams[get_layer_name(prefix, "Ux")]]

        rval, updates = theano.scan(_step,
                                    sequences=seqs,
                                    outputs_info=init_states,
                                    non_sequences=shared_vars,
                                    name=get_layer_name(prefix, "_layers"),
                                    n_steps=nsteps,
                                    strict=True)
        return [rval]

    def gru_cond_layer(tparams, state_below, prefix="gru",
                       mask=None, context=None, one_step=False,
                       init_state=None, context_mask=None):
        assert context, "Context must be provided"

        if one_step:
            assert init_state, "previous state must be provided"

        nsteps = state_below.shape[0]
        if state_below.ndim == 3:
            n_samples = state_below.shape[1]
        else:
            n_samples = 1

        # mask
        if mask is None:
            mask = T.ones((state_below.shape[0], 1))

        dim = tparams[get_layer_name(prefix, "Wcx")].shape[1]

        # initial/previous state
        if init_state is None:
            init_state = T.zeros((n_samples, dim))

        # projected context
        assert context.ndim == 3, \
            "Context must be 3-d: #annotation x #sample x dim"
        pctx_ = T.dot(context, tparams[get_layer_name(prefix, "Wc_att")]) + \
                tparams[get_layer_name(prefix, "b_att")]

        def _slice(_x, n, dim):
            if _x.ndim == 3:
                return _x[:, :, n * dim:(n + 1) * dim]
            return _x[:, n * dim:(n + 1) * dim]

        # projected x
        state_belowx = T.dot(state_below, tparams[get_layer_name(prefix, "Wx")]) + \
                       tparams[get_layer_name(prefix, "bx")]
        state_below_ = T.dot(state_below, tparams[get_layer_name(prefix, "W")]) + \
                       tparams[get_layer_name(prefix, "b")]

        def _step_slice(m_, x_, xx_, h_, ctx_, alpha_, pctx_, cc_,
                        U, Wc, W_comb_att, U_att, c_tt, Ux, Wcx,
                        U_nl, Ux_nl, b_nl, bx_nl):
            preact1 = T.dot(h_, U)
            preact1 += x_
            preact1 = T.nnet.sigmoid(preact1)

            r1 = _slice(preact1, 0, dim)
            u1 = _slice(preact1, 1, dim)

            preactx1 = T.dot(h_, Ux)
            preactx1 *= r1
            preactx1 += xx_

            h1 = T.tanh(preactx1)

            h1 = u1 * h_ + (1. - u1) * h1
            h1 = m_[:, None] * h1 + (1. - m_)[:, None] * h_

            # attention
            pstate_ = T.dot(h1, W_comb_att)
            pctx__ = pctx_ + pstate_[None, :, :]
            # pctx__ += xc_
            pctx__ = T.tanh(pctx__)
            alpha = T.dot(pctx__, U_att) + c_tt
            alpha = alpha.reshape([alpha.shape[0], alpha.shape[1]])
            alpha = T.exp(alpha)  # TODO: check, may cause NaNs
            if context_mask:
                alpha = alpha * context_mask
            alpha = alpha / alpha.sum(0, keepdims=True)
            ctx_ = (cc_ * alpha[:, :, None]).sum(0)  # current context

            preact2 = T.dot(h1, U_nl) + b_nl
            preact2 += T.dot(ctx_, Wc)
            preact2 = T.nnet.sigmoid(preact2)

            r2 = _slice(preact2, 0, dim)
            u2 = _slice(preact2, 1, dim)

            preactx2 = T.dot(h1, Ux_nl) + bx_nl
            preactx2 *= r2
            preactx2 += T.dot(ctx_, Wcx)

            h2 = T.tanh(preactx2)

            h2 = u2 * h1 + (1. - u2) * h2
            h2 = m_[:, None] * h2 + (1. - m_)[:, None] * h1

            return h2, ctx_, alpha.T  # pstate_, preact, preactx, r, u

        seqs = [mask, state_below_, state_belowx]
        # seqs = [mask, state_below_, state_belowx, state_belowc]
        _step = _step_slice

        shared_vars = [tparams[get_layer_name(prefix, "U")],
                       tparams[get_layer_name(prefix, "Wc")],
                       tparams[get_layer_name(prefix, "W_comb_att")],
                       tparams[get_layer_name(prefix, "U_att")],
                       tparams[get_layer_name(prefix, "c_tt")],
                       tparams[get_layer_name(prefix, "Ux")],
                       tparams[get_layer_name(prefix, "Wcx")],
                       tparams[get_layer_name(prefix, "U_nl")],
                       tparams[get_layer_name(prefix, "Ux_nl")],
                       tparams[get_layer_name(prefix, "b_nl")],
                       tparams[get_layer_name(prefix, "bx_nl")]]

        if one_step:
            rval = _step(*(seqs + [init_state, None, None, pctx_, context] +
                           shared_vars))
        else:
            rval, updates = theano.scan(_step,
                                        sequences=seqs,
                                        outputs_info=[init_state,
                                                      T.zeros((n_samples, context.shape[2])),
                                                      T.zeros((n_samples, context.shape[0]))],
                                        non_sequences=[pctx_, context] + shared_vars,
                                        name=get_layer_name(prefix, "_layers"),
                                        n_steps=nsteps,
                                        strict=True)
        return rval

    layer_apply_funcs = {"ff": fflayer,
                         "gru": gru_layer,
                         "gru_cond": gru_cond_layer}

    # description string: #words x #samples
    x = T.imatrix("x")
    x_mask = T.imatrix("x_mask")
    x_mask_f = T.cast(x_mask, dtype=theano.config.floatX)
    y = T.imatrix("y")
    y_mask = T.imatrix("y_mask")
    y_mask_f = T.cast(y_mask, dtype=theano.config.floatX)

    # for the backward rnn, we just need to invert x and x_mask
    xr = x[::-1]
    xr_mask = x_mask_f[::-1]

    n_timesteps = x.shape[0]
    n_timesteps_trg = y.shape[0]
    n_samples = x.shape[1]

    # word embedding for forward rnn (source)
    emb = tparams["Wemb"][x.flatten()]
    emb = emb.reshape([n_timesteps, n_samples, kwargs["dim_emb"]])
    proj = layer_apply_funcs[kwargs["encoder"]](tparams, emb, prefix="encoder", mask=x_mask_f)

    # word embedding for backward rnn (source)
    embr = tparams["Wemb"][xr.flatten()]
    embr = embr.reshape([n_timesteps, n_samples, kwargs["dim_emb"]])
    projr = layer_apply_funcs[kwargs["encoder"]](tparams, embr, prefix="encoder_r", mask=xr_mask)

    # context will be the concatenation of forward and backward rnns
    ctx = concatenate([proj[0], projr[0][::-1]], axis=proj[0].ndim - 1)

    # mean of the context (across time) will be used to initialize decoder rnn
    ctx_mean = (ctx * x_mask_f[:, :, None]).sum(0) / x_mask_f.sum(0)[:, None]

    # or you can use the last state of forward + backward encoder rnns
    # ctx_mean = concatenate([proj[0][-1], projr[0][-1]], axis=proj[0].ndim-2)

    # initial decoder state
    init_state = layer_apply_funcs["ff"](tparams, ctx_mean, prefix="ff_state", activ=tanh)

    # word embedding (target), we will shift the target sequence one time step
    # to the right. This is done because of the bi-gram connections in the
    # readout and decoder rnn. The first target will be all zeros and we will
    # not condition on the last output.
    emb = tparams["Wemb_dec"][y.flatten()]
    emb = emb.reshape([n_timesteps_trg, n_samples, kwargs["dim_emb"]])
    emb_shifted = T.zeros_like(emb)
    emb_shifted = T.set_subtensor(emb_shifted[1:], emb[:-1])
    emb = emb_shifted

    # decoder - pass through the decoder conditional gru with attention
    proj = layer_apply_funcs[kwargs["decoder"]](tparams, emb, prefix="decoder", mask=y_mask_f,
                                                context=ctx, context_mask=x_mask_f,
                                                one_step=False, init_state=init_state)

    # hidden states of the decoder gru
    proj_h = proj[0]

    # weighted averages of context, generated by attention module
    ctxs = proj[1]

    # weights (alignment matrix)
    dec_alphas = proj[2]

    # compute word probabilities
    logit_rnn = layer_apply_funcs["ff"](tparams, proj_h, prefix="ff_logit_rnn", activ=linear)
    logit_prev = layer_apply_funcs["ff"](tparams, emb, prefix="ff_logit_prev", activ=linear)
    logit_ctx = layer_apply_funcs["ff"](tparams, ctxs, prefix="ff_logit_ctx", activ=linear)
    logit = T.tanh(logit_rnn + logit_prev + logit_ctx)
    if "dropout" in kwargs:
        logit = dropout_layer(logit, theano.shared(np.array(1., dtype=theano.config.floatX)))
    logit = layer_apply_funcs["ff"](tparams, logit, prefix="ff_logit", activ=linear)
    logit_shp = logit.shape
    probs = T.nnet.softmax(logit.reshape([logit_shp[0] * logit_shp[1], logit_shp[2]]))

    # cost
    y_flat = y.flatten()
    y_flat_idx = T.arange(y_flat.shape[0]) * kwargs["n_words_target"] + y_flat

    # clipping probabilities
    eps = 0.00001
    clipped_probs = T.maximum(eps, T.minimum(1-eps, probs))
    cost = -T.log(clipped_probs.flatten()[y_flat_idx])

    cost = cost.reshape([y.shape[0], y.shape[1]])
    cost = (cost * y_mask_f).sum(0)

    cost = cost.mean()

    # apply L2 regularization on weights
    if kwargs.get("decay_c", 0.) > 0.:
        decay_c = theano.shared(kwargs["decay_c"], name="decay_c")
        weight_decay = 0.
        for kk, vv in tparams.items():
            weight_decay += (vv ** 2).sum()
        weight_decay *= decay_c
        cost += weight_decay

    # regularize the alignment weights alpha
    if kwargs.get("alpha_c", 0.) > 0.:
        alpha_c = theano.shared(kwargs["alpha_c"], name="alpha_c")
        alpha_reg = alpha_c * (
            (y_mask_f.sum(0)//x_mask_f.sum(0)[:, None] -
             dec_alphas.sum(0))**2).sum(1).mean()
        cost += alpha_reg

    # also building sampler for production ######
    emb_sampler = tparams["Wemb"][x.flatten()]
    emb_sampler = emb_sampler.reshape([n_timesteps, n_samples, kwargs["dim_emb"]])
    proj_sampler = layer_apply_funcs[kwargs["encoder"]](tparams, emb_sampler, prefix="encoder")

    embr_sampler = tparams["Wemb"][xr.flatten()]
    embr_sampler = embr_sampler.reshape([n_timesteps, n_samples, kwargs["dim_emb"]])
    projr_sampler = layer_apply_funcs[kwargs["encoder"]](tparams, embr_sampler, prefix="encoder_r")

    ctx_sampler = concatenate([proj_sampler[0], projr_sampler[0][::-1]], axis=proj_sampler[0].ndim - 1)
    ctx_mean_sampler = ctx_sampler.mean(0)
    init_state_sampler = layer_apply_funcs["ff"](tparams, ctx_mean_sampler,
                                                 prefix="ff_state", activ=tanh)
    f_init_graph = ([x], [init_state_sampler, ctx_sampler])

    decoder_in_sampler = T.ivector()
    init_state_sampler = T.matrix()
    emb_sampler = T.switch(decoder_in_sampler[:, None] < 0,
                           T.zeros((1, tparams["Wemb_dec"].shape[1])),
                           tparams["Wemb_dec"][decoder_in_sampler])

    proj_decoder_sampler = layer_apply_funcs[kwargs["decoder"]](tparams,
                                                                emb_sampler,
                                                                prefix="decoder",
                                                                context=ctx_sampler,
                                                                one_step=True,
                                                                init_state=init_state_sampler)
    next_state_sampler = proj_decoder_sampler[0]
    ctxs_sampler = proj_decoder_sampler[1]

    logit_rnn_sampler = layer_apply_funcs["ff"](tparams, next_state_sampler,
                                                prefix="ff_logit_rnn", activ=linear)
    logit_prev_sampler = layer_apply_funcs["ff"](tparams, emb_sampler,
                                                 prefix="ff_logit_prev", activ=linear)
    logit_ctx_sampler = layer_apply_funcs["ff"](tparams, ctxs_sampler,
                                                prefix="ff_logit_ctx", activ=linear)
    logit_sampler = tanh(logit_rnn_sampler + logit_prev_sampler + logit_ctx_sampler)
    logit_sampler = layer_apply_funcs["ff"](tparams, logit_sampler,
                                            prefix="ff_logit", activ=linear)

    next_probs_sampler = T.nnet.softmax(logit_sampler)
    next_sample_sampler = T.cast(TRNG.multinomial(pvals=next_probs_sampler).argmax(1), dtype="int32")

    f_next_graph = ([decoder_in_sampler, ctx_sampler, init_state_sampler],
                    [next_probs_sampler, next_sample_sampler, next_state_sampler])

    return (x, x_mask, y, y_mask), cost, (f_init_graph, f_next_graph)
