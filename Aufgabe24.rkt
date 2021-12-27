#lang typed/racket

;;Gegeben
(define-type Atom (U Number String Symbol Boolean))

;; Gegeben
(define atom? (make-predicate Atom))

;; Gegeben
(define-type (BinaryTree A) (U A (Pair (BinaryTree A) (BinaryTree A))))

;; Gegeben und verändert!
(: leaf-list (-> StringTree (Listof String)))
(define (leaf-list t)
  (cond
    ((atom? t) (list t))
    (else (append (leaf-list (car t)) (leaf-list (cdr t))))))


;; Ab hier selbst gemacht
(define-type StringTree (BinaryTree String))

(: count-words (-> StringTree Number))
(define (count-words tree)
  (define leafs (leaf-list tree))
  (define n 0)
  (for ([i (length leafs)])
    (set! n (+ n (length (string-split (list-ref leafs i))))))
  n)