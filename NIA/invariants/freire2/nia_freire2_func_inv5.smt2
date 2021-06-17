; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   s^2*r00^2 - s00^2*r00^2 - 6*s*r00^3 + 12*x*r00^3 + 6*s00*r00^3 - 12*r00^3*x00 - 1//9*s^3 - 1//3*s^2*s00 + 4//9*s00^3 + 3*s*s00*r00 - 6*x*s00*r00 - 3*s00^2*r00 + s*r00^2 - s00*r00^2 + 6*s00*r00*x00 + 5//12*s^2 - 3*s*x + 3*x^2 - 11//6*s*s00 + 3*x*s00 + 17//12*s00^2 + 3//2*s*r00 - 3*x*r00 - 3//2*s00*r00 + 3*s*x00 - 6*x*x00 - 3*s00*x00 + 3*r00*x00 + 3*x00^2 - 1//4*s + 1//4*s00
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

(declare-fun i5 (Int) Int)

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
            (= (i5 i) (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (+ (- (* 36 (s i) (s i) (r 0) (r 0)) (* 36 (s 0) (s 0) (r 0) (r 0)) (* 216 (s i) (r 0) (r 0) (r 0))) (* 432 (x i) (r 0) (r 0) (r 0)) (* 216 (s 0) (r 0) (r 0) (r 0))) (* 432 (r 0) (r 0) (r 0) (x 0)) (* 4 (s i) (s i) (s i)) (* 12 (s i) (s i) (s 0))) (* 16 (s 0) (s 0) (s 0)) (* 108 (s i) (s 0) (r 0))) (* 216 (x i) (s 0) (r 0)) (* 108 (s 0) (s 0) (r 0))) (* 36 (s i) (r 0) (r 0))) (* 36 (s 0) (r 0) (r 0))) (* 216 (s 0) (r 0) (x 0)) (* 15 (s i) (s i))) (* 108 (s i) (x i))) (* 108 (x i) (x i))) (* 66 (s i) (s 0))) (* 108 (x i) (s 0)) (* 51 (s 0) (s 0)) (* 54 (s i) (r 0))) (* 108 (x i) (r 0)) (* 54 (s 0) (r 0))) (* 108 (s i) (x 0))) (* 216 (x i) (x 0)) (* 108 (s 0) (x 0))) (* 108 (r 0) (x 0)) (* 108 (x 0) (x 0))) (* 9 (s i))) (* 9 (s 0))))
        )
    )
)

(assert
    (not
        (forall
            ((i Int))
            (=>
                (>= i 0)
                (= (i5 i) 0)
            )
        )
    )
)

(check-sat)
(get-proof)
(exit)