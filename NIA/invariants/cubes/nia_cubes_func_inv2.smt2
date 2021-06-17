; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   k^2 - 9*n*c + 9*n - 5*k - 18*c + 4
;
; SOURCECODE:
;   c, k, m, n = 0, 1, 6, 0
;   while true
;       c = c + k
;       k = k + m
;       m = m + 6
;       n = n + 1
;   end


(set-logic NIA)
(set-option :produce-proofs true)

(declare-fun n (Int) Int)
(declare-fun c (Int) Int)
(declare-fun k (Int) Int)

(declare-fun i2 (Int) Int)

(assert
    (and
        (= (c 0) 0)
        (= (k 0) 1)
        (= (n 0) 0)
    )
)

(assert
    (forall 
        ((i Int))
        (=>
            (>= i 0)
            (and
                (= (c (+ i 1)) (+ (c i) (k i)))
                (= (k (+ i 1)) (+ (k i) (m i)))
                (= (n (+ i 1)) (+ (n i) 1))
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
                (- (* (k i) (k i)) (+ (* (* 9 (n i)) (c i)) (- (* 9 (n i)) (- (* 5 (k i)) (+ (* 18 (c i)) 4)))))
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