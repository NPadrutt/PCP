;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Aufgabe9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct human (Alter Geschlecht Oberschenkelknochenlänge))

(define (b-length h)
  (cond
    ((equal? (human-Geschlecht h) "m")
     (+ 69.089 (* 2.238 (human-Oberschenkelknochenlänge h))))
    ((equal? (human-Geschlecht h) "f")
     (+ 61.412 (* 2.317 (human-Oberschenkelknochenlänge h))))
    (else "Kein gültiges Geschlecht")
    ) 

  )

(b-length(make-human 17 "m" 10) )
(b-length(make-human 17 "f" 10) )