; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   m - 6*n - 6
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

(declare-fun m (Int) Int)
(declare-fun n (Int) Int)

(declare-fun i1 (Int) Int)
(assert
    (and
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
                (i1 i)
                (- (m i) (+ (* 6 (n i)) 6))
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