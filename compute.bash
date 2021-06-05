#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BENCHMARKS_DIR="$SCRIPT_DIR/NIA/invariants/**/*.smt2"
BENCHMARKS=$(find $BENCHMARKS_DIR)

PROVER="z3"
FLAGS="-smt2 -T:300"

trap ctrl_c INT

function ctrl_c() {
    echo "Okay... Bye then.."
    exit 1
}


if [ "$#" -ne 2 ]; then
    echo "Usage: compute {prover} {outdir}"
    exit 1
fi

OUTDIR=$2

if [ "$1" = "vampire" ]; then
  PROVER="vampire"
  FLAGS="--input_syntax smtlib2 --mode portfolio -sched smtcomp -t 5m"
elif [ "$1" = "vampireZ3" ]; then
  PROVER="vampireZ3"
  FLAGS="--input_syntax smtlib2 --mode portfolio -sched smtcomp -t 5m"
elif [ "$1" = "vampireZ3_v2" ]; then
  PROVER="vampireZ3"
  FLAGS="--input_syntax smtlib2 --mode smtcomp -t 5m"
fi 

mkdir -p $OUTDIR

for BENCHMARK in $BENCHMARKS 
  do
  OUT="$OUTDIR/$(basename -s .smt2 $BENCHMARK)_$PROVER.out"
  
  if [ -f "$OUT" ]; then
    if [ "$OUT" -nt "$BENCHMARK" ]; then
      echo "Skipping $BENCHMARK"
      continue
    fi
  fi

  echo "Executing $(basename $BENCHMARK) with $PROVER"
  timeout "5m" $PROVER $FLAGS $BENCHMARK > $OUT
done