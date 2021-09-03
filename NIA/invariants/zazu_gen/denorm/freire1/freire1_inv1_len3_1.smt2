;--------------------------------------------------------------------------
; Benchmark created with Zazu
; Benchmark: 		freire1_inv1_len3_1
; Created:   		2021-08-31 15:05
; Invariants: 
; 		 -r + r00 + r^2 + 2*x - 2*x00 - r00^2
; 		 (-r + r00 + r^2 + 2*x - 2*x00 - r00^2) * (-10*r^2*x - 2*x - r*x^2)
;--------------------------------------------------------------------------

(set-logic NIA)
(set-option :produce-proofs true)

(declare-const r00 Int)
(declare-const x00 Int)

(assert 
	(exists
		((r Int) (x Int))
		(and
			(= (- (+ (* (- 1) r) r00 (* r r) (* 2 x)) (* 2 x00) (* r00 r00)) 0)

			(or
				(not (= (- (+ (* (- 1) (+ r 1)) r00 (* (+ r 1) (+ r 1)) (* 2 (- x r))) (* 2 x00) (* r00 r00)) 0))
				(not (= (* (- (+ (* (- 1) (+ r 1)) r00 (* (+ r 1) (+ r 1)) (* 2 (- x r))) (* 2 x00) (* r00 r00)) (- (* (- 10) (+ r 1) (+ r 1) (- x r)) (* 2 (- x r)) (* (+ r 1) (- x r) (- x r)))) 0))
			)
		)
	)
)
(check-sat)
(get-proof)
(exit)
