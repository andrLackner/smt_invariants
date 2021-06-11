(set-logic NIA)
(set-option :produce-proofs true)

(declare-const x Int)

(assert 
    (=
        (*
            (+ x 1)
            (+ x 1)
        )
        0
    )
)

(assert 
    (not
        (= x -1)
    )
)

(check-sat)
(get-proof)
(exit)