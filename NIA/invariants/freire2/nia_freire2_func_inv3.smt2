; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   s*r*r00 - r*s00*r00 - s*r00^2 + s00*r00^2 + 1//3*s^2 - 3//2*s*r + 3*r*x + 1//3*s*s00 + 3//2*r*s00 - 2//3*s00^2 - 3//2*s*r00 + 3*x*r00 + 3//2*s00*r00 - 3*r*x00 - 3*r00*x00 + 1//2*s - 1//2*s00
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

(declare-fun i3 (Int) Int)

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
            (= (i3 i) (- (+ (- (+ (- (+ (- (+ (- (* 6 (s i) (r i) (r 0)) (* 6 (r i) (s 0) (r 0)) (* 6 (s i) (r 0) (r 0))) (* 6 (s 0) (r 0) (r 0)) (* 2 (s i) (s i))) (* 9 (s i) (r i))) (* 3 (r i) (x i)) (* 2 (s i) (s 0)) (* 9 (r i) (s 0))) (* 4 (s 0) (s 0)) (* 9 (s i) (r 0))) (* 18 (x i) (r 0)) (* 9 (s 0) (r 0))) (* 18 (r i) (x 0)) (* 18 (r 0) (x 0))) (* 3 (s i))) (* 3 (s 0))))
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