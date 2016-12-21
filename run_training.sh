#!/usr/bin/env bash

# parameter set to same values as described in
# "Learning Phrase Representations using RNN Encoder–Decoder
# for Statistical Machine Translation" by Cho et al

export THEANO_FLAGS=floatX=float32

MODEL_LOC=$1
OPTIMIZER=$2
DEVICES=$3
LOGF=$4

./pnmt.py \
  data/europarl-v7.fr-en.en.train.tok \
  data/europarl-v7.fr-en.fr.train.tok \
  data/europarl-v7.fr-en.en.tok.dct.json \
  data/europarl-v7.fr-en.fr.tok.dct.json \
  ${MODEL_LOC} \
  --optimizer ${OPTIMIZER} \
  --devices ${DEVICES} \
  --dim-emb 100 \
  --dim-rnn 1000 \
  --n-words-source 15000 \
  --n-words-target 15000 \
  --epochs 500 \
  --batch-size 64 \
  --save-frequency 5000 \
  --log-file ${LOGF}


#  --lrate ${LEARNING_RATE}