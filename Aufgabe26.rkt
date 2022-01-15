#lang racket

(define-syntax (infix stx)
  (define args (cdr (syntax->datum stx)))

  (define sum 0)
  
  (for ([i (- (round (/ (length args)2)) 1)])
                                  (set! sum ((eval (list-ref args 1)) (list-ref args 0) (list-ref args 2)))
                                  (set! args (cdddr args))
                                  (set! args (append (list sum) args))
    
   )
  
  (datum->syntax stx sum)
)