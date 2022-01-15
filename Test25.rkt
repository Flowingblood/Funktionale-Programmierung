#lang racket

(require rackunit)

(define-syntax (infix stx)
  (define args (cdr (syntax->datum stx)))
  (datum->syntax stx ((eval (list-ref args 1)) (list-ref args 0) (list-ref args 2)))
)

(check-equal? (infix 1 + 2) 3)
(check-equal? (infix 5 + 1) 6)