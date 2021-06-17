; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   n*k + 2*n - k - 3*c + 1
;
; SOURCECODE:
;   c, k, m, n = 0, 1, 6, 0
;   while true
;       c = c + k
;       k = k + m
;       n = n + 1
;   end


(set-logic NIA)
(set-option :produce-proofs true)

(declare-fun m (Int) Int)
(declare-fun n (Int) Int)
(declare-fun c (Int) Int)
(declare-fun k (Int) Int)

(declare-fun i1 (Int) Int)
(declare-fun i2 (Int) Int)
(declare-fun i3 (Int) Int)
(declare-fun i4 (Int) Int)

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
                (i3 i)
                (+ (* (n i) (k i)) (- (- (* 2 (n i)) (k i)) (+ (* 3 (c i)) 1)))
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