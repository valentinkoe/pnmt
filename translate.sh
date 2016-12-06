#!/usr/bin/env bash

export THEANO_FLAGS=floatX=float32

./translate.py \
  models/gpu_sgd_epoch_4_update_300.npz \
  data/test2011/newstest2011.en.tok \
  test_trans.txt \
  data/europarl-v7.fr-en.en.tok.dct.json \
  data/europarl-v7.fr-en.fr.tok.dct.json