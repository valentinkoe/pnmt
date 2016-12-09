#!/usr/bin/env bash

export THEANO_FLAGS=floatX=float32

MODEL_OPTS=$1
MODEL=$2
IN_FILE=$3
OUT_FILE=$4

./translate.py \
  ${MODEL_OPTS} \
  ${MODEL} \
  data/europarl-v7.fr-en.en.tok.dct.json \
  data/europarl-v7.fr-en.fr.tok.dct.json \
  ${IN_FILE} \
  ${OUT_FILE}
