(define one (list 1 2 3 4))
(define two (list 5 6 7 8))
(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))
(define (reverse items)
  (define (reverse-iter result item)
    (if (null? item)
        result
        (reverse-iter (cons (car item) result) (cdr item))))
  (reverse-iter (list (car items)) (cdr items)))
(define (same-parity parity . items)
  (define (parity-func input)
    (if (even? input)
        (lambda (x) (even? x))
        (lambda (x) (not (even? x)))))
  (define (same-iter result item)
    (cond ((null? item)
           (cons parity result))
          (((parity-func parity) (car item))
           (same-iter (cons (car item) result) (cdr item)))
          (else
           (same-iter result (cdr item)))))
  (same-iter (list) (reverse items)))
(same-parity 1 2 3 4 5 6 7)

      
            