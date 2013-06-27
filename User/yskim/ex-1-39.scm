(define (cont-frac n d k)
  (define (frac-iter limit result)
         (if (= limit 0)
             result
             (frac-iter (- limit 1) (/ (n limit) (+ (d limit) result)))))
  (frac-iter k 0))

(define (tan-cf x k)
   (cont-frac (lambda (i) 
                (if (= i 1)
                    x
                    (* x x -1))) 
              (lambda (i) (+ (* (- i 1) 2) 1)) 
              k))

(tan 1)
(tan-cf 1.0 9)

(tan 10)
(tan-cf 10.0 100)

(tan 100)
(tan-cf 100.0 1000)