#!/usr/bin/racket
#lang planet neil/sicp

; 2.2
(define (make-point x y)
  (cons x y))

(define (x-point x) (car x))

(define (y-point x) (cdr x))

(define (make-segment s e)
  (cons s e))

(define (start-segment x) (car x))

(define (end-segment x) (cdr x))

(define (mean x1 x2) (/ (+ x1 x2) 2))

(define (midpoint-segment x)
  (make-point 
   (mean (x-point (start-segment x)) (x-point (end-segment x)))
   (mean (y-point (start-segment x)) (y-point (end-segment x)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point 
 (midpoint-segment
  (make-segment (make-point 0 0) (make-point 4 4))))

; 2.3
(define (area x)
  (* 
   (- (x-point (end-segment x)) (x-point (start-segment x)))
   (- (y-point (end-segment x)) (y-point (start-segment x)))))

(define (perimeter x)
  (+ 
   (* (- (x-point (end-segment x)) (x-point (start-segment x))) 2)
   (* (- (y-point (end-segment x)) (y-point (start-segment x))) 2)))

(define (print-scalar x)
  (newline)
  (display x))

(print-scalar (area
 (make-segment (make-point 0 0) (make-point 2 4))))

(print-scalar (perimeter
 (make-segment (make-point 0 0) (make-point 2 4))))
