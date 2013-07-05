#lang planet neil/sicp
(define tolerance 0.00001)

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (display v1)
    (newline)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
              next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter res i)
    (if (> i 1)
        (iter (compose f res) (- i 1))
        res))
  (iter f n))

(define (avg x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (avg x (f x))))

(define (average-damp2 f)
  (lambda (x) ((repeated (avg f) 2) x)))

(define (repeat_root n x k)
  (fixed-point ((repeated average-damp k) (lambda (y) (/ x (fast-expt y (- n 1)))))
               1.0))

(define (num_root n x)
  (define (find_k)
  (define (iter a result)
    (if (< a 2)
        result
        (iter (/ a 2) (+ result 1))))
  (iter n 0))
  (fixed-point ((repeated average-damp (find_k)) (lambda (y) (/ x (fast-expt y (- n 1)))))
               1.0))

(repeat_root 3 (fast-expt 2 3) 1)
;(repeat_root 4 (fast-expt 2 4) 1) ; loop

(repeat_root 4 (fast-expt 2 4) 2)
(repeat_root 5 (fast-expt 2 5) 2)
(repeat_root 6 (fast-expt 2 6) 2)
(repeat_root 7 (fast-expt 2 7) 2)
;(repeat_root 8 (fast-expt 2 8) 2) ; loop
;(repeat_root 16 (fast-expt 2 16) 3) ; loop
;(repeat_root 32 (fast-expt 32) 4) ; loop

; n < 2^k
; can't use log()
; find_k

(num_root 2 25)
(num_root 4 65536)
;(num_root 6 65536)