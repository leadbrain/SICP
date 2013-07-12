#!/usr/bin/racket
#lang planet neil/sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< d 0)
        (cons (/ n g) (/ d g))
        (cons (* (/ n  g) -1) (* (/ d g) -1)))))
 
(define (numer x) (car x))

(define (denon x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denon x)))

(print-rat (make-rat -4 -10))