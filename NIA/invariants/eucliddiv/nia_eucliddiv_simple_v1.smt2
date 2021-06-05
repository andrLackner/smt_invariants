; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   y - y00
;               q*y00 - y00*q00 + r - r00
;
; SOURCECODE:
;    while true
;        r = r - y
;        q = q + 1
;    end

(set-logic NIA)

(declare-const y00 Int)
(declare-const q00 Int)
(declare-const r00 Int)

(assert
	(exists
		((y Int) (q Int) (r Int) )
		(and
			(= (- y y00) 0)
			(= (- (+ (- (* q y00) (* y00 q00)) r) r00) 0)


			(= (- y y00) 0)
			(or
				(not (= (- (+ (- (* (+ q 1) y00) (* y00 q00)) (- r y)) r00) 0))
			)
		)
	)
)

(check-sat)
(exit)