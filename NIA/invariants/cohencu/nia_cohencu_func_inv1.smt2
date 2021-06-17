; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   n - 1//6*z - n00 + 1//6*z00
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


(declare-fun n (Int) Int)
(declare-fun z (Int) Int)

(declare-fun i1 (Int) Int)

(assert
    (forall
        ((i Int))
        (=>
            (>= i 0)
            (and
                (= (n (+ i 1)) (+ 1 (n i)))
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
            (and
                (= 
                    (i1 i)
                    (- (- (* (n i) 6) (z i)) (+ (* 6 (n 0)) (z 0)))
                )
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
                (= (i1 i) 0)
            )
        )
    )
)

(check-sat)
(get-proof)
(exit)