;(declare-const a Bool)
;(declare-const y Int)
;(assert (= y 0))
;(assert (not (= (+ (if (= a true) 3 1) y) 3)))
;(check-sat)


;(declare-const a Bool)
;(declare-const x Int)
;(declare-const y Int)
;(assert (= x 0))
;(assert (= y 0))
;(assert (= (+ (if (= a true) 3 x) y) 3)) 
;(check-sat)
;(get-model)


(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(assert (= x 0))
(assert (= y 0))
(assert (= z 0))
(assert (not (= (+ (+ (if (= a 1) -2 x) 
  (if (< b 5) (if (and (= a 0) (= c 1)) 1 y) y)) 
  (if (< b 5) 2 z)) 
  3))) 
(check-sat)
(get-model)



(declare-const a Bool)
(declare-const x1 Int)
(declare-const x2 Int)
(declare-const y Int)
(assert (= x1 0))
(assert (= y 0))
(assert (=> a (= x2 3)))
(assert (not (= (+ x2 y) 3))) 
(check-sat)
(get-model)



(declare-const a Bool)
(declare-const x Int)
(declare-const y Int)
(assert (= x 0))
(assert (= y 0))
(define-fun f ((a Bool) (x Int)) Int
  (if a 3 x) 
)
(define-fun sum ((a Bool) (x Int) (y Int)) Int
 (+ (f a x) y)
)  
(assert (not (= (sum a x y) 3)))
(check-sat)
(get-model)


