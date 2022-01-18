#lang racket

(define (natural_numbers)
  (define n 1)
  
  (define (run a)
    (stream-cons a (run (add1 a)))
  )

  (run n)
)