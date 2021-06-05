; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   r^2 - r00^2 - r + 2*x + r00 - 2*x00
;
; SOURCECODE:
;   while x>r
;       x = x-r
;       r = r+1
;   end

(set-logic NIA)
(declare-const x00 Int)
(declare-const r00 Int)

(assert
	(exists
		((x Int) (r Int) )
		(and
            (> x r)
			(= (- (+ (- (* r r) (* r00 r00) r) (* 2 x) r00) (* 2 x00)) 0)
			(or
				(not (= (- (+ (- (* (+ r 1) (+ r 1)) (* r00 r00) (+ r 1)) (* 2 (- x r)) r00) (* 2 x00)) 0))
			)
		)
	)
)

(check-sat)
(exit)