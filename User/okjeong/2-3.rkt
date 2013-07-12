#lang planet neil/sicp

(define (make-segment s e)
  (cons s e))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-rect lt rb)
  (cons lt rb))

(define (left-top r)
  (car r))

(define (right-bottom r)
  (cdr r))
  
(define (폭 r)
  (- (x-point (right-bottom r)) (x-point (left-top r))))
  
(define (높이 r)
  (- (y-point (right-bottom r)) (y-point (left-top r))))

(define (둘레 r)
  (+ (* 2 (폭 r)) (* 2 (높이 r))))

(define (넓이 r)
  (* (폭 r) (높이 r)))
  
(define (print-rect r)
  (print-point (left-top r))
  (print-point (right-bottom r))
  (newline)
  (display "둘레 : ")
  (display (둘레 r))
  (newline)
  (display "넓이 : ")
  (DISPLAY (넓이 r))
  (newline))

(define a-rect (make-rect (make-point 10 4) (make-point 18 9)))
  
(print-rect a-rect)
  