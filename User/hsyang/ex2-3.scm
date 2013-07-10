(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start-point end-point)
  (cons start-point end-point))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (cons 
        (/ (+ (car (start-segment segment)) (car (end-segment segment))) 2)
        (/ (+ (cdr (start-segment segment)) (cdr (end-segment segment))) 2)
   )     
  )

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-rect left-top right-bottom)
  (cons left-top right-bottom))

(define (left-top-point rect) 
  (car rect))
(define (right-bottom-point rect) 
  (cdr rect))

(define (circumference-rect rect)
  (+
  (* 2(- 
       (y-point (right-bottom-point rect))
       (y-point (left-top-point rect))
       )
  )
  (* 2(- 
       (x-point (right-bottom-point rect))
       (x-point (left-top-point rect)) 
       )
  )
  )
)

(define (area-rect rect)
  (*
    (- 
       (y-point (right-bottom-point rect))
       (y-point (left-top-point rect))
    )
    (- 
       (x-point (right-bottom-point rect))
       (x-point (left-top-point rect)) 
    )
  )
)
   
(circumference-rect (make-rect  
            (make-point 1 1)
            (make-point 3 5)
           ))

(area-rect (make-rect  
            (make-point 1 1)
            (make-point 3 5)
           ))