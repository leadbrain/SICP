(define (foo x y z)
  (define (squre item)
    (* item item))
  (define (findsmall item1 item2)
    (if (< item1 item2)
      item1
      item2))
  (define (findbig item1 item2)
    (if (> item1 item2)
      item1
      item2))
  (+ (squre (findbig x y)) 
     (squre (findbig (findsmall x y) z))))

(foo 3 4 5)

(foo 3 5 4)

(foo 10 9 8)

(foo 9 10 8)

(foo 9 4 10)

(foo 10 4 9)