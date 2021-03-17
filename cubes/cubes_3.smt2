; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   m - 6*n - 6
;               k^2 - 9*n*c + 9*n - 5*k - 18*c + 4
;               n*k + 2*n - k - 3*c + 1
;               n^2 + n - 1//3*k + 1//3
; RESULT:       refutation found in under 1 sec
(set-logic QF_NRA)
(declare-const m Real)
(declare-const n Real)
(declare-const c Real)
(declare-const k Real)
; Invariant (before loop body execution)
(assert (= (- m (- (* 6 n) 6)) 0))
(assert (= (- (* k k) (+ (* (* 9 n) c) (- (* 9 n) (- (* 5 k) (+ (* 18 c) 4))))) 0))
(assert (= (+ (* n k) (- (- (* 2 n) k) (+ (* 3 c) 1))) 0))
(assert (= (- (+ (* n n) n) (+ (* (/ 1 3) k) (/ 1 3))) 0))
; negated invariant (after loop body execution)
(assert (not (= (+ (* (+ n 1) (+ k m)) (- (- (* 2 (+ n 1)) (+ k m)) (+ (* 3 (+ c k)) 1))) 0)))
(check-sat)
(exit)