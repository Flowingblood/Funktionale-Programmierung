#lang racket/base

(require rackunit)

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

(define list-with-5-elements (list))

(rek-for 5 (lambda (i) (set! list-with-5-elements (append list-with-5-elements (list i)))))

(check-equal? list-with-5-elements (list 1 2 3 4 5))
