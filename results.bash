#!/bin/bash


if [ "$#" -ne 3 ]; then
  echo "Usage: results PROVER RESULTDIR DATABASE"
  exit 2
fi


if [ "$1" = "vampireZ3" ]; then
  COL="vampireZ3"
  EXT="_vampireZ3"
elif [ "$1" = "vampireZ3_ind" ]; then
  COL="vampireZ3_ind"
  EXT="_vampireZ3"
elif [ "$1" = "vampireZ3_dev" ]; then
  COL="vampireZ3_dev"
  EXT="_vampire_dev"
elif [ "$1" = "z3" ]; then
  COL="z3"
  EXT="_z3"
else
  echo "Unknown prover $1"
  exit 1
fi


RESULT_DIR="$2/*.out"
DB_DIR=$3
BENCHMARKS=$(find $RESULT_DIR)

TABLE="\"results\""
COLS="(\"test_id\", \"type\", \"z3\", \"vampireZ3\", \"vampireZ3_ind\", \"vampireZ3_dev\")"


for BENCHMARK in $BENCHMARKS 
  do
  BENCHMARK_NAME=$(basename $BENCHMARK)
  BENCHMARK_ID="${BENCHMARK_NAME%$EXT.*}"
  
  SEL_QUERY="SELECT * FROM \"results\" WHERE \"test_id\"='$BENCHMARK_ID'"
  RESULT=$(sqlite3 $DB_DIR "$SEL_QUERY")

  if [[ $RESULT == "" ]]; then
    echo "[INFO] NO DB-ENTRY FOR \"$BENCHMARK_ID\": CREATING IT..."
    TYPE="simple"
    if [[ $BENCHMARK_ID == *"_func"* ]]; then
      TYPE="func"
    fi
    sqlite3 $DB_DIR "INSERT INTO $TABLE $COLS VALUES ('$BENCHMARK_ID', '$TYPE', 'unknown', 'unknown', 'unknown', 'unknown')"
    echo "[INFO] DONE"
  fi

  STATUS="unknown"
  LINES=$(tr -d '\0' <$BENCHMARK)
  while IFS= read -r LINE; do
    if [[ $COL == "vampireZ3" ]] || [[ $COL == "vampireZ3_ind" ]] || [[ $COL == "vampireZ3_dev" ]]; then
      if [[ $LINE == "% Termination reason: Refutation" ]]; then
        STATUS="solved"
        break
      elif [[ $LINE == *"Refutation found"* ]]; then
        STATUS="solved"
        break
      elif [[ $LINE == *"Proof not found"* ]]; then
        STATUS="timeout"
        break
      fi
    else
      if [[ $LINE == *"unsat"* ]]; then
        STATUS="solved"
        break
      elif [[ $LINE == *"unknown"* ]]; then
        STATUS="unknown"
        break
      elif [[ $LINE == *"sat"* ]]; then
        STATUS="err"
        break
      fi
    fi
  done <<< "$LINES"
  
  sqlite3 $DB_DIR "UPDATE $TABLE SET \"$COL\"='$STATUS' WHERE \"test_id\"='$BENCHMARK_ID'"

done