#lang racket

(require rackunit)

(define (nth-stream n s)
  (stream->list (for/stream ([i n]) (stream-ref s i)))
)

(define (faks [a 0])
  (stream-cons (fak a) (faks (add1 a)))

)

(define (fak n)
  (define f 1)
   (for ([i n])
    (set! f (* f (add1 i))))
  f
) 

(check-equal? (nth-stream 10 (faks)) (list 1 1 2 6 24 120 720 5040 40320 362880))