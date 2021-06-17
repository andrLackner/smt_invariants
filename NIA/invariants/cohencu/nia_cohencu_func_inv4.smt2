; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   y*z*z00 - z*y00*z00 - y*z00^2 + y00*z00^2 + 12*y^2 - 12*y*z - 18*z*x + 12*y*y00 + 12*z*y00 - 24*y00^2 - 6*y*z00 - 18*x*z00 + 6*y00*z00 + 18*z*x00 + 18*z00*x00 + 72*y + 108*x - 72*y00 - 108*x00
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

(declare-fun i4 (Int) Int)

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
                (i4 i)
                (- (* (* (y i) (z i)) (z 0)) (- (* (* (z i) (y 0)) (z 0)) (+ (* (* (y i) (z 0)) (z 0)) (+ (* (* (y 0) (z 0)) (z 0)) (- (* (* 12 (y i)) (y i)) (- (* (* 12 (y i)) (z i)) (+ (* (* 18 (z i)) (x i)) (+ (* (* 12 (y i)) (y 0)) (- (* (* 12 (z i)) (y 0)) (- (* (* 24 (y 0)) (y 0)) (- (* (* 6 (y i)) (z 0)) (+ (* (* 18 (x i)) (z 0)) (+ (* (* 6 (y 0)) (z 0)) (+ (* (* 18 (z i)) (x 0)) (+ (* (* 18 (z 0)) (x 0)) (+ (* 72 (y i)) (- (* 108 (x i)) (- (* 72 (y 0)) (* 108 (x 0))))))))))))))))))))
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
                (= (i4 i) 0)
            )
        )
    )
)

(check-sat)
(get-proof)
(exit)