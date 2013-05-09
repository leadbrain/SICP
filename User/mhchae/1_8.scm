#lang planet neil/sicp
(define (square x exp)
  (define (square-iter res exp)
    (if (= exp 0)      
        res
        (square-iter (* res x)
                     (- exp 1))))  
  (square-iter 1 exp))

(define (cbrt x)  
  (define (improve y)
    ( / (+ (/ x (square y 2)) (* 2 y)) 3))
  (define (good-enough? y priv_y)
    (and (< (abs (- (square y 3) x)) (abs (- (square priv_y 3) x))) 
         (< (abs (- (square y 3) x)) 0.0001)))
  (define (cbrt-iter y priv)
    (if (good-enough? y priv)
        y
        (cbrt-iter (improve y) y)))
  (cbrt-iter (/ x 2) (/ x 2)))

(cbrt 8)
(expt 8 1/3)