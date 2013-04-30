(define (my-sqrt base)
  (define (average x y)
    (/ (+ x y) 2))

  (define (improve guess)
    (average guess (/ base guess)))
  
  (define (squre x)
    (* x x))

  (define (good-enough? guess)
    (< (abs (- (squre guess) base)) 0.001))

  (define (sqrt-iter guess base)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess) base)))

  (sqrt-iter 1.0 base))


(my-sqrt 9)