#!/usr/bin/racket
#lang planet neil/sicp

(define (square x) (* x x))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
       (accumulate combiner null-value term (next a) next b))))

(define (filtered-accumulate condition combiner null-value term a next b)
  (if (> a b)
    null-value
    (if (condition a)
      (combiner (term a)
         (filtered-accumulate condition combiner null-value term (next a) next b))
      (filtered-accumulate condition combiner null-value term (next a) next b))))

; 64 page
(define (divides? a b)
  (= (remainder b a) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (inc x) (+ x 1))

(define (sum-of-squared-primes a b)
  (filtered-accumulate prime? + 0 a inc b))

(sum-of-squared-primes 2 3)
(sum-of-squared-primes 2 5)
