(define (last-pair number-list)
  (if (null? (cdr number-list))
      (car number-list)
      (last-pair (cdr number-list))))

(define test-list (list 2 4 6 8))
(last-pair test-list)

      