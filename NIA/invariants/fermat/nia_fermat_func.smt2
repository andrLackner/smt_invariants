; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/multipath.jl
; INVARIANTS:   v^2 - u^2 - v00^2 + u00^2 - 2*v + 2*u + 4*r + 2*v00 - 2*u00 - 4*r00
;
; SOURCECODE:     
;   while r != 0
;       if r > 0
;           r = r - v
;           v = v + 2
;       else
;           r = r + u
;           u = u + 2
;       end
;   end

(set-logic NIA)
(set-option :produce-proofs true)

(declare-fun u (Int) Int)
(declare-fun v (Int) Int)
(declare-fun r (Int) Int)

(declare-fun i1 (Int) Int)

(assert
    (forall
        ((i Int))
        (=> 
            (>= i 0)
            (and
                (=>
                    (> (r i) 0)
                    (and
                        (= (r (+ i 1)) (- (r i) (v i)))
                        (= (v (+ i 1)) (+ (v i) 2))
                        (= (u (+ i 1)) (u i))
                    )
                )
                (=>
                    (<= (r i) 0)
                    (and
                        (= (r (+ i 1)) (+ (r i) (u i)))
                        (= (u (+ i 1)) (+ (u i) 2))
                        (= (v (+ i 1)) (v i))
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
            (= (i1 i) (- (+ (- (+ (- (* (v i) (v i)) (* (u i) (u i)) (* (v 0) (v 0))) (* (u 0) (u 0))) (* 2 (v i))) (* 2 (u i)) (* 4 (r i)) (* 2 (v 0))) (* 2 (u 0)) (* 4 (r 0))))
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
                    (not (= (r (- i 1)) 0))
                )
                (= (i1 i) 0)
            )
        )
    )
)

(check-sat)
(get-proof)
(exit)