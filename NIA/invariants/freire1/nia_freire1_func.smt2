; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   r^2 - r00^2 - r + 2*x + r00 - 2*x00
;
; SOURCECODE:
;       while x>r
;           x = x-r
;           r = r+1
;       end

(set-logic NIA)
(set-option :produce-proofs true)

(declare-fun x (Int) Int)
(declare-fun r (Int) Int)

(assert
    (forall 
        ((i Int))
        (=> 
            (>= i 0)
            (and
                (= (x (+ i 1)) (- (x i) (r i)))
                (= (r (+ i 1)) (+ (r i) 1))
            )
        )
    )
)

(assert
    (not
        (forall
            ((i Int))
            (=>
                (and
                    (>= i 0)
                    (> (x i) (r i))
                )
                (= 
                    (- (* (r i) (r i)) (+ (- (* (r 0) (r 0)) (r i)) (- (+ (* 2 (x i)) (r 0)) (* 2 (x 0)))))
                0)
            )
       )
    )
)

(check-sat)
(get-proof)
(exit)