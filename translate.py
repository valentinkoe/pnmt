#!/usr/bin/env python3

import json
import logging
from multiprocessing import Process, Queue, current_process
from collections import OrderedDict
from copy import copy

import numpy as np

import click

from params import load_params
from build_model import build_model


logging.basicConfig(level=logging.INFO,
                    format="%(asctime)s - %(levelname)s %(module)s - %(message)s",
                    datefmt="%Y-%m-%d %H:%M:%S")

import multiprocessing_logging
multiprocessing_logging.install_mp_handler()


def translation_process(params, k=1, stochastic=True, argmax=False, **model_options):

    import theano

    tparams = OrderedDict()
    for param_name, param in params.items():
        tparams[param_name] = theano.shared(param, name=param_name)

    process_name = current_process().name
    logging.info("building and compiling theano functions ({})".format(process_name))
    _, _, (f_init_vars, f_next_vars) = build_model(tparams, **model_options)

    f_init = theano.function(*f_init_vars)
    f_next = theano.function(*f_next_vars)

    # generate sample, either with stochastic sampling or beam search as given to its parent function
    def translate_sample(x):
        """given the functions f_init and f_next translates the sentence representation x"""

        sample = []
        sample_score = []
        if stochastic:
            sample_score = 0

        live_k = 1
        dead_k = 0

        hyp_samples = [[]] * live_k
        hyp_scores = np.zeros(live_k, dtype=theano.config.floatX)

        # get initial state of decoder rnn and encoder context
        ret = f_init(x)
        next_state, ctx0 = ret[0], ret[1]
        next_w = -1 * np.ones((1,), dtype="int32")  # indicates beginning of sentence

        for _ in range(model_options["maxlen"]):
            ctx = np.tile(ctx0, [live_k, 1])
            inps = [next_w, ctx, next_state]
            ret = f_next(*inps)
            next_p, next_w, next_state = ret[0], ret[1], ret[2]

            if stochastic:
                if argmax:
                    nw = next_p[0].argmax()
                else:
                    nw = next_w[0]
                sample.append(nw)
                sample_score -= np.log(next_p[0, nw])
                if nw == 0:
                    break
            else:
                cand_scores = hyp_scores[:, None] - np.log(next_p)
                cand_flat = cand_scores.flatten()
                ranks_flat = cand_flat.argsort()[:(k-dead_k)]

                voc_size = next_p.shape[1]
                trans_indices = ranks_flat / voc_size
                word_indices = ranks_flat % voc_size
                costs = cand_flat[ranks_flat]

                new_hyp_samples = []
                new_hyp_scores = np.zeros(k-dead_k, dtype=theano.config.floatX)
                new_hyp_states = []

                for i, [ti, wi] in enumerate(zip(trans_indices, word_indices)):
                    new_hyp_samples.append(hyp_samples[ti]+[wi])
                    new_hyp_scores[i] = copy(costs[i])
                    new_hyp_states.append(copy(next_state[ti]))

                # check the finished samples
                new_live_k = 0
                hyp_samples = []
                hyp_scores = []
                hyp_states = []

                for i in range(len(new_hyp_samples)):
                    if new_hyp_samples[i][-1] == 0:
                        sample.append(new_hyp_samples[i])
                        sample_score.append(new_hyp_scores[i])
                        dead_k += 1
                    else:
                        new_live_k += 1
                        hyp_samples.append(new_hyp_samples[i])
                        hyp_scores.append(new_hyp_scores[i])
                        hyp_states.append(new_hyp_states[i])
                hyp_scores = np.array(hyp_scores)
                live_k = new_live_k

                if new_live_k < 1:
                    break
                if dead_k >= k:
                    break

                next_w = np.array([w[-1] for w in hyp_samples], dtype="int32")
                next_state = np.array(hyp_states)

        if not stochastic:
            # dump every remaining one
            if live_k > 0:
                for idx in range(live_k):
                    sample.append(hyp_samples[idx])
                    sample_score.append(hyp_scores[idx])

        return sample, sample_score

    # fetch samples from the input queue, translate them and push them to the output queue
    # until a stop signal is received
    while True:
        cur_data = in_queue.get()
        if cur_data == "STOP":
            break

        sample_idx, sample = cur_data

        # split into units (characters or tokens)
        sample = list(sample) if model_options["characters"] else sample.split()

        # words to word_idxs + trailing zero for eos
        sample = np.array([widx if widx < model_options["n_words_source"] else 1
                           for widx in [dictionaries[0].get(w, 1) for w in sample]] + [0],
                          dtype="int32")

        # idx list to vector
        sample = sample.reshape((len(sample), 1))

        # translate
        widx_translation, score = translate_sample(sample)  # yields sample AND score as tuple

        # to words
        def to_words(sample):
            words = []
            for widx in sample:
                if widx == 0:  # reached eos
                    break
                words.append(dictionaries_rev[1][widx])
            return words

        translation = to_words(widx_translation)

        translation = "".join(translation) if model_options["characters"] else " ".join(translation)

        # join
        out_queue.put((sample_idx, translation))


@click.command()
@click.argument("model-files", type=click.Path(exists=True, dir_okay=False), nargs=2)
@click.argument("dicts", type=click.Path(exists=True, dir_okay=False), nargs=2)
@click.argument("input-file", type=click.Path(exists=True, dir_okay=False))
@click.argument("output-file", type=click.Path(exists=False, dir_okay=False))
@click.option("--beam-size", default=5, help="beam size when using beam search, "
                                             "has no effect when using stochastic sampling")
@click.option("--stochastic/--no-stochastic", default=True,
              help="whether to use stochastic sampling or not")
@click.option("--argmax/--no-argmax", default=False,
              help="using just the the max probability for stochastic sampling")
@click.option("--num-threads", default=4, help="number of threads to use for translation")
def translate(model_files, input_file, output_file, dicts, beam_size,
              stochastic, argmax, num_threads):

    logging.info("Loading model options from {}".format(model_files[0]))
    with open(model_files[0], "r") as f:
        model_options = json.load(f)

    global dictionaries
    global dictionaries_rev
    logging.info("loading dictionaries from {}, {}".format(*dicts))
    with open(dicts[0], "r") as f1, open(dicts[1], "r") as f2:
        dictionaries = [json.load(f1), json.load(f2)]
    dictionaries_rev = [{v: k for k, v in d.items()} for d in dictionaries]

    # special tokens are
    # "UNK" ~ 1
    # "eos" ~ 0

    logging.info("loading parameters from {}".format(model_files[1]))
    params = load_params(model_files[1])

    global in_queue
    global out_queue
    in_queue = Queue()
    out_queue = Queue()

    processes = [Process(target=translation_process, name="process_{}".format(n),
                         args=(params, beam_size, stochastic, argmax),
                         kwargs=model_options)
                 for n in range(num_threads)]

    for p in processes:
        p.daemon = True
        p.start()

    logging.info("translating {}".format(input_file))
    n_lines = 0
    with open(input_file, "r") as f:
        for line_idx, line in enumerate(f):
            in_queue.put((line_idx, line))
            n_lines += 1

    for _ in processes:
        in_queue.put("STOP")

    result = []
    for num_processed in range(n_lines):
        result.append(out_queue.get())
        percentage_done = (num_processed / n_lines)*100
        print("{:.2f}% of input translated".format(percentage_done), end="\r", flush=True)
    # got the translations with their indices in the original file
    # need to sort them again, because the order may be messed up due to multiple processes
    result = sorted(result, key=lambda x: x[0])
    _, translations = zip(*result)

    logging.info("writing translations to {}".format(output_file))
    with open(output_file, "w") as f_out:
        for translation in translations:
            f_out.write(translation + "\n")


if __name__ == '__main__':
    translate()
