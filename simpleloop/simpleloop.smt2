; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; Invariant:    y*x - y00*x00
; RESULT:       solve under one second
(set-logic NIA)
(declare-const y Int)
(declare-const x Int)
(declare-const x00 Int)
(declare-const y00 Int)
; Invariant (before loop body execution)
(assert (= (- (* y x) (* y00 x00)) 0))
; negeated Invariant (after loop body execution)
(assert (not (= (- (* (* 2 y) (div x 2)) (* y00 x00)) 0)))
(check-sat)
(exit)