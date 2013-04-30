(define (cube-root x)
  (recurse-cube 1.0 x))

(define (recurse-cube root x)
  (if (good-enough? root x)
      root
      (recurse-cube (improve root x) x)))

(define (good-enough? root x)
  (< (abs (- (cube root) x)) 0.001))

(define (improve root x)
  (/ (+ (/ x (squre root)) (* 2 root)) 3))

(define (cube x)
  (* x x x))

(define (squre x)
  (* x x))

(cube-root 64)
