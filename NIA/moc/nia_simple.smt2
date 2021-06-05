(set-logic NIA)

(declare-fun s (Int) Int)

(assert
    (forall 
        ((i Int))
        (= (s i) (* i i))
    )
)

(assert
    (not
        (forall
            ((i Int))
            (= (- (s (+ i 1)) (s i)) (+ (* 2 i) 1))
        )
    )
)

(check-sat)
(exit)