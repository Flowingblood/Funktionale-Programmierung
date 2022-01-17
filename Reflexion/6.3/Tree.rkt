#lang racket

(define (node initValue [initLeft '()][initRight '()])

  (define value initValue)
  (define left initLeft)
  (define right initRight)
  
  
  (define (getLeft)
    left
  )
  (define (getRight)
    right
  )
  (define (getValue)
    value
  )

  (define (setLeft n)
    (set! left n)
  )
  (define (setRight n)
    (set! right n)
  )
  (define (setValue v)
    (set! value v)
  )

  (define (dispatch m)
    (cond ((equal? m 'getLeft) getLeft)
          ((equal? m 'getRight) getRight)
          ((equal? m 'getValue) getValue)
          ((equal? m 'setLeft) setLeft)
          ((equal? m 'setRight) setRight)
          ((equal? m 'setValue) setValue)
          (else (error "Function not found!" m))))
  dispatch
)
(define (printTree rootNode)
  (define (printTreeRec rootNode level)
  
  (if (list? rootNode) (void)
      (begin
        (printTreeRec ((rootNode 'getRight)) (+ level 1))
        (if (not(= level 0))
            ;IF
            (begin
              (for ([i (- level 1)])
                (display "|  ")
              )
              (displayln (~a "|--" ((rootNode 'getValue))))
            )
            ;ELSE
            (displayln ((rootNode 'getValue)))
         )
         (printTreeRec ((rootNode 'getLeft)) (+ level 1))
      )
    )
  )
  (printTreeRec rootNode 0)
)

(define n1 (node 1))
(define n2 (node 2))
(define n3 (node 3))
(define n4 (node 4))
(define n5 (node 5))
(define n6 (node 6))
(define n7 (node 7))
(define n8 (node 8))
(define n9 (node 9))
(define n10 (node 10))

((n1 'setLeft) n2)
((n1 'setRight) n3)
((n2 'setLeft) n4)
((n2 'setRight) n5)
((n3 'setRight) n6)
((n3 'setLeft) n7)
((n4 'setRight) n8)
((n4 'setLeft) n9)
((n5 'setRight) n10)


(printTree n1)


 
