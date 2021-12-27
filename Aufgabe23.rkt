#lang typed/racket

(: my-reverse (All (T) (-> (Listof T) (Listof T))))
(define (my-reverse inputList)
  (: reversedList (Listof T))
  (define reversedList (list))
  (define reverseIterator (length inputList))
  (for ([i (length inputList)])
    (set! reverseIterator (- reverseIterator 1))
    (set! reversedList (append reversedList (list (list-ref inputList reverseIterator)))))
  reversedList)


(: own-foldr (All (T) (-> (-> T T T) T (Listof T) T)))
(define (own-foldr proc init lst)
  
  (set! lst (append (list init) (my-reverse lst)))
  
  (for ([i : Nonnegative-Fixnum (- (length lst) 1)])
  (begin
    (: x T)
    (define x (list-ref lst 0))
    (: y T)
    (define y (list-ref lst 1))
    (set! lst (cddr lst))
    (set! lst (append (list (proc y x)) lst))))
  (car lst))

(: own-map (All (T G) (-> (-> T G) (Listof T) (Listof G))))
(define (own-map proc lst)
  (: tmplst (Listof G))
  (define tmplst (list))
  (for ([i (length lst)])
    (begin
      (set! tmplst (append tmplst (list (proc (list-ref lst i)))))))
  tmplst)