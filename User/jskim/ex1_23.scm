(define (square n) (* n n))

(define (remainder_iter a b output)
      (cond ((> (+ output b) a) output)
      (else (remainder_iter a b (+ output b)))))

(define (remainder a b)
    (cond ((> b a) a)
    (else (- a (remainder_iter a b b)))))

(define (next n)
  (if (= n 2) 3
      (+ n 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time) true)
      (report-prime (- (runtime) start-time) false)))

(define (report-prime elapsed-time ret)
  (display " *** ")
  (display elapsed-time)
  (if ret (display " --- (0)") )
  ret)

(define (search-for-primes start n)
  (if (= n 0) (display "\ndone")
      (if (timed-prime-test start)
          (search-for-primes (+ start 1) (- n 1))
          (search-for-primes (+ start 1) n))))