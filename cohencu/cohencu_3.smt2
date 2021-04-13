; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   n - 1//6*z - n00 + 1//6*z00
;               z^2 - z00^2 - 12*y - 6*z + 12*y00 + 6*z00
;               z*z00^2 - z00^3 - 6*y*z - 12*z*y00 - 6*z*z00 + 18*y00*z00 + 6*z00^2 + 72*y + 108*x - 72*y00 - 108*x00
;               y*z*z00 - z*y00*z00 - y*z00^2 + y00*z00^2 + 12*y^2 - 12*y*z - 18*z*x + 12*y*y00 + 12*z*y00 - 24*y00^2 - 6*y*z00 - 18*x*z00 + 6*y00*z00 + 18*z*x00 + 18*z00*x00 + 72*y + 108*x - 72*y00 - 108*x00
;               y^2*z + y*z*y00 - 2*z*y00^2 + 2*y^2*z00 - 3*z*x*z00 - y*y00*z00 - y00^2*z00 - 3*y*z00^2 - 3*x*z00^2 + 3*y00*z00^2 + 3*z*z00*x00 + 3*z00^2*x00 - 12*y*z - 18*y*x - 18*z*x + 36*y*y00 + 12*z*y00 + 18*x*y00 - 36*y00^2 + 6*y*z00 - 6*y00*z00 + 18*y*x00 + 18*z*x00 - 18*y00*x00 + 72*y + 108*x - 72*y00 - 108*x00
;               y^2*z00^2 - y00^2*z00^2 - y*z00^3 - 2*x*z00^3 + y00*z00^3 + 2*z00^3*x00 - 4*y^3 - 12*y^2*y00 + 16*y00^3 - 6*y^2*z00 + 18*y*y00*z00 + 36*x*y00*z00 - 12*y00^2*z00 + 10*y*z00^2 + 18*x*z00^2 - 10*y00*z00^2 - 36*y00*z00*x00 - 18*z00^2*x00 + 24*y^2 + 108*y*x + 108*x^2 - 120*y*y00 - 216*x*y00 + 96*y00^2 - 24*y*z00 - 36*x*z00 + 24*y00*z00 - 108*y*x00 - 216*x*x00 + 216*y00*x00 + 36*z00*x00 + 108*x00^2
; RESULT:       timed out
(set-logic NRA)
(declare-const n Real)
(declare-const x Real)
(declare-const z Real)
(declare-const y Real)
(declare-const n00 Real)
(declare-const x00 Real)
(declare-const z00 Real)
(declare-const y00 Real)
; Invariant (before loop body execution)
(assert (= (- n (+ (- (* (/ 1 6) z) n00) (* (/ 1 6) z00))) 0))
(assert (= (- (* z z) (- (* z00 z00) (- (* 12 y) (+ (* 6 z) (+ (* 12 y00) (* 6 z00)))))) 0))
(assert (= (- (* (* z z00) z00) (- (* (* z00 z00) z00) (- (* (* 6 y) z) (- (* (* 12 z) y00) (+ (* (* 6 z) z00) (+ (* (* 18 y00) z00) (+ (* (* 6 z00) z00) (+ (* 72 y) (- (* 108 x) (- (* 72 y00) (* 108 x00))))))))))) 0))
(assert (= (- (* (* y z) z00) (- (* (* z y00) z00) (+ (* (* y z00) z00) (+ (* (* y00 z00) z00) (- (* (* 12 y) y) (- (* (* 12 y) z) (+ (* (* 18 z) x) (+ (* (* 12 y) y00) (- (* (* 12 z) y00) (- (* (* 24 y00) y00) (- (* (* 6 y) z00) (+ (* (* 18 x) z00) (+ (* (* 6 y00) z00) (+ (* (* 18 z) x00) (+ (* (* 18 z00) x00) (+ (* 72 y) (- (* 108 x) (- (* 72 y00) (* 108 x00))))))))))))))))))) 0))
(assert (= (+ (* (* y y) z) (- (* (* y z) y00) (+ (* (* (* 2 z) y00) y00) (- (* (* (* 2 y) y) z00) (- (* (* (* 3 z) x) z00) (- (* (* y y00) z00) (- (* (* y00 y00) z00) (- (* (* (* 3 y) z00) z00) (+ (* (* (* 3 x) z00) z00) (+ (* (* (* 3 y00) z00) z00) (+ (* (* (* 3 z) z00) x00) (- (* (* (* 3 z00) z00) x00) (- (* (* 12 y) z) (- (* (* 18 y) x) (+ (* (* 18 z) x) (+ (* (* 36 y) y00) (+ (* (* 12 z) y00) (- (* (* 18 x) y00) (+ (* (* 36 y00) y00) (- (* (* 6 y) z00) (+ (* (* 6 y00) z00) (+ (* (* 18 y) x00) (- (* (* 18 z) x00) (+ (* (* 18 y00) x00) (+ (* 72 y) (- (* 108 x) (- (* 72 y00) (* 108 x00)))))))))))))))))))))))))))) 0))
(assert (= (- (* (* (* y y) z00) z00) (- (* (* (* y00 y00) z00) z00) (- (* (* (* y z00) z00) z00) (+ (* (* (* (* 2 x) z00) z00) z00) (+ (* (* (* y00 z00) z00) z00) (- (* (* (* (* 2 z00) z00) z00) x00) (- (* (* (* 4 y) y) y) (+ (* (* (* 12 y) y) y00) (- (* (* (* 16 y00) y00) y00) (+ (* (* (* 6 y) y) z00) (+ (* (* (* 18 y) y00) z00) (- (* (* (* 36 x) y00) z00) (+ (* (* (* 12 y00) y00) z00) (+ (* (* (* 10 y) z00) z00) (- (* (* (* 18 x) z00) z00) (- (* (* (* 10 y00) z00) z00) (- (* (* (* 36 y00) z00) x00) (+ (* (* (* 18 z00) z00) x00) (+ (* (* 24 y) y) (+ (* (* 108 y) x) (- (* (* 108 x) x) (- (* (* 120 y) y00) (+ (* (* 216 x) y00) (- (* (* 96 y00) y00) (- (* (* 24 y) z00) (+ (* (* 36 x) z00) (- (* (* 24 y00) z00) (- (* (* 108 y) x00) (+ (* (* 216 x) x00) (+ (* (* 216 y00) x00) (+ (* (* 36 z00) x00) (* (* 108 x00) x00)))))))))))))))))))))))))))))))) 0))
; invariant (after loop body execution)
(assert (= (- (+ n 1) (+ (- (* (/ 1 6) (+ z 6)) n00) (* (/ 1 6) z00))) 0))
(assert (= (- (* (+ z 6) (+ z 6)) (- (* z00 z00) (- (* 12 (+ y z)) (+ (* 6 (+ z 6)) (+ (* 12 y00) (* 6 z00)))))) 0))
(assert (= (- (* (* (+ z 6) z00) z00) (- (* (* z00 z00) z00) (- (* (* 6 (+ y z)) (+ z 6)) (- (* (* 12 (+ z 6)) y00) (+ (* (* 6 (+ z 6)) z00) (+ (* (* 18 y00) z00) (+ (* (* 6 z00) z00) (+ (* 72 (+ y z)) (- (* 108 (+ x y)) (- (* 72 y00) (* 108 x00))))))))))) 0))
(assert (= (+ (* (* (+ y z) (+ y z)) (+ z 6)) (- (* (* (+ y z) (+ z 6)) y00) (+ (* (* (* 2 (+ z 6)) y00) y00) (- (* (* (* 2 (+ y z)) (+ y z)) z00) (- (* (* (* 3 (+ z 6)) (+ x y)) z00) (- (* (* (+ y z) y00) z00) (- (* (* y00 y00) z00) (- (* (* (* 3 (+ y z)) z00) z00) (+ (* (* (* 3 (+ x y)) z00) z00) (+ (* (* (* 3 y00) z00) z00) (+ (* (* (* 3 (+ z 6)) z00) x00) (- (* (* (* 3 z00) z00) x00) (- (* (* 12 (+ y z)) (+ z 6)) (- (* (* 18 (+ y z)) (+ x y)) (+ (* (* 18 (+ z 6)) (+ x y)) (+ (* (* 36 (+ y z)) y00) (+ (* (* 12 (+ z 6)) y00) (- (* (* 18 (+ x y)) y00) (+ (* (* 36 y00) y00) (- (* (* 6 (+ y z)) z00) (+ (* (* 6 y00) z00) (+ (* (* 18 (+ y z)) x00) (- (* (* 18 (+ z 6)) x00) (+ (* (* 18 y00) x00) (+ (* 72 (+ y z)) (- (* 108 (+ x y)) (- (* 72 y00) (* 108 x00)))))))))))))))))))))))))))) 0))
(assert (= (- (* (* (* (+ y z) (+ y z)) z00) z00) (- (* (* (* y00 y00) z00) z00) (- (* (* (* (+ y z) z00) z00) z00) (+ (* (* (* (* 2 (+ x y)) z00) z00) z00) (+ (* (* (* y00 z00) z00) z00) (- (* (* (* (* 2 z00) z00) z00) x00) (- (* (* (* 4 (+ y z)) (+ y z)) (+ y z)) (+ (* (* (* 12 (+ y z)) (+ y z)) y00) (- (* (* (* 16 y00) y00) y00) (+ (* (* (* 6 (+ y z)) (+ y z)) z00) (+ (* (* (* 18 (+ y z)) y00) z00) (- (* (* (* 36 (+ x y)) y00) z00) (+ (* (* (* 12 y00) y00) z00) (+ (* (* (* 10 (+ y z)) z00) z00) (- (* (* (* 18 (+ x y)) z00) z00) (- (* (* (* 10 y00) z00) z00) (- (* (* (* 36 y00) z00) x00) (+ (* (* (* 18 z00) z00) x00) (+ (* (* 24 (+ y z)) (+ y z)) (+ (* (* 108 (+ y z)) (+ x y)) (- (* (* 108 (+ x y)) (+ x y)) (- (* (* 120 (+ y z)) y00) (+ (* (* 216 (+ x y)) y00) (- (* (* 96 y00) y00) (- (* (* 24 (+ y z)) z00) (+ (* (* 36 (+ x y)) z00) (- (* (* 24 y00) z00) (- (* (* 108 (+ y z)) x00) (+ (* (* 216 (+ x y)) x00) (+ (* (* 216 y00) x00) (+ (* (* 36 z00) x00) (* (* 108 x00) x00)))))))))))))))))))))))))))))))) 0))
; contradiction
(assert (not (= (- (* (* (+ z 6) z00) z00) (- (* (* z00 z00) z00) (- (* (* 6 (+ y z)) (+ z 6)) (- (* (* 12 (+ z 6)) y00) (+ (* (* 6 (+ z 6)) z00) (+ (* (* 18 y00) z00) (+ (* (* 6 z00) z00) (+ (* 72 (+ y z)) (- (* 108 (+ x y)) (- (* 72 y00) (* 108 x00))))))))))) 0)))
(check-sat)
(exit)