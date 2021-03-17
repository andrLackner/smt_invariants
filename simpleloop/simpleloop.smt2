; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; Invariant:    y*x - y00*x00
; RESULT:       solve under one second
(set-logic QF_NRA)
(declare-const y Real)
(declare-const x Real)
(declare-const x00 Real)
(declare-const y00 Real)
; Invariant (before loop body execution)
(assert (= (- (* y x) (* y00 x00)) 0))
; negeated Invariant (after loop body execution)
(assert (not (= (- (* (* 2 y) (/ x 2)) (* y00 x00)) 0)))
(check-sat)
(exit)