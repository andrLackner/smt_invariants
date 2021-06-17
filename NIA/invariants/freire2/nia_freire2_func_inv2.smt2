; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   r*r00^2 - r00^3 - 1//6*s*r - 1//3*r*s00 + 1//2*s00*r00 + 1//4*s - 1//4*r - 1//2*x - 1//4*s00 + 1//4*r00 + 1//2*x00
;               
; SOURCECODE:
;   while x-s > 0
;       x = x-s
;       s = s+6*r+3
;       r = r+1
;   end

(set-logic NIA)
(set-option :produce-proofs true)

(declare-fun x (Int) Int)
(declare-fun s (Int) Int)
(declare-fun r (Int) Int)

(declare-fun i2 (Int) Int)

(assert
    (forall
        ((i Int))
        (=>
            (>= i 0)
            (and
                (= (x (+ i 1)) (- (x i) (s i)))
                (= (s (+ i 1)) (+ (s i) (* 6 (r i)) 3))
                (= (r (+ i 1)) (+ (r i) 1))
            )
        )
    )
)

(assert
    (forall
        ((i Int))
        (=>
            (>= i 0)
            (= (i2 i) (+ (- (+ (- (* 12 (r i) (r 0) (r 0)) (* 12 (r 0) (r 0) (r 0)) (* 2 (s i) (r i)) (* 4 (r i) (s 0))) (* 6 (s 0) (r 0)) (* 3 (s i))) (* 3 (r i)) (* 6 (x i)) (* 3 (s 0))) (* 3 (r 0)) (* 6 (x 0))))
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