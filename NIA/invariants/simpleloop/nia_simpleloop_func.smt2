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

(declare-fun x (Int) Int)
(declare-fun y (Int) Int)

(declare-fun inv (Int) Int)


(assert
    (forall
        ((i Int))
        (=>
            (>= i 0)
            (and
                (= (x (+ i 1)) (- (x i) 1))
                (= (y (+ i 1)) (+ (y i) 1))
                (= (inv i) (- (+(y i) (x i)) (+ (y 0) (x 0))))
            )
        )
    )
)

(assert
    (not
        (forall
            ((i Int))
            (=>
                (>= i 0)
                (and
                    (= (inv i) 0)
                )
            )
        )
    )
)

(check-sat)
(get-proof)
(exit)