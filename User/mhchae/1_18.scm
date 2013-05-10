#lang planet neil/sicp
(define (* x y)
  (define (even? n)    
    ( = (remainder n 2) 0))        
  (define (double n)
    (+ n n))
  (define (halve n)
    (if (integer? (/ n 2))
        (/ n 2)
        (/ (- n 1) 2)))        
  (define (*-iter x y buf)
    (cond ((= y 1) (+ buf x))
          ((even? y) (*-iter (double x) 
                             (halve y) 
                                  buf))
          (else (*-iter (double x) 
                        (halve y) 
                        (+ buf x)))))
  (*-iter (max x y) (min x y) 0))

(* 100 10)
    
                      
          