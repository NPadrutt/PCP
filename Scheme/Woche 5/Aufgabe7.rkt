;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Aufgabe7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (foo a b)
  (* (cond
       ((> a b) a)
       ((< a b) b)
       (else -1)
     )
     (+ a 1)
  )
)

(foo 3 6) ;; => 6 * 4
(foo 6 3) ;; => 6 * 7
(foo 3 3) ;; => -1 * (3 + 1)