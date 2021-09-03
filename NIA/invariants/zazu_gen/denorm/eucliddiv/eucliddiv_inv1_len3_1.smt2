;--------------------------------------------------------------------------
; Benchmark created with Zazu
; Benchmark: 		eucliddiv_inv1_len3_1
; Created:   		2021-08-19 21:57
; Invariants: 
; 		 -y00 + y
; 		 r - r00 - q00*y00 + q*y00
; 		 (3*q*r^2*y^2 - 2*r^2*y - 3*q*y) * (-y00 + y)
;--------------------------------------------------------------------------

(set-logic NIA)
(set-option :produce-proofs true)

(declare-const q00 Int)
(declare-const r00 Int)
(declare-const y00 Int)

(assert 
	(exists
		((q Int) (r Int) (y Int))
		(and
			(= (+ (* (- 1) y00) y) 0)
			(= (+ (- r r00 (* q00 y00)) (* q y00)) 0)

			(or
				(not (= (+ (* (- 1) y00) y00) 0))
				(not (= (+ (- r y00 r00 (* q00 y00)) (* (+ q 1) y00)) 0))
				(not (= (* (- (* 3 (+ q 1) (- r y00) (- r y00) y00 y00) (* 2 (- r y00) (- r y00) y00) (* 3 (+ q 1) y00)) (+ (* (- 1) y00) y00)) 0))
			)
		)
	)
)
(check-sat)
(get-proof)
(exit)
