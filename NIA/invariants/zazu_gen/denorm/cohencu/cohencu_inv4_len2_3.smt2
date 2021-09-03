;--------------------------------------------------------------------------
; Benchmark created with Zazu
; Benchmark: 		cohencu_inv4_len2_3
; Created:   		2021-08-30 18:29
; Invariants: 
; 		 -z + z00 + 6*n - 6*n00
; 		 -z00^2 + 12*y00 - 12*y - 6*z + 6*z00 + z^2
; 		 -6*y*z - z00^3 + 6*z00^2 - 12*y00*z + 18*y00*z00 + 108*x - 72*y00 - 6*z*z00 + 72*y - 108*x00 + z*z00^2
; 		 -y00*z*z00 - 12*y*z - 18*x*z + 18*x00*z00 + 12*y^2 - 24*y00^2 + 18*x00*z + 12*y00*z + 6*y00*z00 + 12*y*y00 + 108*x - 72*y00 - 6*y*z00 + 72*y - 108*x00 + y00*z00^2 - 18*x*z00 + y*z*z00 - y*z00^2
; 		 -18*x00*y00 - 18*x*y - 18*x*z - 3*x*z00^2 - y00^2*z00 + 3*x00*z*z00 - y*y00*z00 + 12*y00*z - 6*y00*z00 + 36*y*y00 + 6*y*z00 - 12*y*z - 3*x*z*z00 + 2*y^2*z00 - 36*y00^2 + 18*x00*z + y^2*z + 18*x00*y + 3*x00*z00^2 + 108*x - 72*y00 + 18*x*y00 + 72*y - 108*x00 + y*y00*z + 3*y00*z00^2 - 2*y00^2*z - 3*y*z00^2
; 		 216*x00*y00 + 108*x*y + 36*x00*z00 - 2*x*z00^3 + 18*x*z00^2 - 12*y00^2*z00 - y00^2*z00^2 + 24*y^2 + 108*x^2 - 4*y^3 + 18*y*y00*z00 + 24*y00*z00 - 120*y*y00 - 24*y*z00 + 16*y00^3 - 6*y^2*z00 + 96*y00^2 - 12*y^2*y00 - 36*x00*y00*z00 - 108*x00*y - 18*x00*z00^2 - 216*x*x00 + y00*z00^3 + 2*x00*z00^3 - 216*x*y00 + y^2*z00^2 - 10*y00*z00^2 - 36*x*z00 + 36*x*y00*z00 + 10*y*z00^2 + 108*x00^2 - y*z00^3
; 		 (-n^2*x^2*y^2*z + 9*y*z) * (-y00*z*z00 - 12*y*z - 18*x*z + 18*x00*z00 + 12*y^2 - 24*y00^2 + 18*x00*z + 12*y00*z + 6*y00*z00 + 12*y*y00 + 108*x - 72*y00 - 6*y*z00 + 72*y - 108*x00 + y00*z00^2 - 18*x*z00 + y*z*z00 - y*z00^2)
;--------------------------------------------------------------------------

(set-logic NIA)
(set-option :produce-proofs true)

(declare-const x00 Int)
(declare-const y00 Int)
(declare-const z00 Int)
(declare-const n00 Int)

(assert 
	(exists
		((x Int) (y Int) (z Int) (n Int))
		(and
			(= (- (+ (* (- 1) z) z00 (* 6 n)) (* 6 n00)) 0)
			(= (+ (- (+ (* (- 1) z00 z00) (* 12 y00)) (* 12 y) (* 6 z)) (* 6 z00) (* z z)) 0)
			(= (+ (- (+ (- (+ (- (+ (- (* (- 6) y z) (* z00 z00 z00)) (* 6 z00 z00)) (* 12 y00 z)) (* 18 y00 z00) (* 108 x)) (* 72 y00) (* 6 z z00)) (* 72 y)) (* 108 x00)) (* z z00 z00)) 0)
			(= (- (+ (- (+ (- (+ (- (+ (- (+ (- (* (- 1) y00 z z00) (* 12 y z) (* 18 x z)) (* 18 x00 z00) (* 12 y y)) (* 24 y00 y00)) (* 18 x00 z) (* 12 y00 z) (* 6 y00 z00) (* 12 y y00) (* 108 x)) (* 72 y00) (* 6 y z00)) (* 72 y)) (* 108 x00)) (* y00 z00 z00)) (* 18 x z00)) (* y z z00)) (* y z00 z00)) 0)
			(= (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (* (- 18) x00 y00) (* 18 x y) (* 18 x z) (* 3 x z00 z00) (* y00 y00 z00)) (* 3 x00 z z00)) (* y y00 z00)) (* 12 y00 z)) (* 6 y00 z00)) (* 36 y y00) (* 6 y z00)) (* 12 y z) (* 3 x z z00)) (* 2 y y z00)) (* 36 y00 y00)) (* 18 x00 z) (* y y z) (* 18 x00 y) (* 3 x00 z00 z00) (* 108 x)) (* 72 y00)) (* 18 x y00) (* 72 y)) (* 108 x00)) (* y y00 z) (* 3 y00 z00 z00)) (* 2 y00 y00 z) (* 3 y z00 z00)) 0)
			(= (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (* 216 x00 y00) (* 108 x y) (* 36 x00 z00)) (* 2 x z00 z00 z00)) (* 18 x z00 z00)) (* 12 y00 y00 z00) (* y00 y00 z00 z00)) (* 24 y y) (* 108 x x)) (* 4 y y y)) (* 18 y y00 z00) (* 24 y00 z00)) (* 120 y y00) (* 24 y z00)) (* 16 y00 y00 y00)) (* 6 y y z00)) (* 96 y00 y00)) (* 12 y y y00) (* 36 x00 y00 z00) (* 108 x00 y) (* 18 x00 z00 z00) (* 216 x x00)) (* y00 z00 z00 z00) (* 2 x00 z00 z00 z00)) (* 216 x y00)) (* y y z00 z00)) (* 10 y00 z00 z00) (* 36 x z00)) (* 36 x y00 z00) (* 10 y z00 z00) (* 108 x00 x00)) (* y z00 z00 z00)) 0)
			
			(or
				(not (= (- (+ (* (- 1) (+ z 6)) z00 (* 6 (+ n 1))) (* 6 n00)) 0))
				(not (= (+ (- (+ (* (- 1) z00 z00) (* 12 y00)) (* 12 (+ y z)) (* 6 (+ z 6))) (* 6 z00) (* (+ z 6) (+ z 6))) 0))
				(not (= (+ (- (+ (- (+ (- (+ (- (* (- 6) (+ y z) (+ z 6)) (* z00 z00 z00)) (* 6 z00 z00)) (* 12 y00 (+ z 6))) (* 18 y00 z00) (* 108 (+ x y))) (* 72 y00) (* 6 (+ z 6) z00)) (* 72 (+ y z))) (* 108 x00)) (* (+ z 6) z00 z00)) 0))
				(not (= (- (+ (- (+ (- (+ (- (+ (- (+ (- (* (- 1) y00 (+ z 6) z00) (* 12 (+ y z) (+ z 6)) (* 18 (+ x y) (+ z 6))) (* 18 x00 z00) (* 12 (+ y z) (+ y z))) (* 24 y00 y00)) (* 18 x00 (+ z 6)) (* 12 y00 (+ z 6)) (* 6 y00 z00) (* 12 (+ y z) y00) (* 108 (+ x y))) (* 72 y00) (* 6 (+ y z) z00)) (* 72 (+ y z))) (* 108 x00)) (* y00 z00 z00)) (* 18 (+ x y) z00)) (* (+ y z) (+ z 6) z00)) (* (+ y z) z00 z00)) 0))
				(not (= (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (* (- 18) x00 y00) (* 18 (+ x y) (+ y z)) (* 18 (+ x y) (+ z 6)) (* 3 (+ x y) z00 z00) (* y00 y00 z00)) (* 3 x00 (+ z 6) z00)) (* (+ y z) y00 z00)) (* 12 y00 (+ z 6))) (* 6 y00 z00)) (* 36 (+ y z) y00) (* 6 (+ y z) z00)) (* 12 (+ y z) (+ z 6)) (* 3 (+ x y) (+ z 6) z00)) (* 2 (+ y z) (+ y z) z00)) (* 36 y00 y00)) (* 18 x00 (+ z 6)) (* (+ y z) (+ y z) (+ z 6)) (* 18 x00 (+ y z)) (* 3 x00 z00 z00) (* 108 (+ x y))) (* 72 y00)) (* 18 (+ x y) y00) (* 72 (+ y z))) (* 108 x00)) (* (+ y z) y00 (+ z 6)) (* 3 y00 z00 z00)) (* 2 y00 y00 (+ z 6)) (* 3 (+ y z) z00 z00)) 0))
				(not (= (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (* 216 x00 y00) (* 108 (+ x y) (+ y z)) (* 36 x00 z00)) (* 2 (+ x y) z00 z00 z00)) (* 18 (+ x y) z00 z00)) (* 12 y00 y00 z00) (* y00 y00 z00 z00)) (* 24 (+ y z) (+ y z)) (* 108 (+ x y) (+ x y))) (* 4 (+ y z) (+ y z) (+ y z))) (* 18 (+ y z) y00 z00) (* 24 y00 z00)) (* 120 (+ y z) y00) (* 24 (+ y z) z00)) (* 16 y00 y00 y00)) (* 6 (+ y z) (+ y z) z00)) (* 96 y00 y00)) (* 12 (+ y z) (+ y z) y00) (* 36 x00 y00 z00) (* 108 x00 (+ y z)) (* 18 x00 z00 z00) (* 216 (+ x y) x00)) (* y00 z00 z00 z00) (* 2 x00 z00 z00 z00)) (* 216 (+ x y) y00)) (* (+ y z) (+ y z) z00 z00)) (* 10 y00 z00 z00) (* 36 (+ x y) z00)) (* 36 (+ x y) y00 z00) (* 10 (+ y z) z00 z00) (* 108 x00 x00)) (* (+ y z) z00 z00 z00)) 0))
				(not (= (* (+ (* (- 1) (+ n 1) (+ n 1) (+ x y) (+ x y) (+ y z) (+ y z) (+ z 6)) (* 9 (+ y z) (+ z 6))) (- (+ (- (+ (- (+ (- (+ (- (+ (- (* (- 1) y00 (+ z 6) z00) (* 12 (+ y z) (+ z 6)) (* 18 (+ x y) (+ z 6))) (* 18 x00 z00) (* 12 (+ y z) (+ y z))) (* 24 y00 y00)) (* 18 x00 (+ z 6)) (* 12 y00 (+ z 6)) (* 6 y00 z00) (* 12 (+ y z) y00) (* 108 (+ x y))) (* 72 y00) (* 6 (+ y z) z00)) (* 72 (+ y z))) (* 108 x00)) (* y00 z00 z00)) (* 18 (+ x y) z00)) (* (+ y z) (+ z 6) z00)) (* (+ y z) z00 z00))) 0))
			)
		)
	)
)
(check-sat)
(get-proof)
(exit)
