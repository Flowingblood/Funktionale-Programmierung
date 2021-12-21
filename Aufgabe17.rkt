#lang racket

(define (rek-for i body)
  (define current-i 0)
  (define target-i i)
  (define (rek-for-iter)
    (if (= current-i target-i)
        (void)
        (begin
          (set! current-i (+ current-i 1))
          (body current-i)
          (rek-for-iter))))
  (rek-for-iter))
