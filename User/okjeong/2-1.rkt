#lang planet neil/sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (sign n d)
  (if (< (* n d) 0)
      -1
      1))

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (cons (* (sign n d) (/ (abs n) g)) (/ (abs d) g))))

(print-rat (add-rat (make-rat -1 3) (make-rat -1 -3)))
(print-rat (add-rat (make-rat -1 3) (make-rat -2 3)))
(print-rat (mul-rat (make-rat -2 -3) (make-rat -1 2)))
