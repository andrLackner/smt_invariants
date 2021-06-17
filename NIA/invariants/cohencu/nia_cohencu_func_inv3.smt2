; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   z*z00^2 - z00^3 - 6*y*z - 12*z*y00 - 6*z*z00 + 18*y00*z00 + 6*z00^2 + 72*y + 108*x - 72*y00 - 108*x00
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


(declare-fun x (Int) Int)
(declare-fun z (Int) Int)
(declare-fun y (Int) Int)

(declare-fun i3 (Int) Int)

(assert
    (forall
        ((i Int))
        (=>
            (>= i 0)
            (and
                (= (x (+ i 1)) (+ (y i) (x i)))
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
                (i3 i)
                (- (* (* (z i) (z 0)) (z 0)) (- (* (* (z 0) (z 0)) (z 0)) (- (* (* 6 (y i)) (z i)) (- (* (* 12 (z i)) (y 0)) (+ (* (* 6 (z i)) (z 0)) (+ (* (* 18 (y 0)) (z 0)) (+ (* (* 6 (z 0)) (z 0)) (+ (* 72 (y i)) (- (* 108 (x i)) (- (* 72 (y 0)) (* 108 (x 0))))))))))))
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
                (= (i3 i) 0)
            )
        )
    )
)

(check-sat)
(get-proof)
(exit)