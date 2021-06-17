; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   s^2*r + s*r*s00 - 2*r*s00^2 + 2*s^2*r00 + 18*r*x*r00 - s*s00*r00 - s00^2*r00 - 18*s*r00^2 + 18*x*r00^2 + 18*s00*r00^2 - 18*r*r00*x00 - 18*r00^2*x00 + 3//2*s^2 - 12*s*r + 3*s*x + 27*r*x + 6*s*s00 + 12*r*s00 - 3*x*s00 - 15//2*s00^2 - 12*s*r00 + 27*x*r00 + 12*s00*r00 - 3*s*x00 - 27*r*x00 + 3*s00*x00 - 27*r00*x00 + 9//2*s - 9//2*s00
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

(declare-fun i4 (Int) Int)

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
            (= (i4 i) (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (* 2 (s i) (s i) (r i)) (* 2 (s i) (r i) (s 0))) (* 4 (r i) (s 0) (s 0))) (* 4 (s i) (s i) (r 0)) (* 36 (r i) (x i) (r 0))) (* 2 (s i) (s 0) (r 0)) (* 2 (s 0) (s 0) (r 0)) (* 36 (s i) (r 0) (r 0))) (* 36 (x i) (r 0) (r 0)) (* 36 (s 0) (r 0) (r 0))) (* 36 (r i) (r 0) (x 0)) (* 36 (r 0) (r 0) (x 0))) (* 3 (s i) (s i))) (* 24 (s i) (r i))) (* 6 (s i) (x i)) (* 54 (r i) (x i)) (* 12 (s i) (s 0)) (* 24 (r i) (s 0))) (* 6 (x i) (s 0)) (* 15 (s 0) (s 0)) (* 24 (s i) (r 0))) (* 54 (x i) (r 0)) (* 24 (s 0) (r 0))) (* 6 (s i) (x 0)) (* 54 (r i) (x 0))) (* 6 (s 0) (x 0))) (* 54 (r 0) (x 0))) (* 9 (s i))) (* 9 (s 0))))
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