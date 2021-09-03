;--------------------------------------------------------------------------
; Benchmark created with Zazu
; Benchmark: 		cubes_inv1_len3_3
; Created:   		2021-08-31 14:11
; Invariants: 
; 		 -6 + m - 6*n
; 		 4 - 18*c - 9*c*n - 5*k + 9*n + k^2
; 		 -3*c + k*n - k + 2*n
; 		 3*n^2 - k + 3*n
; 		 (-6 + m - 6*n) * (4*n^2 + 7*c^2*k*m + 3*c*k)
;--------------------------------------------------------------------------

(set-logic NIA)
(set-option :produce-proofs true)

(declare-const c00 Int)
(declare-const k00 Int)
(declare-const m00 Int)
(declare-const n00 Int)

(assert 
	(exists
		((c Int) (k Int) (m Int) (n Int))
		(and
			(= (- (+ (- 6) m) (* 6 n)) 0)
			(= (+ (- 4 (* 18 c) (* 9 c n) (* 5 k)) (* 9 n) (* k k)) 0)
			(= (+ (- (+ (* (- 3) c) (* k n)) k) (* 2 n)) 0)
			(= (+ (- (* 3 n n) k) (* 3 n)) 0)

			(or
				(not (= (- (+ (- 6) m 6) (* 6 (+ n 1))) 0))
				(not (= (+ (- 4 (* 18 (+ c k)) (* 9 (+ c k) (+ n 1)) (* 5 (+ k m))) (* 9 (+ n 1)) (* (+ k m) (+ k m))) 0))
				(not (= (+ (- (+ (* (- 3) (+ c k)) (* (+ k m) (+ n 1))) (+ k m)) (* 2 (+ n 1))) 0))
				(not (= (+ (- (* 3 (+ n 1) (+ n 1)) (+ k m)) (* 3 (+ n 1))) 0))
				(not (= (* (- (+ (- 6) m 6) (* 6 (+ n 1))) (+ (* 4 (+ n 1) (+ n 1)) (* 7 (+ c k) (+ c k) (+ k m) (+ m 6)) (* 3 (+ c k) (+ k m)))) 0))
			)
		)
	)
)
(check-sat)
(get-proof)
(exit)
