#!/bin/bash

#z3 -smt2 -T:300 ./cohencu/cohencu_1.smt2 > ./cohencu/z3/result_1.txt
#z3 -smt2 -T:300 ./cohencu/cohencu_2.smt2 > ./cohencu/z3/result_2.txt
#z3 -smt2 -T:300 ./cohencu/cohencu_3.smt2 > ./cohencu/z3/result_3.txt
#z3 -smt2 -T:300 ./cohencu/cohencu_4.smt2 > ./cohencu/z3/result_4.txt
#z3 -smt2 -T:300 ./cohencu/cohencu_5.smt2 > ./cohencu/z3/result_5.txt
#z3 -smt2 -T:300 ./cohencu/cohencu_6.smt2 > ./cohencu/z3/result_6.txt

z3 -smt2 -T:300 ./cubes/cubes_1.smt2 > ./cubes/z3/result_1.txt
z3 -smt2 -T:300 ./cubes/cubes_1.smt2 > ./cubes/z3/result_2.txt
z3 -smt2 -T:300 ./cubes/cubes_1.smt2 > ./cubes/z3/result_3.txt
z3 -smt2 -T:300 ./cubes/cubes_1.smt2 > ./cubes/z3/result_4.txt

z3 -smt2 -T:300 ./eucliddiv/eucliddiv_1.smt2 > ./eucliddiv/z3/result_1.txt
z3 -smt2 -T:300 ./eucliddiv/eucliddiv_2.smt2 > ./eucliddiv/z3/result_2.txt

z3 -smt2 -T:300 ./euclidex/euclidex_1_a.smt2 > ./euclidex/z3/result_1_a.txt
z3 -smt2 -T:300 ./euclidex/euclidex_2_a.smt2 > ./euclidex/z3/result_2_a.txt
z3 -smt2 -T:300 ./euclidex/euclidex_3_a.smt2 > ./euclidex/z3/result_3_a.txt
z3 -smt2 -T:300 ./euclidex/euclidex_4_a.smt2 > ./euclidex/z3/result_4_a.txt
z3 -smt2 -T:300 ./euclidex/euclidex_5_a.smt2 > ./euclidex/z3/result_5_a.txt
z3 -smt2 -T:300 ./euclidex/euclidex_1_b.smt2 > ./euclidex/z3/result_1_b.txt
z3 -smt2 -T:300 ./euclidex/euclidex_2_b.smt2 > ./euclidex/z3/result_2_b.txt
z3 -smt2 -T:300 ./euclidex/euclidex_3_b.smt2 > ./euclidex/z3/result_3_b.txt
z3 -smt2 -T:300 ./euclidex/euclidex_4_b.smt2 > ./euclidex/z3/result_4_b.txt
z3 -smt2 -T:300 ./euclidex/euclidex_5_b.smt2 > ./euclidex/z3/result_5_b.txt

z3 -smt2 -T:300 ./freire1/freire1.smt2 > ./freire1/z3/result.txt

z3 -smt2 -T:300 ./freire2/freire2_1.smt2 > ./freire2/z3/result_1.txt
z3 -smt2 -T:300 ./freire2/freire2_2.smt2 > ./freire2/z3/result_2.txt
z3 -smt2 -T:300 ./freire2/freire2_3.smt2 > ./freire2/z3/result_3.txt
z3 -smt2 -T:300 ./freire2/freire2_4.smt2 > ./freire2/z3/result_4.txt
z3 -smt2 -T:300 ./freire2/freire2_5.smt2 > ./freire2/z3/result_5.txt

z3 -smt2 -T:300 ./intcbrt/intcbrt_1.smt2 > ./intcbrt/z3/result_1.txt
z3 -smt2 -T:300 ./intcbrt/intcbrt_2.smt2 > ./intcbrt/z3/result_2.txt
z3 -smt2 -T:300 ./intcbrt/intcbrt_3.smt2 > ./intcbrt/z3/result_3.txt
z3 -smt2 -T:300 ./intcbrt/intcbrt_4.smt2 > ./intcbrt/z3/result_4.txt
z3 -smt2 -T:300 ./intcbrt/intcbrt_5.smt2 > ./intcbrt/z3/result_5.txt

z3 -smt2 -T:300 ./simpleloop/simpleloop.smt2 > ./simpleloop/z3/result.txt
z3 -smt2 -T:300 ./simpleloop/simpleloopV2.smt2 > ./simpleloop/z3/resultV2.txt