; ORIGIN:       https://github.com/ahumenberger/Aligator.jl/blob/master/benchmark/singlepath.jl
; INVARIANTS:   p*s - q*r - p00*s00 + q00*r00
;               a*s - b*r - a00*s00 + b00*r00
;               b*p - a*q - b00*p00 + a00*q00
;               r*b00*p00 + p*a00*s00 - a*p00*s00 - r*a00*q00 - p*b00*r00 + a*q00*r00
;               s*b00*p00 + q*a00*s00 - b*p00*s00 - s*a00*q00 - q*b00*r00 + b*q00*r00
; RESULT:       timed out
(set-logic NRA)
(declare-const a Real)
(declare-const b Real)
(declare-const p Real)
(declare-const q Real)
(declare-const r Real)
(declare-const s Real)
(declare-const a00 Real)
(declare-const b00 Real)
(declare-const p00 Real)
(declare-const q00 Real)
(declare-const r00 Real)
(declare-const s00 Real)
; loop condition
(assert (not (= a b)))
; Invariant (pre-loop execution)
(assert (= (- (* p s) (- (* q r) (+ (* p00 s00) (* q00 r00)))) 0))
(assert (= (- (* a s) (- (* b r) (+ (* a00 s00) (* b00 r00)))) 0))
(assert (= (- (* b p) (- (* a q) (+ (* b00 p00) (* a00 q00)))) 0))
(assert (= (+ (* (* r b00) p00) (- (* (* p a00) s00) (- (* (* a p00) s00) (- (* (* r a00) q00) (+ (* (* p b00) r00) (* (* a q00) r00)))))) 0))
(assert (= (+ (* (* s b00) p00) (- (* (* q a00) s00) (- (* (* b p00) s00) (- (* (* s a00) q00) (+ (* (* q b00) r00) (* (* b q00) r00)))))) 0))

; Invariant (post-loop execution)
(assert (= (- (* p (- s r)) (- (* (- q p) r) (+ (* p00 s00) (* q00 r00)))) 0))
(assert (= (- (* a (- s r)) (- (* (- b a) r) (+ (* a00 s00) (* b00 r00)))) 0))
(assert (= (+ (* (* r b00) p00) (- (* (* p a00) s00) (- (* (* a p00) s00) (- (* (* r a00) q00) (+ (* (* p b00) r00) (* (* a q00) r00)))))) 0))
(assert (= (+ (* (* (- s r) b00) p00) (- (* (* (- q p) a00) s00) (- (* (* (- b a) p00) s00) (- (* (* (- s r) a00) q00) (+ (* (* (- q p) b00) r00) (* (* (- b a) q00) r00)))))) 0))

; contradiction
(assert (not (= (- (* (- b a) p) (- (* a (- q p)) (+ (* b00 p00) (* a00 q00)))) 0)))

(check-sat)
(exit)


