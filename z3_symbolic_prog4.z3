(declare-datatypes () ((kind R W)))
(declare-sort effect)
(declare-datatypes () ((var x y)))
(declare-fun oper (effect) kind)	; R/W
(declare-fun rval (effect) Int)		; Value
(declare-fun sval (effect) var)		; variable type
(declare-fun ssid (effect) Int)	; session id
(declare-fun vis (effect effect) Bool)
(declare-fun so (effect effect) Bool)
(declare-fun same (effect effect) Bool)
(declare-fun hb (effect effect) Bool)

(declare-const ex Int)
(declare-const ey Int)
(declare-const ez Int)

; Declarations
(declare-const a effect)
(declare-const b effect)
(declare-const c effect)
(declare-const d effect)
(declare-const e effect)

; oper assertions
(assert (= (oper a) W))
(assert (= (oper b) R))
(assert (= (oper c) W))
(assert (= (oper d) W))
(assert (= (oper e) R))

; sval assertions
(assert (= (sval a) x))
(assert (= (sval b) y))
(assert (= (sval c) y))
(assert (= (sval d) x))
(assert (= (sval e) x))

; rval assertions
(assert (= (rval a) 1))
(assert (= (rval c) 1))
(assert (= (rval d) 2))

; ssid assertions
(assert (= (ssid a) 1))
(assert (= (ssid b) 1))
(assert (= (ssid c) 2))
(assert (= (ssid d) 2))
(assert (= (ssid e) 2))

; Setting SO relation
(assert (= (so a b) true))
(assert (= (so c d) true))
(assert (= (so d e) true))

; Setting SameObj relation
(assert (= (same a d) true))
(assert (= (same b c) true))
(assert (= (same d e) true))

; properties on SO
(assert (forall ((x effect) (y effect) (z effect))
	( => 	(and (so x y) (so y z))
		(so x z))))
(assert (forall ((x effect))
	(not (so x x))))
(assert (forall ((x effect) (y effect))
	( =>	(so x y) 
		(= (ssid x) (ssid y)))))

; properties on SameObj
(assert (forall ((x effect) (y effect) (z effect))
	( => 	(and (same x y) (same y z))
		(same x z))))
(assert (forall ((x effect) (y effect))
	( => 	(same x y) (same y x))))
(assert (forall ((x effect) (y effect))
	( =>	(same x y) 
		(= (sval x) (sval y)))))
 
; properties on Vis
(assert (forall ((x effect))
		(not (vis x x))))
(assert (forall ((x effect) (y effect))
	( => 	(vis x y) 
		(not (vis y x)))))

; properties on hb order
(assert (forall ((x effect) (y effect)) 
    (=> (or (vis x y) (so x y)) 
	(hb x y))))
(assert (forall ((x effect) (y effect) (z effect)) 
    (=> (and (hb x y) (hb y z)) 
	(hb x z))))
(assert (forall ((x effect)) 
	(not (hb x x))))

(assert (forall ((x effect) (y effect) (z effect))
	( => 
		(and 
			(and 
				(and
					(= (oper x) R)
					(and  (= (oper y) W) (= (oper z) W)))
				(and 
					(= (same x y) true)
					(= (same y z) true)) 
			)
			(and 
				(= (vis y x) true) 
				(and 
					(= (vis z x) true)
					(= (hb y z) true))
			))
		(= (rval x) (rval z)))))	
		 

; Modeling EC system
(assert 
  (= ex
    (ite (vis c b) (rval c) 0)))

(assert (= (rval b) ex))

(assert 
  (= ey
    (ite (vis a e) (rval a) 0)))

(assert 
  (= ez
    (ite (vis d e) (rval d) 0)))

(assert 
  (or 
    (= (rval e) ey)
    (= (rval e) ez)))


; Modeling one Quelea contract

(assert (forall ((x effect) (y effect))
	( => (same x y)	
	  (or 
	    (= x y)
	    (or
	      (vis x y)
	      (vis y x))))))	

; Modeling constraints

(assert 
  (and  
    (= (rval b) 1)
    (= (rval e) 2)))


(check-sat)  
(get-model)
