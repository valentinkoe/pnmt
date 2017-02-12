#! /usr/bin/env bash

if [ $# -ne 2 ]
then
  echo "Usage: prepare_ted_data.sh lang1 lang2"
  echo "see wit3.fbk.eu/mt.php?release=2016-01 for available language pairs"
  echo "make sure to have the corresponding abbreviation files required by the moses tokenizer script"
  exit 1
fi

LANG_1=$1
LANG_2=$2
LANG_PAIR=${LANG_1}-${LANG_2}

echo "generating tedtalk data for language pair ${LANG_PAIR}"

echo "downloading data..."
wget -c -O tedtalk_${LANG_PAIR}.tgz https://wit3.fbk.eu/archive/2016-01/texts/${LANG_1}/${LANG_2}/${LANG_PAIR}.tgz

echo "extracting data..."
mkdir -p tedtalk
tar -xzf tedtalk_${LANG_PAIR}.tgz -C tedtalk

for l in ${LANG_1} ${LANG_2}
do
    echo "processing" tedtalk/${LANG_PAIR}/train.tags.${LANG_PAIR}.${l} "..."
    grep "^[^<]" tedtalk/${LANG_PAIR}/train.tags.${LANG_PAIR}.${l} > tedtalk/${LANG_PAIR}.${l}
    echo "tokenizing (${l})..."
    ../lib/moses/tokenizer.perl -l ${l} -threads $(expr $(nproc) \* 2) < tedtalk/${LANG_PAIR}.${l} > tedtalk/${LANG_PAIR}.${l}.tok
    echo "building word dictionary (${l})..."
    ./build_dict.py tedtalk/${LANG_PAIR}.${l}.tok tedtalk/${LANG_PAIR}.${l}.tok.dct.json
    echo "building char dictionary (${l})..."
    ./build_dict.py --char-dict tedtalk/${LANG_PAIR}.${l} tedtalk/${LANG_PAIR}.${l}.char.dct.json
done
