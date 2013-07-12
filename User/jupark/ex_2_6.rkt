#lang racket

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add l_value r_value)
  (lambda (f) (lambda (x) ( (l_value f) ((r_value f) x)))))