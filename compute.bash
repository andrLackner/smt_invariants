#!/bin/bash

vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_1.smt2 > ./cohencu/result_1.txt
vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_2.smt2 > ./cohencu/result_2.txt
vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_3.smt2 > ./cohencu/result_3.txt
vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_4.smt2 > ./cohencu/result_4.txt
vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_5.smt2 > ./cohencu/result_5.txt
vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_6.smt2 > ./cohencu/result_6.txt

vampire --input_syntax smtlib2 -t 5m ./cubes/cubes_1.smt2 > ./cubes/result_1.txt
vampire --input_syntax smtlib2 -t 5m ./cubes/cubes_1.smt2 > ./cubes/result_2.txt
vampire --input_syntax smtlib2 -t 5m ./cubes/cubes_1.smt2 > ./cubes/result_3.txt
vampire --input_syntax smtlib2 -t 5m ./cubes/cubes_1.smt2 > ./cubes/result_4.txt

vampire --input_syntax smtlib2 -t 5m ./eucliddiv/eucliddiv_1.smt2 > ./eucliddiv/result_1.txt
vampire --input_syntax smtlib2 -t 5m ./eucliddiv/eucliddiv_2.smt2 > ./eucliddiv/result_2.txt

vampire --input_syntax smtlib2 -t 5m ./freire1/freire1.smt2 > ./freire1/result.txt

vampire --input_syntax smtlib2 -t 5m ./freire2/freire2_1.smt2 > ./freire2/result_1.txt
vampire --input_syntax smtlib2 -t 5m ./freire2/freire2_2.smt2 > ./freire2/result_2.txt
vampire --input_syntax smtlib2 -t 5m ./freire2/freire2_3.smt2 > ./freire2/result_3.txt
vampire --input_syntax smtlib2 -t 5m ./freire2/freire2_4.smt2 > ./freire2/result_4.txt
vampire --input_syntax smtlib2 -t 5m ./freire2/freire2_5.smt2 > ./freire2/result_5.txt

vampire --input_syntax smtlib2 -t 5m ./intcbrt/intcbrt_1.smt2 > ./intcbrt/result_1.txt
vampire --input_syntax smtlib2 -t 5m ./intcbrt/intcbrt_2.smt2 > ./intcbrt/result_2.txt
vampire --input_syntax smtlib2 -t 5m ./intcbrt/intcbrt_3.smt2 > ./intcbrt/result_3.txt
vampire --input_syntax smtlib2 -t 5m ./intcbrt/intcbrt_4.smt2 > ./intcbrt/result_4.txt
vampire --input_syntax smtlib2 -t 5m ./intcbrt/intcbrt_5.smt2 > ./intcbrt/result_5.txt

vampire --input_syntax smtlib2 -t 5m ./simpleloop/simpleloop.smt2 > ./simpleloop/result.txt
vampire --input_syntax smtlib2 -t 5m ./simpleloop/simpleloopV2.smt2 > ./simpleloop/resultV2.txt