; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   y - y00
;               q*y00 - y00*q00 + r - r00
;
; SOURCECODE:
;    while true
;        r = r - y
;        q = q + 1
;    end

(set-logic NIA)

(declare-fun y (Int) Int)
(declare-fun r (Int) Int)
(declare-fun q (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun i2 (Int) Int)

(assert 
    (forall
        ((i Int))
        (=>
            (>= i 0)
            (and
                (= (r (+ i 1)) (- (r i) (y i)))
                (= (q (+ i 1)) (+ (q i) 1))
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
                (= (i1 i) (- (y i) (y 0)))
                (= (i2 i) (- (* (q i) (y 0)) (- (+ (* (y 0) (q 0)) (r i)) (r 0))))
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
                    (= (i1 i) 0)
                    (= (i2 i) 0)
                )
            )
        )
    )
)

(check-sat)
(exit)