#lang racket

;;AMPEL
(require rebellion/type/enum)

(define-enum-type state(
    AUS
    GRÜN
    GELB
    ROT
    ROT_GELB))

(define (ampel [initState AUS])

  (define state initState)

  
  (define (getState)
    state
  )
  
  (define (setState s)
    (set! state s)
  )

  (define (toString)
    (~a "Current State: " state)
  )

  (define (dispatch m)
    (cond ((equal? m 'getState) getState)
          ((equal? m 'setState) setState)
          ((equal? m 'toString) toString)
          (else (error "Function not found!" m))))
  dispatch
)

;;AMPELSTEUERUNG
(define autoAmpel (ampel AUS))
(define fußgängerAmpel (ampel AUS))

(define currentState 0)

(define (printAmpeln)
  (displayln(~a "AutoAmpel " ((autoAmpel 'toString))))
  (displayln(~a "FußgängerAmpel " ((fußgängerAmpel 'toString))))
  
)

(define (changeState)
  (cond 
    [(= currentState 0) (begin
                          ((autoAmpel 'setState) GRÜN)
                          ((fußgängerAmpel 'setState) ROT)
                          (printAmpeln)
                          (set! currentState 1)
                          (sleep 1)

    )]
    [(= currentState 1) (begin
                          ((autoAmpel 'setState) GELB)
                          (printAmpeln)
                          (set! currentState 2)
                          (sleep 2)

    )]
    [(= currentState 2) (begin
                          ((autoAmpel 'setState) ROT)
                          (printAmpeln)
                          (set! currentState 3)
                          (sleep 3)

    )]
    [(= currentState 3) (begin
                          ((fußgängerAmpel 'setState) GRÜN)
                          (printAmpeln)
                          (set! currentState 4)
                          (sleep 4)

    )]
    [(= currentState 4) (begin
                          ((fußgängerAmpel 'setState) ROT)
                          (printAmpeln)
                          (set! currentState 5)
                          (sleep 3)

    )]
    [(= currentState 5) (begin
                          ((autoAmpel 'setState) ROT_GELB)
                          (printAmpeln)
                          (set! currentState 6)
                          (sleep 2)

    )]
    [(= currentState 6) (begin
                          ((autoAmpel 'setState) GRÜN)
                          (printAmpeln)
                          (set! currentState 7)
                          (sleep 1)

    )]
    [(= currentState 7) (begin
                          (set! currentState 1)
                          (sleep 10)

    )]
  )
)

(define (whileTrue proc)
  (proc)
  (whileTrue proc)
)

(whileTrue changeState)