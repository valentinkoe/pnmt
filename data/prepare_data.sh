#! /usr/bin/env bash

# downloads training and test data set for fr-en
# train set: europarl v7
# test set: newsets 2011
# validation part of data is taken from train set

echo "generating english-french data"

echo "downloading europarl v7 data... (if not already present)"
wget -c -q http://www.statmt.org/europarl/v7/fr-en.tgz

# extract if necessary
if [[ ! -f europarl-v7.fr-en.en ]] || [[ ! -f europarl-v7.fr-en.fr ]]; then
    echo "extracting europarl data..."
    tar -xzf fr-en.tgz
fi

echo "downloading newstest '11 data... (if not already present)"
wget -c -q http://matrix.statmt.org/test_sets/newstest2011.tgz

# extract if necessary
if [ ! -d test2011 ]; then
    echo "extracting newstest data..."
    tar -xzf newstest2011.tgz
fi

# tokenize files with moses tokenizing script
for pair in "europarl-v7.fr-en.en","en" \
         "europarl-v7.fr-en.fr","fr" \
         "test2011/newstest2011.en","en" \
         "test2011/newstest2011.fr","fr"; do IFS=","; set -- $pair;
    if [ ! -f $1.tok ]; then
        echo "tokenizing $1"
        ../lib/moses/tokenizer.perl -q -l $2 -threads $(expr $(nproc) \* 2) < $1 > $1.tok
    fi
done

# split europarl in train and valid portion (if necessary)
# using 80% for training, 20% for validation
# this expression might not be 100% precise, but is a good enough aproximation
eightyPercent=$(expr $(wc -l europarl-v7.fr-en.fr.tok | cut -d ' ' -f 1) / 10 \* 8)
if [ ! -f europarl-v7.fr-en.en.train.tok ]; then
    echo "splitting english data into train/valid..."
    split -l $eightyPercent -d europarl-v7.fr-en.en.tok
    mv x00 europarl-v7.fr-en.en.train.tok
    mv x01 europarl-v7.fr-en.en.valid.tok
fi

if [ ! -f europarl-v7.fr-en.fr.train.tok ]; then
    echo "splitting french data into train/valid..."
    split -l $eightyPercent -d europarl-v7.fr-en.fr.tok
    mv x00 europarl-v7.fr-en.fr.train.tok
    mv x01 europarl-v7.fr-en.fr.valid.tok
fi

# generate dictionaries, for word and character based translation
for f in "europarl-v7.fr-en.en.tok" "europarl-v7.fr-en.fr.tok"; do
    if [ ! -f $f.dct.json ]; then
        echo "generating word dictionary for $f"
        ./build_dict.py $f $f.dct.json
    fi
    if [ ! -f $f.char.dct.json ]; then
        echo "generating char dictionary for $f"
        ./build_dict.py --char-dict $f $f.char.dct.json
    fi
done

