; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   n^2 + n - 1//3*k + 1//3
;
; SOURCECODE:
;   c, k, m, n = 0, 1, 6, 0
;   while true
;       k = k + m
;       m = m + 6
;       n = n + 1
;   end


(set-logic NIA)
(set-option :produce-proofs true)

(declare-fun m (Int) Int)
(declare-fun n (Int) Int)
(declare-fun k (Int) Int)

(declare-fun i4 (Int) Int)

(assert
    (and
        (= (k 0) 1)
        (= (m 0) 6)
        (= (n 0) 0)
    )
)

(assert
    (forall 
        ((i Int))
        (=>
            (>= i 0)
            (and
                (= (k (+ i 1)) (+ (k i) (m i)))
                (= (m (+ i 1)) (+ (m i) 6))
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
                (i4 i)
                (+ (* (* 3 (n i)) (n i)) (+ (- (* 3 (n i)) (k i)) 1))
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