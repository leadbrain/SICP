#!/usr/bin/scheme-r5rs
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine count angle)
            (print count ": " angle)
            (if (not (> (abs angle) 0.1))
                angle
                (p (sine (+ count 1) (/ angle 3.0)))))

(sine 1 12.15)

