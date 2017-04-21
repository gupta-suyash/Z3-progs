(declare-datatypes () ((kind R W)))
(declare-sort effect)
(declare-fun oper (effect) kind)	; R/W
(declare-fun rval (effect) Int)		; Value
(declare-fun sval (effect) String)	; variable type
(declare-fun ssid (effect) Int)	; session id
(declare-fun vis (effect effect) Bool)
(declare-fun so (effect effect) Bool)
(declare-fun same (effect effect) Bool)
(declare-fun hb (effect effect) Bool)

; Declarations
(declare-const ix effect)
(declare-const iy effect)
(declare-const a effect)
(declare-const b effect)
(declare-const c effect)
(declare-const d effect)

; oper assertions
(assert (= (oper ix) W))
(assert (= (oper iy) W))
(assert (= (oper a) W))
(assert (= (oper b) R))
(assert (= (oper c) W))
(assert (= (oper d) R))

; sval assertions
(assert (= (sval ix) "x"))
(assert (= (sval iy) "y"))
(assert (= (sval a) "x"))
(assert (= (sval b) "y"))
(assert (= (sval c) "y"))
(assert (= (sval d) "x"))

; rval assertions
(assert (= (rval ix) 0))
(assert (= (rval iy) 0))
(assert (= (rval a) 1))
(assert (= (rval c) 1))

; ssid assertions
(assert (= (ssid a) 1))
(assert (= (ssid b) 1))
(assert (= (ssid c) 2))
(assert (= (ssid d) 2))

; Setting SO relation
(assert (= (so a b) true))
(assert (= (so c d) true))

; Setting SameObj relation
(assert (= (same ix a) true))
(assert (= (same a d) true))
(assert (= (same iy b) true))
(assert (= (same b c) true))

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

; Modeling EC system
(assert 
  (or
    (and  
      (= (rval b) (rval c)) 
      (and (vis c b) (vis iy b)))
    (and    
      (= (rval b) (rval iy))      
      (and (vis iy b) (not (vis c b))))
  ))

(assert 
  (or
    (and  
      (= (rval d) (rval a)) 
      (and (vis a d) (vis ix a)))
    (and    
      (= (rval d) (rval ix))      
      (and (vis ix d) (not (vis a d))))
  ))


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
    (= (rval b) 0)
    (= (rval d) 1)))


(check-sat)  
(get-model)
