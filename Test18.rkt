#lang racket

(require rackunit)

(define (list-to-stream data)
  (define st (stream))
  (for ([i (length data)])
    (set! st (stream-append st (stream (list-ref data i)))))
  st)


(check-equal? (stream? (stream 1 2 3)) (stream? (list-to-stream (list 1 2 3))))