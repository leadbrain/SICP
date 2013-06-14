#lang planet neil/sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define square
 (lambda (x) (* x x)))

(define (find-divisor n test-divisor)
 (cond ((> (square test-divisor) n) n)
       ((divides? test-divisor n) test-divisor)
       (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n times)
  (= n (smallest-divisor n)))
 
(define (even? n)
  (= (remainder n 2) 0))
 
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                   m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                   m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n times)
  (newline)
  (display n)
  (start-prime-test n times (runtime)))
  
(define (start-prime-test n times start-time)
  (if (fast-prime? n times)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-prime from to)
  (if (even? from) (search-iter (+ from 1) to) (search-iter from to)))

(define (search-iter odd-from to)
  (cond ((> odd-from to) (display " finished"))
        (else (timed-prime-test odd-from 10000)
              (search-iter (+ odd-from 2) to))))
  
(search-for-prime 10000 10040)

(define (test-main times)
  (timed-prime-test 11 times)
  (timed-prime-test 101 times)
  (timed-prime-test 1039 times)
  (timed-prime-test 10039 times)
  (timed-prime-test 100019 times)
  (timed-prime-test 1000003 times)
  (timed-prime-test 10000019 times)
  (timed-prime-test 100000007 times))

(test-main 10000)
