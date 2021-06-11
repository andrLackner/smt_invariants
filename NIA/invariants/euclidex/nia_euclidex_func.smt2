; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/multipath.jl
; INVARIANTS:   p*s - q*r - p00*s00 + q00*r00
;               a*s - b*r - a00*s00 + b00*r00
;               b*p - a*q - b00*p00 + a00*q00
;               r*b00*p00 + p*a00*s00 - a*p00*s00 - r*a00*q00 - p*b00*r00 + a*q00*r00
;               s*b00*p00 + q*a00*s00 - b*p00*s00 - s*a00*q00 - q*b00*r00 + b*q00*r00
; SOURCECODE:     
;   while a != b
;       if a > b
;           a = a - b
;           p = p - q
;           r = r - s
;       else
;           q = q - p
;           b = b - a
;           s = s - r
;       end
;   end

(set-logic NIA)
(set-option :produce-proofs true)

(declare-fun a (Int) Int)
(declare-fun b (Int) Int)
(declare-fun p (Int) Int)
(declare-fun q (Int) Int)
(declare-fun r (Int) Int)
(declare-fun s (Int) Int)

(declare-fun i1 (Int) Int)
(declare-fun i2 (Int) Int)
(declare-fun i3 (Int) Int)
(declare-fun i4 (Int) Int)
(declare-fun i5 (Int) Int)

(assert
    (forall
        ((i Int))
        (=> 
            (>= i 0)
            (and
                (=>
                    (> (a i) (b i))
                    (and
                        (= (a (+ i 1)) (- (a i) (b i)))
                        (= (p (+ i 1)) (- (p i) (q i)))
                        (= (r (+ i 1)) (- (r i) (s i)))
                        (= (q (+ i 1)) (q i))
                        (= (b (+ i 1)) (b i))
                        (= (s (+ i 1)) (s i))
                    )
                )
                (=>
                    (<= (a i) (b i))
                    (and
                        (= (q (+ i 1)) (- (q i) (p i)))
                        (= (b (+ i 1)) (- (b i) (a i)))
                        (= (s (+ i 1)) (- (s i) (r i)))
                        (= (a (+ i 1)) (a i))
                        (= (p (+ i 1)) (p i))
                        (= (r (+ i 1)) (r i))
                    )
                )
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
                (= (i1 i) (+ (- (* (p i) (s i)) (* (q i) (r i)) (* (p 0) (s 0))) (* (q 0) (r 0))))
                (= (i2 i) (+ (- (* (a i) (s i)) (* (b i) (r i)) (* (a 0) (s 0))) (* (b 0) (r 0))))
                (= (i3 i) (+ (- (* (b i) (p i)) (* (a i) (q i)) (* (b 0) (p 0))) (* (a 0) (q 0))))
                (= (i4 i) (+ (- (+ (* (r i) (b 0) (p 0)) (* (p i) (a 0) (s 0))) (* (a i) (p 0) (s 0)) (* (r i) (a 0) (q 0)) (* (p i) (b 0) (r 0))) (* (a i) (q 0) (r 0))))
                (= (i5 i) (+ (- (+ (* (s i) (b 0) (p 0)) (* (q i) (a 0) (s 0))) (* (b i) (p 0) (s 0)) (* (s i) (a 0) (q 0)) (* (q i) (b 0) (r 0))) (* (b i) (q 0) (r 0))))
            )
        )
    )
)

(assert
    (not
        (forall
            ((i Int))
            (=>
                (and
                    (> i 0)
                    (not (= (a (- i 1)) (b (- i 1))))
                )
                (and
                    (= (i1 i) 0)
                    (= (i2 i) 0)
                    (= (i3 i) 0)
                    (= (i4 i) 0)
                    (= (i5 i) 0)
                )
            )
        )
    )
)

(check-sat)
(get-proof)
(exit)