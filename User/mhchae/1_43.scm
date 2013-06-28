#lang planet neil/sicp
(define (inc a) (+ a 1))
(define (square a) (* a a))

(define (compose f g)
  (lambda (a) (f (g a))))

(define (repeated f n) 
  (define (repeated-iter x n)
    (cond ((= n 0) x) 
          ((= n 1) (f x)) 
          (else (repeated-iter ((compose f f) x) (- n 2)))))        
  (lambda (x) (repeated-iter x n)))

((repeated square 0) 0)