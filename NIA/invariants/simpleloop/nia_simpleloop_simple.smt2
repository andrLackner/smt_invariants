; ORIGIN:       MOC
; INVARIANTS:   y + x - y00 - x00
;
; SOURCECODE: 
;   while true
;       x = x-1
;       y = y+1
;   end

(set-logic NIA)
(set-option :produce-proofs true)

(declare-const x00 Int)
(declare-const y00 Int)


(assert
    (exists
        ((x Int) (y Int))
        (and
            (=
                (-
                    (+ y x)
                    (+ y00 x00)
                )
                0
            )
            (not
                (=
                    (-
                        (+ (+ y 1) (- x 1))
                        (+ y00 x00)
                    )
                    0
                )
            )
        )
    )
)

(check-sat)
(get-proof)
(exit)