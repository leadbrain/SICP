(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson-integral f a b n)
  (define h (/ (-b a) n))
  (define (yk k) (f (+ a (* h k))))
  (define (simpson-term k)
    (* (cond ((= k 0) 1)
       ((= k n) 1)
       ((odd? k) 4)
       (else 2))
    (yk k)))
  (* (/ h 3) (sum simpson-term 0 inc n)))

(integral cube 0 1 100)
(simpson-integral cube 0 1 100)

(integral cube 0 1 1000)
(simpson-integral cube 0 1 1000)
