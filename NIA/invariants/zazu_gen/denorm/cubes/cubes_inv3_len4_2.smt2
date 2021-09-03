;--------------------------------------------------------------------------
; Benchmark created with Zazu
; Benchmark: 		cubes_inv3_len4_2
; Created:   		2021-08-31 14:39
; Invariants: 
; 		 -6 + m - 6*n
; 		 4 - 18*c - 9*c*n - 5*k + 9*n + k^2
; 		 -3*c + k*n - k + 2*n
; 		 3*n^2 - k + 3*n
; 		 (-3*c + k*n - k + 2*n) * (9*c^2*k*m*n + 4*c + 8*c^2 + 7*k^2*m*n)
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
				(not (= (* (+ (- (+ (* (- 3) (+ c k)) (* (+ k m) (+ n 1))) (+ k m)) (* 2 (+ n 1))) (+ (* 9 (+ c k) (+ c k) (+ k m) (+ m 6) (+ n 1)) (* 4 (+ c k)) (* 8 (+ c k) (+ c k)) (* 7 (+ k m) (+ k m) (+ m 6) (+ n 1)))) 0))
			)
		)
	)
)
(check-sat)
(get-proof)
(exit)
