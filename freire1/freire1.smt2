; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   r^2 - r00^2 - r + 2*x + r00 - 2*x00
; RESULT:       timed out
(set-logic NRA)
(declare-const r Real)
(declare-const x Real)
(declare-const x00 Real)
(declare-const r00 Real)
; loop condition
(assert (> x r))
; Invariant (pre-loop execution)
(assert (= (- (* r r) (+ (- (* r00 r00) r) (- (+ (* 2 x) r00) (* 2 x00)))) 0))
; Invariant (post-loop execution)
(assert (not (= (- (* (+ r 1) (+ r 1)) (+ (- (* r00 r00) (+ r 1)) (- (+ (* 2 (- x r)) r00) (* 2 x00)))) 0)))
(check-sat)
(exit)