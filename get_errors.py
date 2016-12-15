#! /usr/bin/env python3

import os
import re
import json
import logging
from multiprocessing import Process, Queue, current_process
from collections import OrderedDict

import numpy as np

import click

from data_iterator import TextIterator
from params import load_params
from build_model import build_model


logging.basicConfig(level=logging.WARN,
                    format="%(asctime)s - %(levelname)s %(module)s - %(message)s",
                    datefmt="%Y-%m-%d %H:%M:%S")

import multiprocessing_logging
multiprocessing_logging.install_mp_handler()


def error_process(params, **model_options):

    import theano

    tparams = OrderedDict()
    for param_name, param in params.items():
        tparams[param_name] = theano.shared(param, name=param_name)

    process_name = current_process().name
    logging.info("building and compiling theano functions ({})".format(process_name))
    inputs, cost, _ = build_model(tparams, **model_options)

    f_cost = theano.function(inputs, cost)

    while True:
        cur_data = in_queue.get()
        if cur_data == "STOP":
            break
        out_queue.put(f_cost(*cur_data))


def get_error(model_files, dicts, source_file, target_file, num_threads):

    logging.info("Loading model options from {}".format(model_files[0]))
    with open(model_files[0], "r") as f:
        model_options = json.load(f)

    global dictionaries
    global dictionaries_rev
    logging.info("loading dictionaries from {}, {}".format(*dicts))
    with open(dicts[0], "r") as f1, open(dicts[1], "r") as f2:
        dictionaries = [json.load(f1), json.load(f2)]
    dictionaries_rev = [{v: k for k, v in d.items()} for d in dictionaries]

    logging.info("loading parameters from {}".format(model_files[1]))
    params = load_params(model_files[1])

    global in_queue
    global out_queue
    in_queue = Queue()
    out_queue = Queue()

    processes = [Process(target=error_process, name="process_{}".format(n),
                         args=(params,), kwargs=model_options)
                 for n in range(num_threads)]

    for p in processes:
        p.daemon = True
        p.start()

    ti = TextIterator(source_file=source_file, target_file=target_file,
                      source_dict=dictionaries[0], target_dict=dictionaries[1],
                      maxlen=model_options["maxlen"],
                      n_words_source=model_options["n_words_source"],
                      n_words_target=model_options["n_words_target"],
                      raw_characters=model_options["characters"])  # TODO

    num_batches = 0
    for batch in ti:
        in_queue.put(batch)
        num_batches += 1

    for _ in processes:
        in_queue.put("STOP")

    costs = []
    for num_processed in range(num_batches):
        costs.append(out_queue.get())
        percentage_done = (num_processed / num_batches) * 100
        print("{}: {:.2f}% of input processed".format(model_files[1], percentage_done),
              end="\r", flush=True)
    print()

    mean_cost = np.mean(costs)

    print(model_files[1], mean_cost)
    return mean_cost





command_group = click.Group()


@command_group.command()
@click.argument("model-files", type=click.Path(exists=True, dir_okay=False), nargs=2)
@click.argument("dicts", type=click.Path(exists=True, dir_okay=False), nargs=2)
@click.argument("source-file", type=click.Path(exists=True, dir_okay=False))
@click.argument("target-file", type=click.Path(exists=True, dir_okay=False))
@click.option("--num-threads", default=4, help="number of threads to use for error calculation")
def eval_one_model(model_files, dicts, source_file, target_file, num_threads):
    get_error(model_files, dicts, source_file, target_file, num_threads)


@command_group.command()
@click.argument("model-dir", type=click.Path(exists=True, dir_okay=True))
@click.argument("dicts", type=click.Path(exists=True, dir_okay=False), nargs=2)
@click.argument("source-file", type=click.Path(exists=True, dir_okay=False))
@click.argument("target-file", type=click.Path(exists=True, dir_okay=False))
@click.option("--num-threads", default=4, help="number of threads to use for error calculation")
def eval_multiple_models(model_dir, dicts, source_file, target_file, num_threads):
    """requires a directory containing npz files and *one* json file with model
    options that is valid for all these files
    npz files should be named XXX_epoch_EPOCH_update_UPDATE.npz"""


    # this needs to recompile the model for every model file and each process
    # but otherwise this would require more complicated handling of subprocesses...

    files = [os.path.join(model_dir, f) for f in os.listdir(model_dir)
             if os.path.isfile(os.path.join(model_dir, f))]
    model_npzs = [f for f in files if os.path.splitext(f)[1] == ".npz"]
    model_option_file = [f for f in files if os.path.splitext(f)[1] == ".json"][0]

    name_format = re.compile(r"epoch_(.+?)_update_(.+?)\.npz")  # TODO: as command line argument
    costs = []
    for i, m in enumerate(model_npzs, 1):
        re_match = re.search(name_format, m)
        epoch = int(re_match.group(1))
        update = int(re_match.group(2))
        time = os.path.getmtime(m)
        cost = get_error((model_option_file, m), dicts, source_file, target_file, num_threads)
        costs.append((time, epoch, update, cost, m))
        print("processed {}/{} models".format(i, len(model_npzs)))
    costs = sorted(costs, key=lambda x: x[0])

    for m_info in costs:
        print("\t".join(map(str, m_info)))


if __name__ == '__main__':
    command_group()
