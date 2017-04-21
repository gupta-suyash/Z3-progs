(declare-datatypes (T1 T2) ((Pair (mk-pair (first T1) (second T2)))))
(declare-const a Int)
(declare-const ht Int)
(declare-const p1 (Pair Int Int))
(declare-const p2 (Pair Int Int))
(declare-const p3 (Pair Int Int))

(assert (= a 0))
(assert (= ht 7))
(assert (and 
  (= (first p2) 1)
  (= (second p2) 6)
))  

(assert (and 
  (= (first p3) 0)
  (= (second p3) 7)
))

(assert (or 
  (= p1 p2)
  (= p1 p3)
))


(define-fun f ((a Int)) (Pair Int Int)
  (if (= a 0)
    ( 
      (= (first p1) 1)
      (= (second p1) 6)
    )
    p1
  )
)

(assert (or 
  (and 
    (= (first (f a)) 1) 
    (= (second (f a)) 6)
  ) 
  (and 
    (= (first (f a)) 0) 
    (= (second (f a)) 7)
  )))

(check-sat)
(get-model)

