#!/bin/bash

#echo "cohencu"
#vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_1.smt2 > ./cohencu/vampire/result_1.txt
#vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_2.smt2 > ./cohencu/vampire/result_2.txt
#vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_3.smt2 > ./cohencu/vampire/result_3.txt
#vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_4.smt2 > ./cohencu/vampire/result_4.txt
#vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_5.smt2 > ./cohencu/vampire/result_5.txt
#vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./cohencu/cohencu_6.smt2 > ./cohencu/vampire/result_6.txt
#echo "FINISHED"

now=$(date +%H:%M)
echo -n "cubes $now...."
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampire/result_1.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampire/result_2.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampire/result_3.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampire/result_4.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "euclidiv $now...."
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./eucliddiv/eucliddiv_1.smt2 > ./eucliddiv/vampire/result_1.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./eucliddiv/eucliddiv_2.smt2 > ./eucliddiv/vampire/result_2.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "euclidex $now...."
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_1_a.smt2 > ./euclidex/vampire/result_1_a.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_2_a.smt2 > ./euclidex/vampire/result_2_a.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_3_a.smt2 > ./euclidex/vampire/result_3_a.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_4_a.smt2 > ./euclidex/vampire/result_4_a.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_5_a.smt2 > ./euclidex/vampire/result_5_a.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_1_b.smt2 > ./euclidex/vampire/result_1_b.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_2_b.smt2 > ./euclidex/vampire/result_2_b.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_3_b.smt2 > ./euclidex/vampire/result_3_b.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_4_b.smt2 > ./euclidex/vampire/result_4_b.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./euclidex/euclidex_5_b.smt2 > ./euclidex/vampire/result_5_b.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "freire1 $now...."
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./freire1/freire1.smt2 > ./freire1/vampire/result.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "freire2 $now...."
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./freire2/freire2_1.smt2 > ./freire2/vampire/result_1.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./freire2/freire2_2.smt2 > ./freire2/vampire/result_2.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./freire2/freire2_3.smt2 > ./freire2/vampire/result_3.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./freire2/freire2_4.smt2 > ./freire2/vampire/result_4.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./freire2/freire2_5.smt2 > ./freire2/vampire/result_5.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "intcbrt $now...."
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./intcbrt/intcbrt_1.smt2 > ./intcbrt/vampire/result_1.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./intcbrt/intcbrt_2.smt2 > ./intcbrt/vampire/result_2.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./intcbrt/intcbrt_3.smt2 > ./intcbrt/vampire/result_3.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./intcbrt/intcbrt_4.smt2 > ./intcbrt/vampire/result_4.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./intcbrt/intcbrt_5.smt2 > ./intcbrt/vampire/result_5.txt
echo "FINISHED"

now=$(date +%H:%M)
echo -n "simpleloop $now...."
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./simpleloop/simpleloop.smt2 > ./simpleloop/vampire/result.txt
vampire --input_syntax smtlib2 --mode smtcomp -t 5m ./simpleloop/simpleloopV2.smt2 > ./simpleloop/vampire/resultV2.txt
echo "FINISHED"