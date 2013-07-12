#!/usr/bin/racket
#lang planet neil/sicp

(define (print-scalar x)
  (newline)
  (display x))

; 2.7
(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
   (let ((p1 (* (lower-bound x) (lower-bound y)))
         (p2 (* (lower-bound x) (upper-bound y)))
         (p3 (* (upper-bound x) (lower-bound y)))
         (p4 (* (upper-bound x) (upper-bound y))))
     (make-interval (min p1 p2 p3 p4)
                    (max p1 p2 p3 p4))))

(define (div-interval x y)
   (mul-interval x
                 (make-interval (/ 1.0 (upper-bound y))
                                (/ 1.0 (lower-bound y)))))

; 2.8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))


; 2.12
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.0))))

; 2.13
(define (percent i)
  (/ 100.0 (/ (width i) (center i))))

; 2.14
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))


(par1 (make-center-percent 100 1) (make-center-percent 100 2))
(par2 (make-center-percent 100 1) (make-center-percent 100 2))

(define foo (make-center-percent 100 1))
(print-scalar foo)
(print-scalar (div-interval foo foo))

; 2.15