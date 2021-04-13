; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANT:    y*x - y00*x00
; RESULT:       timed out
(set-logic NRA)
(declare-const y Real)
(declare-const x Real)
(declare-const x00 Real)
(declare-const y00 Real)
; invariant (before loop body execution)
(assert (= (- (* y x) (* y00 x00)) 0))
; negated invariant (after loop body execution)
(assert (not (= (- (* (* 2 y) (* x 0.5)) (* y00 x00)) 0)))
(check-sat)
(exit)