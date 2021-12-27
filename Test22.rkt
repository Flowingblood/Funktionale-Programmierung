#lang typed/racket

(require rackunit)

(: sum-my-list (-> (Listof Number) Number))
(define (sum-my-list listOfNumbers)
  
  ;Initialize the sum with 0
  (: sum Number)
  (define sum 0)

  ;Iterates over the entire list
  (for ([i (length listOfNumbers)])
    ;Set the sum with the current sum to which the element of the list is summed to which the running variable points to.
    (set! sum (+ sum (list-ref listOfNumbers i))))
  
  ;Returns the sum of the list
  sum)

(: numbers-from-n-to-1 (-> Integer (Listof Number)))
(define (numbers-from-n-to-1 n)

  ;Create an empty list which will be returned in the end
  (: numbers (Listof Number))
  (define numbers (list))

  ;iterate from 0 to n
  (for ([i : Nonnegative-Integer n])
    ;Set i = i + 1 so that we start from 1 to fill the list and thus stay in the natural number space
    (set! i (+ i 1))

    ;Add the i-th element to the list, adds this at the first place
    (set! numbers (append (list i) numbers)))
    
  ;Returns the list of elements from n to 1
  numbers
)

(: my-reverse (-> (Listof Any) (Listof Any)))
(define (my-reverse inputList)
  
  ;Create an empty list in which the elements are stored in reverse order
  (define reversedList (list))

  ;Create a run variable which runs from the highest index to 0
  (define reverseIterator (length inputList))

  ;Iterates over the entire list
  (for ([i (length inputList)])
    ;Count down the run variable by one
    (set! reverseIterator (- reverseIterator 1))
    
    ;Add to the return list the element to which the run variable points to
    (set! reversedList (append reversedList (list (list-ref inputList reverseIterator)))))

  ;Returns the list containing the elements in reverse order
  reversedList)

(: my-find (-> (Listof Any) Any Boolean))
(define (my-find lst x)
  
  ;The boolean return value initialized with false
  (: returnValue Boolean)
  (define returnValue #f)
  
  ;Iterates over the entire list
  (for ([i (length lst)])
    
    ;Start check
    (cond
      ;Check if the element to which the run variable points is identical to x
      [(equal? x (list-ref lst i))
       ;Set the return variable to true, because the element was found in the list
       (set! returnValue #t)]))

  ;Returns the status whether the element was found or not 
  returnValue)

(: sum-of-the-two-highest-squares (-> Real Real Real Number))
(define (sum-of-the-two-highest-squares firstNumber secondNumber thirdNumber)

  ;Calculate the sums of squares of the input parameters
  (define firstSquare (* firstNumber firstNumber))
  (define secondSquare (* secondNumber secondNumber))
  (define thirdSquare (* thirdNumber thirdNumber))

  ;Save the totals in a list
  (: listOfSqaures (Listof Real))
  (define listOfSqaures(list firstSquare secondSquare thirdSquare))

  ;Set the list in order, highest number first
  (set! listOfSqaures (sort listOfSqaures >))

  ;Adds the two highest numbers from the list of sums and returns this one
  (+ (list-ref listOfSqaures 0) (list-ref listOfSqaures 1))
  
)

(displayln (sum-my-list(list 1 2 3 4)))
(displayln (numbers-from-n-to-1 10))
(displayln (my-reverse(list 1 2 3)))
(displayln (sum-of-the-two-highest-squares 2 4 6))