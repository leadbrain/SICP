(define (square-list items)
  (if (null? items)
      nil
      (cons (cube (car items)) (square-list (cdr items)))))
(define (cube x)
  (* x x))
(square-list (list 1 2 3 4 5))
(define (square-list2 items)
  (map cube items))
(square-list2 (list 1 2 3 4 5))
(define (for-each proc items)
  (cond ((not (null? items))
         (proc (car items))
         (for-each proc (cdr items)))))
(for-each (lambda (x) (newline) (display x))
          (list 1 2 3))
      
      