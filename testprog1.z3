;(echo "Hello")
;(declare-const a Int)
;(declare-fun f (Int Bool) Int)
;(assert (> a 10))
;(assert (and (> a 10) (< a 10)))

;(declare-fun x () Bool)
;(declare-fun y () Bool)
;(assert (= (not (and x y)) (or (not x) (not y))))
;(check-sat)


;(declare-fun x () Bool)
;(declare-fun y () Bool)
;(assert (= (not (or x y)) (and (not x) (not y))))
;(check-sat)


;(declare-fun x () Bool)
;(declare-fun y () Bool)
;(assert (= (and x y) (not (or (not x) (not y)))))
;(check-sat)


;(declare-const a Bool)
;(declare-const b Bool)
;(define-fun demorgan () Bool
;	(= (and a b) (not (or (not a) (not b)))))
;(assert demorgan)
;(check-sat)
;(get-model)


;(declare-fun f (Bool) (Bool))
;(assert
;	(=>
;		(forall ((p Bool)) (f p))
;		(not (exists ((q Bool)) (not (f q))))))
;(check-sat)
;(get-model)


;(declare-const a Int)
;(declare-fun f (Int Bool) Int)
;(assert (> a 10))
;(assert (< (f a true) 100))
;(check-sat)
;(get-model)


;(declare-const a (Array Int Int))
;(declare-const x Int)
;(declare-const y Int)
;(display (+ x 2 x 1))
;(simplify (+ x 2 x 1))
;(simplify (* (+ x y) (+ x y)))
;;(simplify (* (+ x y) (+ x y)) :som true) ; put all expressions in sum-of-monomials form.
;;(help simplify)
;(simplify (= x (+ y 2)) :arith-lhs true)
;(simplify (= (store (store a 1 2) 4 3)
;             (store (store a 4 3) 1 2)))



;(declare-const x Int)
;(declare-const y Int)
;(declare-const z Int)
;(assert (and (> x y) (> y z)))
;(check-sat)
;(get-model)



;(declare-const p Bool)
;(declare-const q Bool)
;(declare-const r Bool)
;(define-fun conjecture () Bool 
;	(=> (and (=> p q) (=> q r))
;		(=> p r)))
;(assert (not conjecture))
;(check-sat)



;(declare-fun f (Int) Int)
;(assert (= (f 10) 1))
;(check-sat)
;(get-model)



;(declare-sort A)
;(declare-const x A)
;(declare-const y A)
;(declare-fun f (A) A)
;(assert (= (f (f x)) x))
;(assert (= (f x) y))
;(assert (not (= x y)))
;(check-sat)
;(get-model)



;(declare-const a Int)
;(assert (> (* a a) 3))
;(check-sat)
;(get-model)



;(echo "Z3 does not always find solutions to non-linear problems")
;(declare-const b Real)
;(declare-const c Real)
;(assert (= (+ (* b b b) (* b c)) 3.0))
;(check-sat)
;(get-model)



;(echo "yet it can show unsatisfiabiltiy for some nontrivial nonlinear problems...")
;(declare-const x Real)
;(declare-const y Real)
;(declare-const z Real)
;(assert (= (* x x) (+ x 2.0)))
;(assert (= (* x y) x))
;(assert (= (* (- y 1.0) z) 1.0))
;(check-sat)


(echo "When presented only non-linear constraints over reals, Z3 uses a specialized complete solver")
(declare-const b Real)
(declare-const c Real)
(assert (= (+ (* b b b) (* b c)) 3.0))
(check-sat)
(get-model)




