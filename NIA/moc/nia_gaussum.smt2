(set-logic NIA)

(declare-fun s (Int) Int)

(assert (= (s 0) 0))

(assert 
    (forall 
        ((i Int))
        (=>
            (>= i 0)
            (= (s (+ i 1)) (+ (s i) 1))
        )
    )
)

(assert
    (not
        (forall
            ((i Int))
            (=>
                (>= i 0)
                (= (* 2 (s i)) (* i (+ i 1)))
            )
        )
    )
)

(check-sat)
(exit)