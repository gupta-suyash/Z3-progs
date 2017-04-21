(declare-const ex Bool)
(assert (= ex (or false)))
(check-sat)
(get-model)
