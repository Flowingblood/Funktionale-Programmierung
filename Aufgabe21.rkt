#lang racket

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