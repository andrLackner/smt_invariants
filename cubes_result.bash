#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: cubes_result INDIR"
  exit 2
fi

BENCHMARKS=$(find $1/cubes_inv*.out)
PREFIX_MEM="% Memory used \\[KB\\]: "
PREFIX_TIM="% Time elapsed: "

for BENCHMARK in $BENCHMARKS 
  do
  LINES=$(tr -d '\0' <$BENCHMARK)
  while IFS= read -r LINE; do
    if [[ $LINE =~ ^$PREFIX_MEM([0-9]+)$ ]]; then
        MEMORY=${BASH_REMATCH[1]}
    elif [[ $LINE =~ ^$PREFIX_TIM([0-9]+\.[0-9]+)[[:space:]]s$ ]]; then
        TIME=${BASH_REMATCH[1]}
    elif [[ $LINE =~ ^([0-9]+)\.[[:space:]].*$ ]]; then
        LENGTH=${BASH_REMATCH[1]}
    fi
  done <<< "$LINES"
  echo "$LENGTH;$TIME;$MEMORY"
done