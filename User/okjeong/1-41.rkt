#lang planet neil/sicp

(define (double 함수)
  (lambda (인자) (함수 (함수 인자))))

(define (inc x)
  (+ x 1))

(((double (double double)) inc) 5)
