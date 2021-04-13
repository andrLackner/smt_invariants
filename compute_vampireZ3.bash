#!/bin/bash

now=$(date +%H:%M)
echo -n "cohencu $now...."
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_1.smt2 > ./cohencu/vampireZ3/result_1.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_2.smt2 > ./cohencu/vampireZ3/result_2.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_3.smt2 > ./cohencu/vampireZ3/result_3.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_4.smt2 > ./cohencu/vampireZ3/result_4.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_5.smt2 > ./cohencu/vampireZ3/result_5.txt
ampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_6.smt2 > ./cohencu/vampireZ3/result_6.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "cubes $now...."
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampireZ3/result_1.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampireZ3/result_2.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampireZ3/result_3.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampireZ3/result_4.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "euclidiv $now...."
vampireZ3 --input_syntax smtlib2 -t 5m ./eucliddiv/eucliddiv_1.smt2 > ./eucliddiv/vampireZ3/result_1.txt
vampireZ3 --input_syntax smtlib2 -t 5m ./eucliddiv/eucliddiv_2.smt2 > ./eucliddiv/vampireZ3/result_2.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "euclidex $now...."
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_1_a.smt2 > ./euclidex/vampireZ3/result_1_a.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_2_a.smt2 > ./euclidex/vampireZ3/result_2_a.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_3_a.smt2 > ./euclidex/vampireZ3/result_3_a.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_4_a.smt2 > ./euclidex/vampireZ3/result_4_a.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_5_a.smt2 > ./euclidex/vampireZ3/result_5_a.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_1_b.smt2 > ./euclidex/vampireZ3/result_1_b.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_2_b.smt2 > ./euclidex/vampireZ3/result_2_b.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_3_b.smt2 > ./euclidex/vampireZ3/result_3_b.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_4_b.smt2 > ./euclidex/vampireZ3/result_4_b.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_5_b.smt2 > ./euclidex/vampireZ3/result_5_b.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "freire1 $now...."
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./freire1/freire1.smt2 > ./freire1/vampireZ3/result.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "freire2 $now...."
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./freire2/freire2_1.smt2 > ./freire2/vampireZ3/result_1.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./freire2/freire2_2.smt2 > ./freire2/vampireZ3/result_2.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./freire2/freire2_3.smt2 > ./freire2/vampireZ3/result_3.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./freire2/freire2_4.smt2 > ./freire2/vampireZ3/result_4.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./freire2/freire2_5.smt2 > ./freire2/vampireZ3/result_5.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "intcbrt $now...."
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./intcbrt/intcbrt_1.smt2 > ./intcbrt/vampireZ3/result_1.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./intcbrt/intcbrt_2.smt2 > ./intcbrt/vampireZ3/result_2.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./intcbrt/intcbrt_3.smt2 > ./intcbrt/vampireZ3/result_3.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./intcbrt/intcbrt_4.smt2 > ./intcbrt/vampireZ3/result_4.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./intcbrt/intcbrt_5.smt2 > ./intcbrt/vampireZ3/result_5.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "simpleloop $now...."
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./simpleloop/simpleloop.smt2 > ./simpleloop/vampireZ3/result.txt
vampireZ3 --input_syntax smtlib2 --mode smtcomp -t 5m ./simpleloop/simpleloopV2.smt2 > ./simpleloop/vampireZ3/resultV2.txt
echo "FINISHED"