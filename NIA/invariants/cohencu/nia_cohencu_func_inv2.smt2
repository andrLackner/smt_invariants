; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   z^2 - z00^2 - 12*y - 6*z + 12*y00 + 6*z00
;
; SOURCECODE: 
;   while n<=N
;       n = n+1
;       x = x+y
;       y = y+z
;       z = z+6
;   end

(set-logic NIA)
(set-option :produce-proofs true)


(declare-fun z (Int) Int)
(declare-fun y (Int) Int)

(declare-fun i2 (Int) Int)

(assert
    (forall
        ((i Int))
        (=>
            (>= i 0)
            (and
                (= (y (+ i 1)) (+ (z i) (y i)))
                (= (z (+ i 1)) (+ 6 (z i)))
            )
        )
    )
)

(assert
    (forall
        ((i Int))
        (=> 
            (>= i 0)
            (=
                (i2 i)
                (- (* (z i) (z i)) (- (* (z 0) (z 0)) (- (* 12 (y i)) (+ (* 6 (z i)) (+ (* 12 (y 0)) (* 6 (z 0)))))))
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
                (= (i2 i) 0)
            )
        )
    )
)

(check-sat)
(get-proof)
(exit)