#lang racket/base

(require rackunit)

(define (make-mp3)
  (define status 0) ;; 0 = stopped; 1 = paused; 2 = playing
  (define titles (list))
  (define current-title 0) ;; Index von der Title Liste
  (define next-title (void))

  (define (add-title data)
    (if (pair? data)
        (set! titles (append titles (list data)))
        (error "Die Daten sind nicht im richtigen Format. Erwarte Paar aus (Dateiname . Länge in Sekunden)")))

  (define (delete-title index)
    (if (and (< -1 index) (> (length titles) index))
        (set! titles (remove (list-ref titles index) titles))
        (error "Dieses Lied kann nicht entfernt werden, Index ausserhalb der Liste")))

  ;; Erwarte Status als Integer
  (define (change-status to-status)
    (if (and (< -1 to-status) (> 3 to-status))
        (set! status to-status)
        (error "Der Status Code ist nicht gültig!")))

  (define (play)
    (if (void? current-title)
        (set! current-title 0)
        (void))
    (change-status 2))

  (define (pause)
    (change-status 1))

  (define (stop)
    (change-status 0))

   (define (next)
     (if (= (length titles) (+ current-title 1))
         (void) ;; Ignore
         (set! current-title (+ current-title 1))))

   (define (prev)
     (if (= 0 current-title)
         (void) ;; Ignore
         (set! current-title (- current-title 1))))

  (define (display-status)
    (display "Status: ")
    (display (cond [(= status 0) "Stopped"]
                   [(= status 1) "Paused"]
                   [(= status 2) "Playing"]))
    (display "\n")
    (if (> (length titles) 0)
        (begin
          (display "Current Title: ")
          (display (car (list-ref titles current-title)))
          (display "\n")
          (display "Length: ")
          (display (cdr (list-ref titles current-title)))
          (display "s\n"))
        (display "No titles in list!")))

  
  (define (dispatch m)
    (cond ((equal? m 'add-title) add-title)
          ((equal? m 'remove-title) delete-title)
          ((equal? m 'play) play)
          ((equal? m 'pause) pause)
          ((equal? m 'stop) stop)
          ((equal? m 'next) next)
          ((equal? m 'prev) prev)
          ((equal? m 'status) display-status)
          ((equal? m 'change-status) change-status) ;; Wird nicht mehr benötigt, es gibt play, stop, pause
          ((equal? m 'get-titles) titles)
          (else (error "Unbekannte Funktion angefordert!" m))))
  dispatch)


(define mp3 (make-mp3))

((mp3 'add-title) '("BMTH" . 321))
((mp3 'add-title) '("GTHM" . 123))


((mp3 'status))

((mp3 'play))

((mp3 'status))

((mp3 'next))

((mp3 'status))