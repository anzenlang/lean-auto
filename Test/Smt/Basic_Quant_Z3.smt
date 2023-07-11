(declare-sort Type)
(declare-fun subtype (Type Type) Bool)
(declare-fun array-of (Type) Type)
(assert (forall ((x Type)) (subtype x x)))
(assert (forall ((x Type) (y Type) (z Type))
          (= (and (subtype x y) (subtype y z)) 
              (subtype x z)))) 
(assert (forall ((x Type) (y Type))
          (= (and (subtype x y) (subtype y x)) 
              (= x y))))
(assert (forall ((x Type) (y Type) (z Type))
          (= (and (subtype x y) (subtype x z)) 
              (or (subtype y z) (subtype z y))))) 
(assert (forall ((x Type) (y Type))
          (= (subtype x y) 
              (subtype (array-of x) (array-of y)))))
(declare-const root-type Type)
(assert (forall ((x Type)) (subtype x root-type)))
(check-sat)