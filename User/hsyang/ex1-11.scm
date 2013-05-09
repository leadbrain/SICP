(define (rec-func n)
      (rec-func-iter n))

(define (rec-func-iter n)
  (if (< n 3)
      n
      (+ (rec-func-iter (- n 1))
         (* 2 (rec-func-iter (- n 2)))
         (* 3 (rec-func-iter (- n 3))))))

(rec-func 3)