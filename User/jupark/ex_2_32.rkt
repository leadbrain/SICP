#lang racket
(define (map proc items)
  (if (null? items)
      items
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (append left_list right_list)
  (if (null? left_list)
      right_list
      (cons (car left_list) (append (cdr left_list) right_list))))

(define (subsets s)
  (if (null? s)
      (list s)
      (let ((rest (subsets (cdr s))))
        (append rest (map 
                      (lambda (x) (append (list (car s)) x))
                      rest)))))

(subsets (list 1 2 3))