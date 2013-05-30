#!/usr/bin/racket
#lang planet neil/sicp
(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fast-expmod base exp m)
  (remainder (fast-expt base exp) m))

(expmod 3 7 100)
(fast-expmod 3 7 100)

