; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   m - 6*n - 6
;               k^2 - 9*n*c + 9*n - 5*k - 18*c + 4
;               n*k + 2*n - k - 3*c + 1
;               n^2 + n - 1//3*k + 1//3
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
                (= (c (+ i 1)) (+ (c i) (k i)))
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
            (and
                (=
                    (i1 i)
                    (- (m i) (- (* 6 (n i)) 6))
                )
                (=
                    (i2 i)
                    (- (* (k i) (k i)) (+ (* (* 9 (n i)) (c i)) (- (* 9 (n i)) (- (* 5 (k i)) (+ (* 18 (c i)) 4)))))
                )
                (=
                    (i3 i)
                    (+ (* (n i) (k i)) (- (- (* 2 (n i)) (k i)) (+ (* 3 (c i)) 1)))
                )
                (=
                    (i4 i)
                    (+ (* (* 3 (n i)) (n i)) (+ (- (* 3 (n i)) (k i)) 1))
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
                (and
                    (= (i1 i) 0)
                    (= (i2 i) 0)
                    (= (i3 i) 0)
                    (= (i4 i) 0)
                )
            )
        )
    )
)

(check-sat)
(exit)