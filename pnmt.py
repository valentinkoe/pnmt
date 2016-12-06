#! /usr/bin/env python3

import json
import os
from collections import OrderedDict

import click

import numpy as np

import logging
from datetime import datetime
log_file = datetime.now().strftime('%Y-%m-%d_%H:%M:%S') + "_pnmt.log"
logging.basicConfig(level=logging.INFO,
                    format="%(asctime)s - %(levelname)s %(module)s - %(message)s",
                    datefmt="%Y-%m-%d %H:%M:%S",
                    handlers=[logging.FileHandler(log_file), logging.StreamHandler()])

from async_train.utils import save_params
from async_train import train_params

from data_iterator import TextIterator
from params import init_params
from build_model import build_model


@click.command()
@click.argument("train-data", type=click.Path(exists=True, dir_okay=False), nargs=2)
@click.argument("dicts", type=click.Path(exists=True, dir_okay=False), nargs=2)
@click.argument("save-to", type=click.Path(exists=False, dir_okay=False))
@click.option("--save-frequency", default=2000,
              help="save intermediate states of the model's parameters afterv"
                   "this many updates")
@click.option("--valid-data", type=click.Path(exists=True, dir_okay=False), nargs=2,
              help="training data of as raw text files with one sentence per line")
@click.option("--valid-frequency", default=2000,
              help="compute the validation error after this many updates, possibly triggering "
                   "early stopping; has no effect if no validation data is provided")
@click.option("--patience", default=10,
              help="early stopping patience; has no effect if no validation data is provided")
@click.option("--encoder", default="gru", type=click.Choice(["gru"]),
              help="type of encoder RNN")
@click.option("--decoder", default="gru_cond", type=click.Choice(["gru", "gru_cond"]),
              help="type of decoder RNN")
@click.option("--dim-emb", default=100,
              help="word vector dimensionality for input and output language")
@click.option("--dim-rnn", default=1000,
              help="number of RNN units for encoder and decoder")
@click.option("--weight-dtype", default="float32",
              help="the type of floating point weights, should be the same as theano.config.floatX")
@click.option("--n-words-source", default=15000,
              help="source vocabulary size; only the n most frequent words are used, "
                   "rest is treated as unknown (special UNK token)")
@click.option("--n-words-target", default=15000,
              help="target vocabulary size; only the n most frequent words are used, "
                   "rest is treated as unknown (special UNK token)")
@click.option("--maxlen", default=50,
              help="maximum length of sentences taken int account; if either the source "
                   "or the target sentence is longer, the pair is dismissed")
@click.option("--decay_c", default=0., help="L2 regularization penalty")
@click.option("--alpha-c", default=0., help="alignment weight regularization")
@click.option("--dropout/--no-dropout", default=False,
              help="whether to use dropout or not; currently only on the last layer; "
                   "currently not switched off for validation!!!")  # TODO
@click.option("--l_rate", default=.01, help="(initial) learning rate")
@click.option("--epochs", default=1000, help="number of maximum training epochs")
@click.option("--batch-size", default=64, help="size of data batches used for training")
@click.option("--optimizer", default="sgd", type=click.Choice(["hogwild",
                                                               "async_agrad",
                                                               "async_da",
                                                               "sgd",
                                                               "adagrad",
                                                               "adadelta",
                                                               "adam",
                                                               "rmsprop"]),
              help="optimizing algorithm to use for training")
@click.option("--devices", default="cpu,cpu,cpu,cpu",
              help="comma separated list of devices to run training with the asynchronous "
                   "algorithms; see `'theano.sandbox.cuda.run'`for more information; "
                   "only the first one is used in case a sequential optimization algorithm is used")
@click.option("--characters/--no-characters", default=False,
              help="when set, the model is trained on raw characters instead of words, make sure to "
                   "adjust other model parameters to this setting")
def train(train_data, dicts, save_to, save_frequency, valid_data, valid_frequency, patience,
          encoder, decoder, dim_emb, dim_rnn, weight_dtype, n_words_source, n_words_target, maxlen,
          decay_c, alpha_c, dropout, l_rate, epochs, batch_size, optimizer, devices, characters):
    """
    Trains a Neural Machine Translation model with the specified parameters.
    Provides asynchronous optimization algorithms, see option --optimizer.

    Training (and validation) data must provide tokenization which can be recovered
    with `str.split`. Not necessary for character based models.
    """

    logging.info("logging to {}".format(log_file))

    logging.info("loading dictionaries from {}, {}".format(*dicts))
    with open(dicts[0], 'r') as f1, open(dicts[1], 'r') as f2:
        dictionaries = [json.load(f1), json.load(f2)]

    logging.info("preparing training data streams from {}, {}".format(*train_data))
    train_data_iter = TextIterator(*train_data, *dictionaries,
                                   n_words_source=n_words_source, n_words_target=n_words_target,
                                   batch_size=batch_size, maxlen=maxlen, raw_characters=characters)
    valid_data_iter = None
    if valid_data:
        logging.info("preparing validation data streams from {}, {}".format(*train_data))
        valid_data_iter = TextIterator(*valid_data, *dictionaries,
                                       n_words_source=n_words_source, n_words_target=n_words_target,
                                       batch_size=batch_size, maxlen=maxlen, raw_characters=characters)

    logging.info("initializing weights")
    params = init_params(n_words_source, n_words_target, dim_emb, dim_rnn, dtype=weight_dtype)

    if optimizer in ["hogwild", "async_agrad", "async_da"]:
        logging.info("selected parallelizable optimizing algorithm {}, handing over to async-train".format(optimizer))
        # saving, validation and logging is taken care of by async_train.train_params
        trained_params = train_params(params, build_model, data=train_data_iter,
                                      devices=devices.split(","), update_scheme=optimizer,
                                      num_epochs=epochs, l_rate=l_rate, log_level=30, log_file=log_file,
                                      valid_data=valid_data_iter, valid_freq=valid_frequency, patience=patience,
                                      save_to=save_to, save_freq=save_frequency,
                                      dim_emb=dim_emb, encoder=encoder, decoder=decoder,
                                      dropout=dropout, n_words_target=n_words_target,
                                      decay_c=decay_c, alpha_c=alpha_c)

    elif optimizer in ["sgd", "adagrad", "adadelta", "adam", "rmsprop"]:
        logging.info("selected sequential optimizer {}".format(optimizer))


        dir_path = os.path.dirname(save_to)
        if dir_path and not os.path.exists(dir_path):
            os.makedirs(dir_path)
        save_file = save_params(params, save_to, epoch_update=(0, 0))
        logging.info("update {}, saving current model parameters to {}".format(0, save_file))
        train_options_file = os.path.splitext(save_to)[0] + ".json"
        logging.info("saving training options to {}".format(train_options_file))
        train_options = {"devices": devices,
                         "optimizer": optimizer,
                         "l_rate": l_rate,
                         "save_to": save_to,
                         "patience": patience,
                         "dim_emb": dim_emb,
                         "encoder": encoder,
                         "decoder": decoder,
                         "dropout": dropout,
                         "n_words_target": n_words_target,
                         "n_words_source": n_words_source,
                         "decay_c": decay_c,
                         "alpha_c": alpha_c}
        with open(train_options_file, "w") as f:
            json.dump(train_options, f, indent=4)


        # get callable optimizer function
        import seq_optimizers
        opt_func = getattr(seq_optimizers, optimizer)
        import theano
        import theano.tensor as T
        import theano.sandbox.cuda
        theano.sandbox.cuda.use(devices.split(",")[0])
        tparams = OrderedDict()
        for param_name, param in params.items():
            tparams[param_name] = theano.shared(param)

        def pull_from_tparams(param_dict):
            params = OrderedDict()
            for param_name, param in param_dict.items():
                params[param_name] = param.get_value()
            return params

        logging.info("building model")
        inputs, cost, _ = build_model(tparams, dim_emb=dim_emb, encoder=encoder, decoder=decoder,
                                      dropout=dropout, n_words_target=n_words_target,
                                      decay_c=decay_c, alpha_c=alpha_c)
        grads = T.grad(cost, wrt=list(tparams.values()))

        # TODO: gradient clipping
        # if clip_c > 0.:
        #     g2 = 0.
        #     for g in grads:
        #         g2 += (g**2).sum()
        #     new_grads = []
        #     for g in grads:
        #         new_grads.append(T.switch(g2 > (clip_c**2),
        #                                        g / T.sqrt(g2) * clip_c,
        #                                        g))
        #     grads = new_grads

        logging.info("compiling model")
        learning_rate = T.scalar("learning_rate")
        f_grad_shared, f_update = opt_func(learning_rate, tparams, grads, inputs, cost)

        update_idx = 0
        early_stop = False
        best_params = params
        best_valid_error = np.inf
        patience_left = patience

        logging.info("starting training")
        for epoch_idx in range(1, epochs+1):

            for train_batch in train_data_iter:

                logging.debug("processing next data sample")
                cost = f_grad_shared(*train_batch)
                f_update(l_rate)
                update_idx += 1

                if update_idx % 1000 == 0:
                    logging.info("epoch {} update {}, cost of last processed batch: {}"
                                 .format(epoch_idx, update_idx, cost))

                if update_idx % valid_frequency == 0:
                    # FIXME: set noise to 0 if used
                    cur_valid_error = np.mean([f_grad_shared(*d) for d in valid_data_iter])
                    if cur_valid_error < best_valid_error:
                        best_params = pull_from_tparams(tparams)
                        best_valid_error = cur_valid_error
                        patience_left = patience
                    else:
                        patience_left -= 1

                    if patience_left == 0:
                        early_stop = True
                        break

                if update_idx % save_frequency == 0:
                    save_file = save_params(pull_from_tparams(tparams), save_to, epoch_update=(epoch_idx, update_idx))
                    logging.info("epoch {}, update {} saved to {}".format(epoch_idx, update_idx, save_file))

            if early_stop:
                break

        save_file = save_params(best_params, save_to)
        logging.info("saved best parameters to {}".format(save_file))

    logging.info("done!")


if __name__ == "__main__":
    train()
