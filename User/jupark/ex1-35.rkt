#lang planet neil/sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (f x)
  (+ 1 (/ 1.0 x)))

(fixed-point f 3)
(fixed-point f -0.618031)
(fixed-point f -0.618032)
(fixed-point f -0.618033)
(fixed-point f -0.618034)
(fixed-point f -0.618035)
(fixed-point f -0.618036)
(fixed-point f -0.618037)
(fixed-point f -0.618038)
(fixed-point f -0.618039)