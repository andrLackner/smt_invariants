; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   m - 6*n - 6
;               k^2 - 9*n*c + 9*n - 5*k - 18*c + 4
;               n*k + 2*n - k - 3*c + 1
;               n^2 + n - 1//3*k + 1//3
;
; SOURCECODE:
;   c, k, m, n = 0, 1, 6, 0
;   while true
;       c = c + k
;       k = k + m
;       m = m + 6
;       n = n + 1
;   end


(set-logic NIA)

(assert
	(exists
		((c Int) (k Int) (m Int) (n Int) )
		(and
			(= (- m (* 6 n) 6) 0)
			(= (+ (- (+ (- (* k k) (* 9 n c)) (* 9 n)) (* 5 k) (* 18 c)) 4) 0)
			(= (+ (- (+ (* n k) (* 2 n)) k (* 3 c)) 1) 0)
			(= (+ (- (+ (* 3 n n) (* 3 n)) k) 1) 0)

			(= (- (+ m 6) (* 6 (+ n 1)) 6) 0)
			(= (+ (- (+ (- (* (+ k m) (+ k m)) (* 9 (+ n 1) (+ c k))) (* 9 (+ n 1))) (* 5 (+ k m)) (* 18 (+ c k))) 4) 0)
			(or
				(not (= (+ (- (+ (* (+ n 1) (+ k m)) (* 2 (+ n 1))) (+ k m) (* 3 (+ c k))) 1) 0))
				(not (= (+ (- (+ (* 3 (+ n 1) (+ n 1)) (* 3 (+ n 1))) (+ k m)) 1) 0))
			)
		)
	)
)

(check-sat)
(exit)