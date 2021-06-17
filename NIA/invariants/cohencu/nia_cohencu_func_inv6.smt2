; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   y^2*z00^2 - y00^2*z00^2 - y*z00^3 - 2*x*z00^3 + y00*z00^3 + 2*z00^3*x00 - 4*y^3 - 12*y^2*y00 + 16*y00^3 - 6*y^2*z00 + 18*y*y00*z00 + 36*x*y00*z00 - 12*y00^2*z00 + 10*y*z00^2 + 18*x*z00^2 - 10*y00*z00^2 - 36*y00*z00*x00 - 18*z00^2*x00 + 24*y^2 + 108*y*x + 108*x^2 - 120*y*y00 - 216*x*y00 + 96*y00^2 - 24*y*z00 - 36*x*z00 + 24*y00*z00 - 108*y*x00 - 216*x*x00 + 216*y00*x00 + 36*z00*x00 + 108*x00^2
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

(declare-fun i6 (Int) Int)

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
                (i6 i)
                (- (* (* (* (y i) (y i)) (z 0)) (z 0)) (- (* (* (* (y 0) (y 0)) (z 0)) (z 0)) (- (* (* (* (y i) (z 0)) (z 0)) (z 0)) (+ (* (* (* (* 2 (x i)) (z 0)) (z 0)) (z 0)) (+ (* (* (* (y 0) (z 0)) (z 0)) (z 0)) (- (* (* (* (* 2 (z 0)) (z 0)) (z 0)) (x 0)) (- (* (* (* 4 (y i)) (y i)) (y i)) (+ (* (* (* 12 (y i)) (y i)) (y 0)) (- (* (* (* 16 (y 0)) (y 0)) (y 0)) (+ (* (* (* 6 (y i)) (y i)) (z 0)) (+ (* (* (* 18 (y i)) (y 0)) (z 0)) (- (* (* (* 36 (x i)) (y 0)) (z 0)) (+ (* (* (* 12 (y 0)) (y 0)) (z 0)) (+ (* (* (* 10 (y i)) (z 0)) (z 0)) (- (* (* (* 18 (x i)) (z 0)) (z 0)) (- (* (* (* 10 (y 0)) (z 0)) (z 0)) (- (* (* (* 36 (y 0)) (z 0)) (x 0)) (+ (* (* (* 18 (z 0)) (z 0)) (x 0)) (+ (* (* 24 (y i)) (y i)) (+ (* (* 108 (y i)) (x i)) (- (* (* 108 (x i)) (x i)) (- (* (* 120 (y i)) (y 0)) (+ (* (* 216 (x i)) (y 0)) (- (* (* 96 (y 0)) (y 0)) (- (* (* 24 (y i)) (z 0)) (+ (* (* 36 (x i)) (z 0)) (- (* (* 24 (y 0)) (z 0)) (- (* (* 108 (y i)) (x 0)) (+ (* (* 216 (x i)) (x 0)) (+ (* (* 216 (y 0)) (x 0)) (+ (* (* 36 (z 0)) (x 0)) (* (* 108 (x 0)) (x 0)))))))))))))))))))))))))))))))))
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
                (= (i6 i) 0)
            )
        )
    )
)

(check-sat)
(get-proof)
(exit)