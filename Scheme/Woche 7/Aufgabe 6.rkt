;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Aufgabe 6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define rect-calc-list
  (list (lambda (a b) (* a b)) (lambda (a b) (* 2 (+ a b))))
 )

(define (calc-a-list funcList param1 param2)
  (cond
    ((empty? funcList)
         (
          (write "Finished")
          (newline)
          )
         )
    (else
     (
      (write ((first funcList) param1 param2 ))
      (newline)
      (calc-a-list (rest funcList) param1 param2)
      )
     )
  )
)

;(calc-a-list (list) 2 3)
;(calc-a-list rect-calc-list 2 3)
(calc-a-list rect-calc-list 5 5)
