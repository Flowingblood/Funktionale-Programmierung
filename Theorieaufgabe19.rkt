#lang typed/racket

(: bar (-> (U Integer Boolean String) Integer))
(define (bar x)
  (cond
    ((number? x) (string-length (number->string x)))
    ((boolean? x) (if x (string-length "true") (string-length "false")))
    (else (string-length x))))