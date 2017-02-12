#! /usr/bin/env bash

# downloads newstest data and tokenizes files for the given languages

if [ $# -lt 1 ]
then
  echo "Usage: prepare_newstest_data.sh lang1 lang2 ..."
  exit 1
fi

echo "downloading newstest '11 data... (if not already present)"
wget -c -q http://matrix.statmt.org/test_sets/newstest2011.tgz

# extract if necessary
if [ ! -d test2011 ]; then
    echo "extracting newstest data..."
    tar -xzf newstest2011.tgz
fi

for l in $@
do
    if [ ! -f test2011/newstest2011.${l}.tok ]; then
        echo "tokenizing test2011/newstest2011.${l} ..."
        ../lib/moses/tokenizer.perl -l ${l} -threads $(expr $(nproc) \* 2) < test2011/newstest2011.${l} > test2011/newstest2011.${l}.tok
    fi
done
