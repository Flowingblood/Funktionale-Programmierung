#lang racket

(define (nth-stream n s)
  (stream->list (for/stream ([i n]) (stream-ref s i)))
)
