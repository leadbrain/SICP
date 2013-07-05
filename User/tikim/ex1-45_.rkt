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

(define (square x)
  (* x x))

(define (sqrt x)
  (fixed-point (lambda (y) (avg y (/ x y)))
             1.0))
  
(define (cube x)
  (fixed-point (lambda (y) (avg y (/ x (* y y))))
             1.0))

(define (qdrt x)
  (fixed-point (lambda (y) (avg y (/ x (* y (* y y)))))
             1.0))

(define (inc x)
  (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter res i)
    (if (> i 1)
        (iter (compose f res) (- i 1))
        res))
  (iter f n))

;((repeated sqrt 4) 65536)
;((repeated ((fixed-point (lambda (y) (/ x y)))
 ;           4) 2) 5)
;(sqrt 16)
 ;(cube 8)
 (qdrt 65536)
 
;((compose square inc) 6)
;(fixed-point (lambda (x) (/ (log 1000) (log x)))
 ;            4)

;(fixed-point (lambda (x) (avg x (/ (log 1000) (log x)))) 
;             4)