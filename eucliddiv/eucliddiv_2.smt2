; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   y - y00
;               q*y00 - y00*q00 + r - r00
; RESULT:       refutation found in under 1 sec
(set-logic QF_NRA)
(declare-const y Real)
(declare-const q Real)
(declare-const r Real)
(declare-const y00 Real)
(declare-const q00 Real)
(declare-const r00 Real)
; Invariant (before loop body execution)
(assert (= (- y y00) 0))
(assert (= (- (* q y00) (- (+ (* y00 q00) r) r00)) 0))
; contradiction
(assert (not (= (- (* (+ q 1) y00) (- (+ (* y00 q00) (- r y)) r00)) 0)))

(check-sat)
(exit)