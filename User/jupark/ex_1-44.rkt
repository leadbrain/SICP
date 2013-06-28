#lang racket
(define pi 3.141592)

(define dx (/ pi 2))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (minus_dx x)
  (- x dx))

(define (plus_dx x)
  (+ x dx))

(define (average f g h)
  (lambda (x) (/ (+ (f x) (g x) (h x)) 3)))

(define (smooth f)
  (lambda (x) ( (average (compose f minus_dx) f (compose f plus_dx)) x)))

(define (nth_smooth f n)
  (lambda (x) (((repeated smooth n) f) x)))


((nth_smooth sin 4) 0)

((nth_smooth sin 4) (/ pi 4))

((nth_smooth sin 4) (/ pi 2))

((nth_smooth sin 4) (/ (* 3 pi) 4))

((nth_smooth sin 4) pi)
  
