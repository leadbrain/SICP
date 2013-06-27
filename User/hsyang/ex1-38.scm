;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex1-38) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define cont-frac n d k)
(define (loop result term)
  (if (= term 0)
      result
      (loop( / (n term)
               (+ (d term) result))
           (- term 1))))
(loop 0 k))

(define (e-euler k) 
   (+ 2.0 (cont-frac (lambda (i) 1) 
                     (lambda (i) 
                       (if (= (remainder i 3) 2) 
                           (/ (+ i 1) 1.5) 
                           1)) 
                     k)))

