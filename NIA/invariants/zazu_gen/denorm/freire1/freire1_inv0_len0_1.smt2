;--------------------------------------------------------------------------
; Benchmark created with Zazu
; Benchmark: 		freire1_inv0_len0_1
; Created:   		2021-08-31 14:54
; Invariants: 
; 		 -r + r00 + r^2 + 2*x - 2*x00 - r00^2
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
			)
		)
	)
)
(check-sat)
(get-proof)
(exit)
