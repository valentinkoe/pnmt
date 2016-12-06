#! /usr/bin/env python

# generates a dictionary in json format, with the

import json
from collections import Counter

import click


@click.command()
@click.argument("input-file", type=click.Path(exists=True, dir_okay=False))
@click.argument("output-file", type=click.Path(exists=False, dir_okay=False))
@click.option("--char-dict/--no-char-dict", default=False)
def get_dict(input_file, output_file, char_dict):

    with open(input_file) as f:
        text = f.read()

    counts = Counter(list(text) if char_dict else text.split())

    dct = {w[0]: i for i, w in enumerate(counts.most_common(), 2)}
    dct["UNK"] = 1
    dct["eos"] = 0

    with open(output_file, "w") as f:
        json.dump(dct, f, indent=4)  # FIXME: encoding error


if __name__ == "__main__":
    get_dict()
