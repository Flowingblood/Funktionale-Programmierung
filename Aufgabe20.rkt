#lang racket

(define (nth-stream n s)
  (stream->list (for/stream ([i n]) (stream-ref s i)))
)

(define (faks a)
  (stream-cons (fak a) (faks (add1 a)))

)

(define (fak n)
  (define f 1)
   (for ([i n])
    (set! f (* f (add1 i))))
  f
) 
