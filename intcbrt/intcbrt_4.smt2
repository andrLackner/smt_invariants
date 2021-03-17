; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   r^2 - r00^2 - r + 2*x + r00 - 2*x00
;               r*r00^2 - r00^3 - 1//6*s*r - 1//3*r*s00 + 1//2*s00*r00 + 1//4*s - 1//4*r - 1//2*x - 1//4*s00 + 1//4*r00 + 1//2*x00
;               s*r*r00 - r*s00*r00 - s*r00^2 + s00*r00^2 + 1//3*s^2 - 3//2*s*r + 3*r*x + 1//3*s*s00 + 3//2*r*s00 - 2//3*s00^2 - 3//2*s*r00 + 3*x*r00 + 3//2*s00*r00 - 3*r*x00 - 3*r00*x00 + 1//2*s - 1//2*s00
;               s^2*r + s*r*s00 - 2*r*s00^2 + 2*s^2*r00 + 18*r*x*r00 - s*s00*r00 - s00^2*r00 - 18*s*r00^2 + 18*x*r00^2 + 18*s00*r00^2 - 18*r*r00*x00 - 18*r00^2*x00 + 3//2*s^2 - 12*s*r + 3*s*x + 27*r*x + 6*s*s00 + 12*r*s00 - 3*x*s00 - 15//2*s00^2 - 12*s*r00 + 27*x*r00 + 12*s00*r00 - 3*s*x00 - 27*r*x00 + 3*s00*x00 - 27*r00*x00 + 9//2*s - 9//2*s00
;               s^2*r00^2 - s00^2*r00^2 - 6*s*r00^3 + 12*x*r00^3 + 6*s00*r00^3 - 12*r00^3*x00 - 1//9*s^3 - 1//3*s^2*s00 + 4//9*s00^3 + 3*s*s00*r00 - 6*x*s00*r00 - 3*s00^2*r00 + s*r00^2 - s00*r00^2 + 6*s00*r00*x00 + 5//12*s^2 - 3*s*x + 3*x^2 - 11//6*s*s00 + 3*x*s00 + 17//12*s00^2 + 3//2*s*r00 - 3*x*r00 - 3//2*s00*r00 + 3*s*x00 - 6*x*x00 - 3*s00*x00 + 3*r00*x00 + 3*x00^2 - 1//4*s + 1//4*s00
; RESULT:       timed out
(set-logic QF_NRA)
(declare-const x Real)
(declare-const r Real)
(declare-const s Real)
(declare-const x00 Real)
(declare-const r00 Real)
(declare-const s00 Real)
; Invariant (pre-loop execution)
(assert (= (- (* r r) (- (* r00 r00) (+ (* (/ 1 3) s) (* (/ 1 3) s00)))) 0))
(assert (= (- (* (* r r00) r00) (- (* (* r00 r00) r00) (- (* (* (/ 1 6) s) r) (+ (* (* (/ 1 3) r) s00) (+ (* (* (/ 1 2) s00) r00) (- (* (/ 1 4) s) (- (* (/ 1 4) r) (- (* (/ 1 2) x) (+ (* (/ 1 4) s00) (+ (* (/ 1 4) r00) (* (/ 1 2) x00))))))))))) 0))
(assert (= (- (* (* s r) r00) (- (* (* r s00) r00) (+ (* (* s r00) r00) (+ (* (* s00 r00) r00) (- (* (* (/ 1 3) s) s) (+ (* (* (/ 3 2) s) r) (+ (* (* 3 r) x) (+ (* (* (/ 1 3) s) s00) (- (* (* (/ 3 2) r) s00) (- (* (* (/ 2 3) s00) s00) (+ (* (* (/ 3 2) s) r00) (+ (* (* 3 x) r00) (- (* (* (/ 3 2) s00) r00) (- (* (* 3 r) x00) (+ (* (* 3 r00) x00) (- (* (/ 1 2) s) (* (/ 1 2) s00))))))))))))))))) 0))
(assert (= (+ (* (* s s) r) (- (* (* s r) s00) (+ (* (* (* 2 r) s00) s00) (+ (* (* (* 2 s) s) r00) (- (* (* (* 18 r) x) r00) (- (* (* s s00) r00) (- (* (* s00 s00) r00) (+ (* (* (* 18 s) r00) r00) (+ (* (* (* 18 x) r00) r00) (- (* (* (* 18 s00) r00) r00) (- (* (* (* 18 r) r00) x00) (+ (* (* (* 18 r00) r00) x00) (- (* (* (/ 3 2) s) s) (+ (* (* 12 s) r) (+ (* (* 3 s) x) (+ (* (* 27 r) x) (+ (* (* 6 s) s00) (- (* (* 12 r) s00) (- (* (* 3 x) s00) (- (* (* (/ 15 2) s00) s00) (+ (* (* 12 s) r00) (+ (* (* 27 x) r00) (- (* (* 12 s00) r00) (- (* (* 3 s) x00) (+ (* (* 27 r) x00) (- (* (* 3 s00) x00) (+ (* (* 27 r00) x00) (- (* (/ 9 2) s) (* (/ 9 2) s00))))))))))))))))))))))))))))) 0))
(assert (= (- (* (* (* s s) r00) r00) (- (* (* (* s00 s00) r00) r00) (+ (* (* (* (* 6 s) r00) r00) r00) (+ (* (* (* (* 12 x) r00) r00) r00) (- (* (* (* (* 6 s00) r00) r00) r00) (- (* (* (* (* 12 r00) r00) r00) x00) (- (* (* (* (/ 1 9) s) s) s) (+ (* (* (* (/ 1 3) s) s) s00) (+ (* (* (* (/ 4 9) s00) s00) s00) (- (* (* (* 3 s) s00) r00) (- (* (* (* 6 x) s00) r00) (+ (* (* (* 3 s00) s00) r00) (- (* (* s r00) r00) (+ (* (* s00 r00) r00) (+ (* (* (* 6 s00) r00) x00) (- (* (* (/ 5 12) s) s) (+ (* (* 3 s) x) (- (* (* 3 x) x) (+ (* (* (/ 11 6) s) s00) (+ (* (* 3 x) s00) (+ (* (* (/ 17 12) s00) s00) (- (* (* (/ 3 2) s) r00) (- (* (* 3 x) r00) (+ (* (* (/ 3 2) s00) r00) (- (* (* 3 s) x00) (- (* (* 6 x) x00) (+ (* (* 3 s00) x00) (+ (* (* 3 r00) x00) (- (* (* 3 x00) x00) (+ (* (/ 1 4) s) (* (/ 1 4) s00))))))))))))))))))))))))))))))) 0))
; Invariant (post-loop execution)
(assert (= (- (* (+ r 1) (+ r 1)) (- (* r00 r00) (+ (* (/ 1 3) (+ s (+ (* 6 r) 3))) (* (/ 1 3) s00)))) 0))
(assert (= (- (* (* (+ r 1) r00) r00) (- (* (* r00 r00) r00) (- (* (* (/ 1 6) (+ s (+ (* 6 r) 3))) (+ r 1)) (+ (* (* (/ 1 3) (+ r 1)) s00) (+ (* (* (/ 1 2) s00) r00) (- (* (/ 1 4) (+ s (+ (* 6 r) 3))) (- (* (/ 1 4) (+ r 1)) (- (* (/ 1 2) (- x s)) (+ (* (/ 1 4) s00) (+ (* (/ 1 4) r00) (* (/ 1 2) x00))))))))))) 0))
(assert (= (- (* (* (+ s (+ (* 6 r) 3)) (+ r 1)) r00) (- (* (* (+ r 1) s00) r00) (+ (* (* (+ s (+ (* 6 r) 3)) r00) r00) (+ (* (* s00 r00) r00) (- (* (* (/ 1 3) (+ s (+ (* 6 r) 3))) (+ s (+ (* 6 r) 3))) (+ (* (* (/ 3 2) (+ s (+ (* 6 r) 3))) (+ r 1)) (+ (* (* 3 (+ r 1)) (- x s)) (+ (* (* (/ 1 3) (+ s (+ (* 6 r) 3))) s00) (- (* (* (/ 3 2) (+ r 1)) s00) (- (* (* (/ 2 3) s00) s00) (+ (* (* (/ 3 2) (+ s (+ (* 6 r) 3))) r00) (+ (* (* 3 (- x s)) r00) (- (* (* (/ 3 2) s00) r00) (- (* (* 3 (+ r 1)) x00) (+ (* (* 3 r00) x00) (- (* (/ 1 2) (+ s (+ (* 6 r) 3))) (* (/ 1 2) s00))))))))))))))))) 0))
(assert (= (- (* (* (* (+ s (+ (* 6 r) 3)) (+ s (+ (* 6 r) 3))) r00) r00) (- (* (* (* s00 s00) r00) r00) (+ (* (* (* (* 6 (+ s (+ (* 6 r) 3))) r00) r00) r00) (+ (* (* (* (* 12 (- x s)) r00) r00) r00) (- (* (* (* (* 6 s00) r00) r00) r00) (- (* (* (* (* 12 r00) r00) r00) x00) (- (* (* (* (/ 1 9) (+ s (+ (* 6 r) 3))) (+ s (+ (* 6 r) 3))) (+ s (+ (* 6 r) 3))) (+ (* (* (* (/ 1 3) (+ s (+ (* 6 r) 3))) (+ s (+ (* 6 r) 3))) s00) (+ (* (* (* (/ 4 9) s00) s00) s00) (- (* (* (* 3 (+ s (+ (* 6 r) 3))) s00) r00) (- (* (* (* 6 (- x s)) s00) r00) (+ (* (* (* 3 s00) s00) r00) (- (* (* (+ s (+ (* 6 r) 3)) r00) r00) (+ (* (* s00 r00) r00) (+ (* (* (* 6 s00) r00) x00) (- (* (* (/ 5 12) (+ s (+ (* 6 r) 3))) (+ s (+ (* 6 r) 3))) (+ (* (* 3 (+ s (+ (* 6 r) 3))) (- x s)) (- (* (* 3 (- x s)) (- x s)) (+ (* (* (/ 11 6) (+ s (+ (* 6 r) 3))) s00) (+ (* (* 3 (- x s)) s00) (+ (* (* (/ 17 12) s00) s00) (- (* (* (/ 3 2) (+ s (+ (* 6 r) 3))) r00) (- (* (* 3 (- x s)) r00) (+ (* (* (/ 3 2) s00) r00) (- (* (* 3 (+ s (+ (* 6 r) 3))) x00) (- (* (* 6 (- x s)) x00) (+ (* (* 3 s00) x00) (+ (* (* 3 r00) x00) (- (* (* 3 x00) x00) (+ (* (/ 1 4) (+ s (+ (* 6 r) 3))) (* (/ 1 4) s00))))))))))))))))))))))))))))))) 0))

; contradiction
(assert (not (= (+ (* (* (+ s (+ (* 6 r) 3)) (+ s (+ (* 6 r) 3))) (+ r 1)) (- (* (* (+ s (+ (* 6 r) 3)) (+ r 1)) s00) (+ (* (* (* 2 (+ r 1)) s00) s00) (+ (* (* (* 2 (+ s (+ (* 6 r) 3))) (+ s (+ (* 6 r) 3))) r00) (- (* (* (* 18 (+ r 1)) (- x s)) r00) (- (* (* (+ s (+ (* 6 r) 3)) s00) r00) (- (* (* s00 s00) r00) (+ (* (* (* 18 (+ s (+ (* 6 r) 3))) r00) r00) (+ (* (* (* 18 (- x s)) r00) r00) (- (* (* (* 18 s00) r00) r00) (- (* (* (* 18 (+ r 1)) r00) x00) (+ (* (* (* 18 r00) r00) x00) (- (* (* (/ 3 2) (+ s (+ (* 6 r) 3))) (+ s (+ (* 6 r) 3))) (+ (* (* 12 (+ s (+ (* 6 r) 3))) (+ r 1)) (+ (* (* 3 (+ s (+ (* 6 r) 3))) (- x s)) (+ (* (* 27 (+ r 1)) (- x s)) (+ (* (* 6 (+ s (+ (* 6 r) 3))) s00) (- (* (* 12 (+ r 1)) s00) (- (* (* 3 (- x s)) s00) (- (* (* (/ 15 2) s00) s00) (+ (* (* 12 (+ s (+ (* 6 r) 3))) r00) (+ (* (* 27 (- x s)) r00) (- (* (* 12 s00) r00) (- (* (* 3 (+ s (+ (* 6 r) 3))) x00) (+ (* (* 27 (+ r 1)) x00) (- (* (* 3 s00) x00) (+ (* (* 27 r00) x00) (- (* (/ 9 2) (+ s (+ (* 6 r) 3))) (* (/ 9 2) s00))))))))))))))))))))))))))))) 0)))
(check-sat)
(exit)