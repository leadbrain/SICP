(define (findbig item1 item2)
  (if (> item1 item2)
    item1
    item2))

(define (foo x y z)
  (define big
    (findbig x y))
  (define small
    (if (> x y)
      y
      x))
  (define big2
    (findbig z small))
  (+ big big2))

(foo 3 4 5)

(foo 3 5 4)

(foo 10 9 8)

(foo 9 10 8)

(foo 9 4 10)

(foo 10 4 9)



