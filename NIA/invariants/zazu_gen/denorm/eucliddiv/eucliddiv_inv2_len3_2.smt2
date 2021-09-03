;--------------------------------------------------------------------------
; Benchmark created with Zazu
; Benchmark: 		eucliddiv_inv2_len3_2
; Created:   		2021-08-19 22:03
; Invariants: 
; 		 -y00 + y
; 		 r - r00 - q00*y00 + q*y00
; 		 (2*q*r + 2*q^2*r^2 + 2*q^2*r*y^2) * (r - r00 - q00*y00 + q*y00)
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
				(not (= (* (+ (* 2 (+ q 1) (- r y00)) (* 2 (+ q 1) (+ q 1) (- r y00) (- r y00)) (* 2 (+ q 1) (+ q 1) (- r y00) y00 y00)) (+ (- r y00 r00 (* q00 y00)) (* (+ q 1) y00))) 0))
			)
		)
	)
)
(check-sat)
(get-proof)
(exit)
