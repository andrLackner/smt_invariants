; ORIGIN: freire1
; SOURCE: https://www.cs.upc.edu/~erodri/webpage/polynomial_invariants/freire1.htm
; RESULT: solved in about 3 seconds
(set-logic QF_NRA)
(declare-const r Real)
(declare-const x Real)
(declare-const a Real)
; pre-condition:
(assert (> a 0))
; loop condition
(assert (> x r))
; Invariant (pre-loop execution)
(assert (= 
    (+ 
        (- (* r r) r) 
        (- (* x 2) a)
    )
    0)
) 
; Invariant (post-loop execution)
(assert (not (=
            (+
                (-
                    (* (+ r 1) (+ r 1))
                    (+ r 1)
                )
                (-
                    (- (* 2 x) (* 2 r))
                    a
                )
            )
        0)
    )
)
(check-sat)
(exit)