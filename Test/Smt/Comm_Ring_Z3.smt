(declare-sort A)
(declare-const zero A)
(declare-fun add (A A) A)
(declare-fun mul (A A) A)
(declare-fun neg (A) A)
(define-fun sub ((x A) (y A)) A (add x (neg y)))
(assert (forall ((x A)) (= x (add x zero)))) ;Ring axioms start
(assert (forall ((x A)) (= zero (mul x zero))))
(assert (forall ((x A) (y A)) (= (add x y) (add y x))))
(assert (forall ((x A) (y A) (z A)) (= (add x (add y z)) (add (add x y) z))))
(assert (forall ((x A) (y A)) (= (mul x y) (mul y x))))
(assert (forall ((x A) (y A) (z A)) (= (mul x (mul y z)) (mul (mul x y) z))))
(assert (forall ((x A) (y A) (z A)) (= (mul x (add y z)) (add (mul x y) (mul x z)))))
(assert (forall ((x A)) (= (add x (neg x)) zero)))
(declare-const x A)
(declare-const y A)
(declare-const z A)
(assert (not (= (mul (sub y z) x) (sub (mul y x) (mul z x))))); fails when we change (mul z x) to (mul x z)
(check-sat)