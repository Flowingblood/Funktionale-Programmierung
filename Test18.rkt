#lang racket

(require rackunit)

(define (nth-stream n s)
  (stream->list (for/stream ([i n]) (stream-ref s i)))
)

(define s (stream 5 9 "10"))

(check-equal? (nth-stream 2 s) (list 5 9))