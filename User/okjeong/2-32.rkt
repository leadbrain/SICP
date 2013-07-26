#lang planet neil/sicp

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(display (subsets (list 1 2 3)))

;(subsets (1 2 3))
;(append (subsets (2 3)) (map (lambda (x) (cons (car s) x)) rest))
;(append (subsets (2 3)) (map (lambda (x) (cons 1 x)) (subsets (2 3))))
;(append (subsets (2 3)) (1 (subsets (2 3))))

;(subsets (2 3))
;(append (subsets (3)) (2 (subsets (3))))

;(subsets (3))
;(append (subsets ()) (3 (subsets ())))

;(subsets ())
;(())

(append (append (subsets (3)) (2 (subsets (3)))) (1 ((append (subsets (3)) (2 (subsets (3)))))))
(append (append ((append (subsets ()) (3 (subsets ())))) (2 ((append (subsets ()) (3 (subsets ())))))) (1 ((append ((append (subsets ()) (3 (subsets ())))) (2 ((append (subsets ()) (3 (subsets ())))))))))
(append (append ((append (()) (3 (())))) (2 ((append (()) (3 (())))))) (1 ((append ((append (()) (3 (())))) (2 ((append (()) (3 (())))))))))
