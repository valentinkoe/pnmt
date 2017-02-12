#! /usr/bin/env bash

if [ $# -ne 2 ]
then
  echo "Usage: prepare_europarl_data.sh lang1 lang2"
  echo "see http://www.statmt.org/europarl/v7/ for available language pairs"
  echo "make sure to have the corresponding abbreviation files required by the moses tokenizer script"
  exit 1
fi

LANG_1=$1
LANG_2=$2
LANG_PAIR=${LANG_1}-${LANG_2}

echo "generating europarl data for language pair ${LANG_PAIR}"

echo "downloading europarl v7 data... (if not already present)"
wget -c -O europarl_${LANG_PAIR}.tgz http://www.statmt.org/europarl/v7/${LANG_PAIR}.tgz

mkdir -p europarl

# extract if necessary
if [[ ! -f europarl/europarl-v7.${LANG_PAIR}.${LANG_1} ]] || \
   [[ ! -f europarl/europarl-v7.${LANG_PAIR}.${LANG_2} ]]; then
    echo "extracting data..."
    tar -xzf europarl_${LANG_PAIR}.tgz -C europarl
fi

# tokenize files with moses tokenizing script and build dictionaries
for l in ${LANG_1} ${LANG_2}
do
    if [ ! -f europarl/europarl-v7.${LANG_PAIR}.${l}.tok ]; then
        echo "tokenizing europarl/europarl-v7.${LANG_PAIR}.${l}..."
        ../lib/moses/tokenizer.perl -q -l ${l} -threads $(expr $(nproc) \* 2) < europarl/europarl-v7.${LANG_PAIR}.${l} > europarl/europarl-v7.${LANG_PAIR}.${l}.tok
    fi
    if [ ! -f europarl/europarl-v7.${LANG_PAIR}.${l}.tok.dct.json ]; then
        echo "generating word dictionary for europarl/europarl-v7.${LANG_PAIR}.${l}.tok..."
        ./build_dict.py europarl/europarl-v7.${LANG_PAIR}.${l}.tok europarl/europarl-v7.${LANG_PAIR}.${l}.tok.dct.json
    fi
    if [ ! -f europarl/europarl-v7.${LANG_PAIR}.${l}.char.dct.json ]; then
        echo "generating char dictionary for europarl/europarl-v7.${LANG_PAIR}.${l}..."
        ./build_dict.py --char-dict europarl/europarl-v7.${LANG_PAIR}.${l} europarl/europarl-v7.${LANG_PAIR}.${l}.char.dct.json
    fi
done