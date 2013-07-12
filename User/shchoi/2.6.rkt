#!/usr/bin/racket
#lang planet neil/sicp

; 2.4
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 1 2))

; 2.6
; Church numeral
; http://pub.mearie.org/%EC%B2%98%EC%B9%98%EB%B6%80%ED%98%B8%ED%99%94?redirect=1#%EC%B2%98%EC%B9%98_%EC%88%AB%EC%9E%90
(define zero (lambda (f) (lambda (x) x)))

(define one (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (inc n)
  (+ n 1))

((zero inc) 1)