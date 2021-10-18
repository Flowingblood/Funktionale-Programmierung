;Schreiben Sie eine Funktion sum-my-list, die eine Liste mit Zahlen erhält und diese aufaddiert.

#lang racket

(define (sum-my-list listOfNumbers)
  
  ;Initialize the sum with 0
  (define sum 0)

  ;Iterates over the entire list
  (for ([i (length listOfNumbers)])
    ;Set the sum with the current sum to which the element of the list is summed to which the running variable points to.
    (set! sum (+ sum (list-ref listOfNumbers i))))
  
  ;Returns the sum of the list
  sum
  )


(sum-my-list '(2 5 3))
