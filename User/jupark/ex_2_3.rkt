#lang racket

(define tolerance 0.00001)
(define dx 0.00001)

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (제곱하기 x)
  (* x x))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x)
    ( - x (/ (g x) ((deriv g) x)))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (제곱하기 y) x))
                            newton-transform
                            1.0))

(define (점_만들기 x_좌표 y_좌표)
  (cons x_좌표 y_좌표))

(define (x_값 점)
  (car 점))

(define (y_값 점)
  (cdr 점))

(define (선분_만들기 시작점 끝점)
  (cons 시작점 끝점))

(define (선분_시작점 선분)
  (car 선분))

(define (선분_끝점 선분)
  (cdr 선분))

(define (두점의_덧셈 좌측점 우측점)
  (점_만들기 (+ (x_값 좌측점) (x_값 우측점)) (+ (y_값 좌측점) (y_값 우측점))))

(define (두점의_뺄셈 좌측점 우측점)
  (점_만들기 (- (x_값 좌측점) (x_값 우측점)) (- (y_값 좌측점) (y_값 우측점))))

(define (벡터로_변환하기 선분)
  (두점의_뺄셈 (선분_끝점 선분) (선분_시작점 선분)))

(define (벡터_길이_구하기 벡터)
  (sqrt (+ (제곱하기 (x_값 벡터)) (제곱하기 (y_값 벡터)))))

(define (선분의_쌍_만들기 처음_선분 두번째_선분)
  (cons 처음_선분 두번째_선분))

(define (선분의_쌍_첫번째값 선분의_쌍)
  (car 선분의_쌍))

(define (선분의_쌍_두번째값 선분의_쌍)
  (cdr 선분의_쌍))

(define (사각형_만들기 첫번째_점 두번째_점 세번째_점 네번째_점)
  (cons (선분의_쌍_만들기 (선분_만들기 첫번째_점 두번째_점) 
                   (선분_만들기 두번째_점 세번째_점))
        (선분의_쌍_만들기 (선분_만들기 세번째_점 네번째_점) 
                   (선분_만들기 네번째_점 첫번째_점))))

(define (첫번째_쌍_구하기 사각형)
  (car 사각형))

(define (두번째_쌍_구하기 사각형)
  (cdr 사각형))

(define (둘레_구하기 사각형)
  (let ((첫번째_선분 (선분의_쌍_첫번째값 (첫번째_쌍_구하기 사각형)))
        (두번째_선분 (선분의_쌍_두번째값 (첫번째_쌍_구하기 사각형)))
        (세번째_선분 (선분의_쌍_첫번째값 (두번째_쌍_구하기 사각형)))
        (네번째_선분 (선분의_쌍_두번째값 (두번째_쌍_구하기 사각형))))
    (+ (벡터_길이_구하기 (벡터로_변환하기 첫번째_선분)) 
       (벡터_길이_구하기 (벡터로_변환하기 두번째_선분))
       (벡터_길이_구하기 (벡터로_변환하기 세번째_선분))
       (벡터_길이_구하기 (벡터로_변환하기 네번째_선분)))))


(define (삼각형_넓이_구하기 선분의_쌍)
  (let ((첫번째_벡터 (벡터로_변환하기 (선분의_쌍_첫번째값 선분의_쌍)))
        (두번째_벡터 (벡터로_변환하기 (선분의_쌍_두번째값 선분의_쌍))))
    (/ (abs (- (* (x_값 첫번째_벡터) (y_값 두번째_벡터)) (* (y_값 첫번째_벡터) (x_값 두번째_벡터)))) 2.0)))
  


(define (넓이_구하기 사각형)
  (+ (삼각형_넓이_구하기 (첫번째_쌍_구하기 사각형))
     (삼각형_넓이_구하기 (두번째_쌍_구하기 사각형))))
  
(display (둘레_구하기 (사각형_만들기 (점_만들기 0 0) 
                          (점_만들기 0 1) 
                          (점_만들기 1 1) 
                          (점_만들기 1 0))))
(newline)

(display (넓이_구하기 (사각형_만들기 (점_만들기 0 0) 
                          (점_만들기 0 3) 
                          (점_만들기 3 3) 
                          (점_만들기 3 0))))
        



