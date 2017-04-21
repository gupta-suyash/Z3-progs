(declare-datatypes () ((kind R W)))
(declare-sort effect)
(declare-fun oper (effect) kind)
(declare-fun rval (effect) Int)
(declare-fun vis (effect effect) Bool)
(declare-const x effect)
(declare-const y effect)
(declare-const z effect)
(assert (and
  (and 
    (= (oper z) R)
    (and
      (= (oper x) W)
      (= (oper y) W)
    )) 
  (or
    (and  
      (= (rval z) (rval x)) 
      (and (vis x z) (not (vis y z))))
    (and    
      (= (rval z) (rval y))      
      (and (vis y z) (not (vis x z))))
  )))
(check-sat)  
(get-model)      

