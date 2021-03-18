#!/bin/bash

vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_1.smt2 > ./cohencu/vampire/result_1.txt
vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_2.smt2 > ./cohencu/vampire/result_2.txt
vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_3.smt2 > ./cohencu/vampire/result_3.txt
vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_4.smt2 > ./cohencu/vampire/result_4.txt
vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_5.smt2 > ./cohencu/vampire/result_5.txt
vampire --input_syntax smtlib2 -t 5m ./cohencu/cohencu_6.smt2 > ./cohencu/vampire/result_6.txt

vampire --input_syntax smtlib2 -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampire/result_1.txt
vampire --input_syntax smtlib2 -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampire/result_2.txt
vampire --input_syntax smtlib2 -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampire/result_3.txt
vampire --input_syntax smtlib2 -t 5m ./cubes/cubes_1.smt2 > ./cubes/vampire/result_4.txt

vampire --input_syntax smtlib2 -t 5m ./eucliddiv/eucliddiv_1.smt2 > ./eucliddiv/vampire/result_1.txt
vampire --input_syntax smtlib2 -t 5m ./eucliddiv/eucliddiv_2.smt2 > ./eucliddiv/vampire/result_2.txt

vampire --input_syntax smtlib2 -t 5m ./freire1/freire1.smt2 > ./freire1/vampire/result.txt

vampire --input_syntax smtlib2 -t 5m ./freire2/freire2_1.smt2 > ./freire2/vampire/result_1.txt
vampire --input_syntax smtlib2 -t 5m ./freire2/freire2_2.smt2 > ./freire2/vampire/result_2.txt
vampire --input_syntax smtlib2 -t 5m ./freire2/freire2_3.smt2 > ./freire2/vampire/result_3.txt
vampire --input_syntax smtlib2 -t 5m ./freire2/freire2_4.smt2 > ./freire2/vampire/result_4.txt
vampire --input_syntax smtlib2 -t 5m ./freire2/freire2_5.smt2 > ./freire2/vampire/result_5.txt

vampire --input_syntax smtlib2 -t 5m ./intcbrt/intcbrt_1.smt2 > ./intcbrt/vampire/result_1.txt
vampire --input_syntax smtlib2 -t 5m ./intcbrt/intcbrt_2.smt2 > ./intcbrt/vampire/result_2.txt
vampire --input_syntax smtlib2 -t 5m ./intcbrt/intcbrt_3.smt2 > ./intcbrt/vampire/result_3.txt
vampire --input_syntax smtlib2 -t 5m ./intcbrt/intcbrt_4.smt2 > ./intcbrt/vampire/result_4.txt
vampire --input_syntax smtlib2 -t 5m ./intcbrt/intcbrt_5.smt2 > ./intcbrt/vampire/result_5.txt

vampire --input_syntax smtlib2 -t 5m ./simpleloop/simpleloop.smt2 > ./simpleloop/vampire/result.txt
vampire --input_syntax smtlib2 -t 5m ./simpleloop/simpleloopV2.smt2 > ./simpleloop/vampire/resultV2.txt