(define (same-parity a . z )
  (define (even-type? number)
    (
      if (= 0 (remainder number 2))
         0
         -1
    )
   )
   (let ((first-even? (even-type? a)))
     (define (append-list remain result) 
       (  
         if (null? remain)
            result
            (if (= first-even? (even-type? (car remain)))
              (append-list (cdr remain) (list result (car remain)))
              (append-list (cdr remain) result)
            )
             
       ) 
     )
     (append-list z (list a))
   )
)

(same-parity 2 3 4 5 6 7 8 9 10)
                     