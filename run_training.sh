#!/usr/bin/env bash

# parameter set to same values as described in
# "Learning Phrase Representations using RNN Encoder–Decoder
# for Statistical Machine Translation" by Cho et al

export THEANO_FLAGS=floatX=float32

MODEL_LOC=$1
OPTIMIZER=$2
DEVICES=$3
LOGF=$4

# for this to run, prepare the fr-en europarl data
# and split the last 10k sentences for validation
#   cd data
#   ./prepare_europarl_data.sh fr en
#   ./splitN.sh europarl/europarl-v7.fr-en.fr.tok 10000
#   ./splitN.sh europarl/europarl-v7.fr-en.en.tok 10000

./pnmt.py \
  data/europarl/europarl-v7.fr-en.en.tok.top_1997723 \
  data/europarl/europarl-v7.fr-en.fr.tok.top_1997723 \
  data/europarl/europarl-v7.fr-en.en.tok.dct.json \
  data/europarl/europarl-v7.fr-en.fr.tok.dct.json \
  ${MODEL_LOC} \
  --optimizer ${OPTIMIZER} \
  --l-rate 0.1 \
  --devices ${DEVICES} \
  --dim-emb 100 \
  --dim-rnn 1000 \
  --n-words-source 15000 \
  --n-words-target 15000 \
  --epochs 500 \
  --batch-size 64 \
  --save-frequency 4500 \
  --log-file ${LOGF} \
  --clip-c 5
