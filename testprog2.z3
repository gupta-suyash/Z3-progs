declare-const a Int)
;(assert (> a 10))
;(define-fun f ((a Int)) Int
;  a
;)
;(assert (< (f a) 100))
;(check-sat)
;(get-model)



;(declare-const a Int)
;(assert (> a 10))
;(define-fun f ((a Int)) Int
;  (if (> a 100) 20 105)
;)
;(assert (< (f a) 100))
;(check-sat)
;(get-model)




;(declare-const a Int)
;(assert (and (> a -1) (< a 2)))
;(define-fun f ((a Int)) Int
;  (if (= a 0) 1 0)
;)
;(assert (= (f a) 0))
;(check-sat)
;(get-model)




;(declare-const a Int)
;(assert (and (> a -1) (< a 2)))
;(define-fun f ((a Int)) Int
;  (if (= a 0) 1 0)
;)
;(assert (or (= (f a) 0) (= (f a) 1)))
;(check-sat)
;(get-model)




;(declare-const a Int)
;(declare-const b Int)
;(assert (= a 1))
;(assert (and (> b -1) (< b 2)))
;(define-fun f ((a Int)) Int
;  (if (= a 0) 1 b)
;)
;(assert (or (= (f a) 0) (= (f a) 1)))
;(check-sat)
;(get-model)
