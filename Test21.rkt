#lang racket

(require rackunit)

(define-syntax cons-stream ;; "Makro" / Metaprogrammierung 
  (syntax-rules ()
    ((cons-stream x y)
     (cons x (delay y)))))

(define (tail s) (force (cdr s)))

(define (nth-stream n s)
  (stream->list (for/stream ([i n]) (stream-ref s i)))
)

(define (fib-stream [n 0])
  (cons-stream (list n (fib n)) (fib-stream (add1 n)))
)

(define (fib n)
  (if (= n 0)
      0
      (if (= n 1)
          1
          (+ (fib (- n 1)) (fib (- n 2))))))

(define a (tail (fib-stream)))
(define b (tail (tail (fib-stream))))
(define c (tail (tail (tail (fib-stream)))))
(define d (tail (tail (tail (tail (fib-stream))))))
(define e (tail (tail (tail (tail (tail (fib-stream)))))))

(check-equal? (car a) (list 1 1))
(check-equal? (car b) (list 2 1))
(check-equal? (car c) (list 3 2))
(check-equal? (car d) (list 4 3))
(check-equal? (car e) (list 5 5))


(display (~a "\n" a "\n" b "\n" c "\n" d "\n" e))