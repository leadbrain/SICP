(define (make-mobile left right) 
   (list left right))

(define (make-branch length structure) 
   (list length structure))

;a
(define (left-branch mobile) 
   (car mobile))
 
(define (right-branch mobile) 
   (car (cdr mobile)))

(define (branch-length branch) 
   (car branch))

(define (branch-structure branch) 
   (car (cdr branch)))

;b
(define (branch-weight branch)
  (
     if (pair? (branch-structure branch))
       (total-weight (branch-structure branch))
       (branch-structure branch)
   )
)

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))
  )
)

(define test-mobile
  (make-mobile (make-branch 2 4)
               (make-branch 3
                            (make-mobile (make-branch 2 1)
                                         (make-branch 4 2)))))

(total-weight test-mobile)