#lang planet neil/sicp
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (display v1)
    (newline)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
              next
          (try next))))
  (try first-guess))

(define (avg x y) (/ (+ x y) 2))
  
(fixed-point (lambda (x) (/ (log 1000) (log x)))
             4)

(fixed-point (lambda (x) (avg x (/ (log 1000) (log x)))) 
             4)