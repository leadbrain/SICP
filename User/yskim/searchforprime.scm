(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      false))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  true)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (squre test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a ) 0))

(define (prime? n)
  (= n (smallest-divisor n)))
 
(define (squre a)
  (* a a))

(define (search-for-prime from to count)
  (cond ((= count 0) 
         (display "\nend"))
        ((> from to)
         (display "\nend"))
        ((even? from)
         (search-for-prime (+ from 1) to count))
        ((timed-prime-test from)
         (search-for-prime (+ from 2) to (- count 1)))
        (else (search-for-prime (+ from 2) to count))))

 