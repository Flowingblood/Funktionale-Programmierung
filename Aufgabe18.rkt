#lang racket

(define (list-to-stream data)
  (define st (stream))
  (for ([i (length data)])
    (set! st (stream-append st (stream (list-ref data i)))))
  st)