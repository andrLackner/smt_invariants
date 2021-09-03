#!/bin/bash

PROVER="z3"
FLAGS="-smt2 -T:300 -st"

trap ctrl_c INT

function ctrl_c() {
    echo "Okay... Bye then.."
    exit 1
}


if [ "$#" -lt 2 ]; then
    echo "Usage: compute PROVER OUTDIR [benchmark]"
    exit 1
fi

OUTDIR=$2

if [ "$1" = "vampire" ]; then
  PROVER="vampire"
  FLAGS="--input_syntax smtlib2 --mode portfolio -sched smtcomp -t 5m"
elif [ "$1" = "vampireZ3" ]; then
  PROVER="vampireZ3"
  FLAGS="--input_syntax smtlib2 --mode portfolio -sched smtcomp -t 5m"
elif [ "$1" = "vampireZ3_dev" ]; then
  PROVER="vampire_dev"
  FLAGS="--input_syntax smtlib2 --mode portfolio -sched smtcomp -polymul force -t 5m"
elif [ "$1" = "vampireZ3_ind" ]; then
  PROVER="vampireZ3"
  FLAGS="--input_syntax smtlib2 --mode portfolio -sched smtcomp --schedule induction -t 5m"
fi 

mkdir -p $OUTDIR


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BENCHMARKS_DIR="$SCRIPT_DIR/NIA/invariants"

if [ "$#" -eq 3 ]; then
  BENCHMARKS=$(find $3 -type f -name "*.smt2") 
else
  BENCHMARKS=$(find $BENCHMARKS_DIR -type f -name "*.smt2")
fi

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
