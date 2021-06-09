; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   r^2 - r00^2 - r + 2*x + r00 - 2*x00
;               r*r00^2 - r00^3 - 1//6*s*r - 1//3*r*s00 + 1//2*s00*r00 + 1//4*s - 1//4*r - 1//2*x - 1//4*s00 + 1//4*r00 + 1//2*x00
;               s*r*r00 - r*s00*r00 - s*r00^2 + s00*r00^2 + 1//3*s^2 - 3//2*s*r + 3*r*x + 1//3*s*s00 + 3//2*r*s00 - 2//3*s00^2 - 3//2*s*r00 + 3*x*r00 + 3//2*s00*r00 - 3*r*x00 - 3*r00*x00 + 1//2*s - 1//2*s00
;               s^2*r + s*r*s00 - 2*r*s00^2 + 2*s^2*r00 + 18*r*x*r00 - s*s00*r00 - s00^2*r00 - 18*s*r00^2 + 18*x*r00^2 + 18*s00*r00^2 - 18*r*r00*x00 - 18*r00^2*x00 + 3//2*s^2 - 12*s*r + 3*s*x + 27*r*x + 6*s*s00 + 12*r*s00 - 3*x*s00 - 15//2*s00^2 - 12*s*r00 + 27*x*r00 + 12*s00*r00 - 3*s*x00 - 27*r*x00 + 3*s00*x00 - 27*r00*x00 + 9//2*s - 9//2*s00
;               s^2*r00^2 - s00^2*r00^2 - 6*s*r00^3 + 12*x*r00^3 + 6*s00*r00^3 - 12*r00^3*x00 - 1//9*s^3 - 1//3*s^2*s00 + 4//9*s00^3 + 3*s*s00*r00 - 6*x*s00*r00 - 3*s00^2*r00 + s*r00^2 - s00*r00^2 + 6*s00*r00*x00 + 5//12*s^2 - 3*s*x + 3*x^2 - 11//6*s*s00 + 3*x*s00 + 17//12*s00^2 + 3//2*s*r00 - 3*x*r00 - 3//2*s00*r00 + 3*s*x00 - 6*x*x00 - 3*s00*x00 + 3*r00*x00 + 3*x00^2 - 1//4*s + 1//4*s00
; SOURCECODE:
;   while x-s > 0
;       x = x-s
;       s = s+6*r+3
;       r = r+1
;   end

(set-logic NIA)

(declare-const x00 Int)
(declare-const r00 Int)
(declare-const s00 Int)

(assert
	(exists
		((x Int) (s Int) (r Int) )
		(and
			(= (+ (- (* 3 r r) (* 3 r00 r00) s) s00) 0)
			(= (+ (- (+ (- (* 12 r r00 r00) (* 12 r00 r00 r00) (* 2 s r) (* 4 r s00)) (* 6 s00 r00) (* 3 s)) (* 3 r) (* 6 x) (* 3 s00)) (* 3 r00) (* 6 x00)) 0)
			(= (- (+ (- (+ (- (+ (- (+ (- (* 6 s r r00) (* 6 r s00 r00) (* 6 s r00 r00)) (* 6 s00 r00 r00) (* 2 s s)) (* 9 s r)) (* 18 r x) (* 2 s s00) (* 9 r s00)) (* 4 s00 s00) (* 9 s r00)) (* 18 x r00) (* 9 s00 r00)) (* 18 r x00) (* 18 r00 x00)) (* 3 s)) (* 3 s00)) 0)
			(= (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (* 2 s s r) (* 2 s r s00)) (* 4 r s00 s00)) (* 4 s s r00) (* 36 r x r00)) (* 2 s s00 r00) (* 2 s00 s00 r00) (* 36 s r00 r00)) (* 36 x r00 r00) (* 36 s00 r00 r00)) (* 36 r r00 x00) (* 36 r00 r00 x00)) (* 3 s s)) (* 24 s r)) (* 6 s x) (* 54 r x) (* 12 s s00) (* 24 r s00)) (* 6 x s00) (* 15 s00 s00) (* 24 s r00)) (* 54 x r00) (* 24 s00 r00)) (* 6 s x00) (* 54 r x00)) (* 6 s00 x00)) (* 54 r00 x00)) (* 9 s)) (* 9 s00)) 0)
			(= (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (* 36 s s r00 r00) (* 36 s00 s00 r00 r00) (* 216 s r00 r00 r00)) (* 432 x r00 r00 r00) (* 216 s00 r00 r00 r00)) (* 432 r00 r00 r00 x00) (* 4 s s s) (* 12 s s s00)) (* 16 s00 s00 s00) (* 108 s s00 r00)) (* 216 x s00 r00) (* 108 s00 s00 r00)) (* 36 s r00 r00)) (* 36 s00 r00 r00)) (* 216 s00 r00 x00) (* 15 s s)) (* 108 s x)) (* 36 3 x x)) (* 66 s s00)) (* 36 3 x s00) (* 51 s00 s00) (* 54 s r00)) (* 36 3 x r00) (* 54 s00 r00)) (* 108 s x00)) (* 216 x x00) (* 108 s00 x00)) (* 108 r00 x00) (* 108 x00 x00)) (* 9 s)) (* 9 s00)) 0)

			(= (+ (- (* 3 (+ r 1) (+ r 1)) (* 3 r00 r00) (+ s (* 6 r) 3)) s00) 0)
			(= (+ (- (+ (- (* 12 (+ r 1) r00 r00) (* 12 r00 r00 r00) (* 2 (+ s (* 6 r) 3) (+ r 1)) (* 4 (+ r 1) s00)) (* 6 s00 r00) (* 3 (+ s (* 6 r) 3))) (* 3 (+ r 1)) (* 6 (- x s)) (* 3 s00)) (* 3 r00) (* 6 x00)) 0)
			(or
				(not (= (- (+ (- (+ (- (+ (- (+ (- (* 6 (+ s (* 6 r) 3) (+ r 1) r00) (* 6 (+ r 1) s00 r00) (* 6 (+ s (* 6 r) 3) r00 r00)) (* 6 s00 r00 r00) (* 2 (+ s (* 6 r) 3) (+ s (* 6 r) 3))) (* 9 (+ s (* 6 r) 3) (+ r 1))) (* 18 (+ r 1) (- x s)) (* 2 (+ s (* 6 r) 3) s00) (* 9 (+ r 1) s00)) (* 4 s00 s00) (* 9 (+ s (* 6 r) 3) r00)) (* 18 (- x s) r00) (* 9 s00 r00)) (* 18 (+ r 1) x00) (* 18 r00 x00)) (* 3 (+ s (* 6 r) 3))) (* 3 s00)) 0))
				(not (= (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (* 2 (+ s (* 6 r) 3) (+ s (* 6 r) 3) (+ r 1)) (* 2 (+ s (* 6 r) 3) (+ r 1) s00)) (* 4 (+ r 1) s00 s00)) (* 4 (+ s (* 6 r) 3) (+ s (* 6 r) 3) r00) (* 36 (+ r 1) (- x s) r00)) (* 2 (+ s (* 6 r) 3) s00 r00) (* 2 s00 s00 r00) (* 36 (+ s (* 6 r) 3) r00 r00)) (* 36 (- x s) r00 r00) (* 36 s00 r00 r00)) (* 36 (+ r 1) r00 x00) (* 36 r00 r00 x00)) (* 3 (+ s (* 6 r) 3) (+ s (* 6 r) 3))) (* 24 (+ s (* 6 r) 3) (+ r 1))) (* 6 (+ s (* 6 r) 3) (- x s)) (* 54 (+ r 1) (- x s)) (* 12 (+ s (* 6 r) 3) s00) (* 24 (+ r 1) s00)) (* 6 (- x s) s00) (* 15 s00 s00) (* 24 (+ s (* 6 r) 3) r00)) (* 54 (- x s) r00) (* 24 s00 r00)) (* 6 (+ s (* 6 r) 3) x00) (* 54 (+ r 1) x00)) (* 6 s00 x00)) (* 54 r00 x00)) (* 9 (+ s (* 6 r) 3))) (* 9 s00)) 0))
				(not (= (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (* 36 (+ s (* 6 r) 3) (+ s (* 6 r) 3) r00 r00) (* 36 s00 s00 r00 r00) (* 216 (+ s (* 6 r) 3) r00 r00 r00)) (* 432 (- x s) r00 r00 r00) (* 216 s00 r00 r00 r00)) (* 432 r00 r00 r00 x00) (* 4 (+ s (* 6 r) 3) (+ s (* 6 r) 3) (+ s (* 6 r) 3)) (* 12 (+ s (* 6 r) 3) (+ s (* 6 r) 3) s00)) (* 16 s00 s00 s00) (* 108 (+ s (* 6 r) 3) s00 r00)) (* 216 (- x s) s00 r00) (* 108 s00 s00 r00)) (* 36 (+ s (* 6 r) 3) r00 r00)) (* 36 s00 r00 r00)) (* 216 s00 r00 x00) (* 15 (+ s (* 6 r) 3) (+ s (* 6 r) 3))) (* 108 (+ s (* 6 r) 3) (- x s))) (* 36 3 (- x s) (- x s))) (* 66 (+ s (* 6 r) 3) s00)) (* 36 3 (- x s) s00) (* 51 s00 s00) (* 54 (+ s (* 6 r) 3) r00)) (* 36 3 (- x s) r00) (* 54 s00 r00)) (* 108 (+ s (* 6 r) 3) x00)) (* 216 (- x s) x00) (* 108 s00 x00)) (* 108 r00 x00) (* 108 x00 x00)) (* 9 (+ s (* 6 r) 3))) (* 9 s00)) 0))
			)
		)
	)
)

(check-sat)
(exit)