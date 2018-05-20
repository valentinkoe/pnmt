#!/usr/bin/env bash

# splits off the last N lines of the given file
# additionally generates a file with the first N lines of the given file

if [ $# -ne 2 ]
then
  echo "Usage: splitN.sh file n"
  exit 1
fi

FILE=$1
N=$2

NUM_LINES=$(wc -l ${FILE} | cut -d ' ' -f 1)

if [ $NUM_LINES -lt ${N} ]
then
    echo "file contains only ${NUM_LINES} lines, can't split!"
    exit 1
fi

splitAt=$(expr ${NUM_LINES} - ${N})

echo "splitting last ${N} lines from ${FILE}"

split -l ${splitAt} -d ${FILE}
mv x00 ${FILE}.top_${splitAt}
mv x01 ${FILE}.last_${N}
head -n ${N} ${FILE} > ${FILE}.top_${N}
