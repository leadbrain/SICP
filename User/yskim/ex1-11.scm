(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(define (f n)
  (if (< n 3)
      n
      (iter-f 2 1 0 (- n 3))))

(define (iter-f n3 n2 n1 n)
  (if (= n 0)
      (+ n3 (* 2 n2) (* 3 n1))
      (iter-f (+ n3 (* 2 n2) (* 3 n1)) n3 n2 (- n 1))))
  
  

(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 6)
(f 7)
(f 8)
(f 9)