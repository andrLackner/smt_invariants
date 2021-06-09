; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   3*r^2 - 3*r00^2 - s + s00
;               12*r*r00^2 - 12*r00^3 - 2*s*r - 4*r*s00 + 6*s00*r00 + 3*s - 3*r - 6*x - 3*s00 + 3*r00 + 6*x00
;               6*s*r*r00 - 6*r*s00*r00 - 6*s*r00^2 + 6*s00*r00^2 + 2*s^2 - 9*s*r + 18*r*x + 2*s*s00 + 9*r*s00 - 4*s00^2 - 9*s*r00 + 18*x*r00 + 9*s00*r00 - 18*r*x00 - 18*r00*x00 + 3*s - 3*s00
;               2*s^2*r + 2*s*r*s00 - 4*r*s00^2 + 4*s^2*r00 + 36*r*x*r00 - 2*s*s00*r00 - 2*s00^2*r00 - 36*s*r00^2 + 36*x*r00^2 + 36*s00*r00^2 - 36*r*r00*x00 - 36*r00^2*x00 + 3*s^2 - 24*s*r + 6*s*x + 54*r*x + 12*s*s00 + 24*r*s00 - 6*x*s00 - 15*s00^2 - 24*s*r00 + 54*x*r00 + 24*s00*r00 - 6*s*x00 - 54*r*x00 + 6*s00*x00 - 54*r00*x00 + 9*s - 9*s00
;               36*s^2*r00^2 - 36*s00^2*r00^2 - 216*s*r00^3 + 432*x*r00^3 + 216*s00*r00^3 - 432*r00^3*x00 - 4*s^3 - 12*s^2*s00 + 16*s00^3 + 108*s*s00*r00 - 216*x*s00*r00 - 108*s00^2*r00 + 36*s*r00^2 - 36*s00*r00^2 + 216*s00*r00*x00 + 15*s^2 - 108*s*x + 36*3*x^2 - 66*s*s00 + 36*3*x*s00 + 51*s00^2 + 54*s*r00 - 36*3*x*r00 - 54*s00*r00 + 108*s*x00 - 216*x*x00 - 108*s00*x00 + 108*r00*x00 + 108*x00^2 - 9*s + 9*s00
;
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
			(not (= (+ (- (* 3 (+ r 1) (+ r 1)) (* 3 r00 r00) (+ s (* 6 r) 3)) s00) 0))
		)
	)
)

(check-sat)
(exit)