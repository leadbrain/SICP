(define (for-each proc num-list)
  (
     if (null? num-list)
        true
        (for-each proc (cdr (cons (proc (car num-list)) (cdr num-list))))
   )
)

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88 100 200))