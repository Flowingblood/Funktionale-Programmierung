#lang racket

(require rackunit)

(define (nth-stream n s)
  (stream->list (for/stream ([i n]) (stream-ref s i)))
)

(define s (stream 5 9 "test12345"))
(define l (list 5 9))

(check-equal? l (nth-stream 2 s))
