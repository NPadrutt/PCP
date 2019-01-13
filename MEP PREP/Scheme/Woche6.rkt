;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Woche6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; 1)
#|
(define couple (list
                (cons "Adam" (cons "Eva" empty))
                (cons "Paul" (cons "Paula" empty))))

(define spec-list (list 1 (list 2 3 (list 5 7) 9)))

(rest (first couple))
(first (rest couple))
(rest (rest couple))
(first (first (rest couple)))
(rest (first (rest couple)))
(first (rest (rest couple)))

|#

;2)
#|
(define (redouble a-list)
  (redouble-gen 2 a-list)
 )

(define (redouble-gen factor a-list)
(cond ((empty? a-list) empty)
(else
(cons (* factor (first a-list))
(redouble-gen factor (rest a-list))))
))



(redouble (list 3 2 1))
(redouble-gen 3 (list 3 2 1))
|#

; 4)
#|
(define (delete item a-list)
  (cond
    ((empty? a-list) empty)
    ((eq? item (first a-list)) (rest a-list))
    (else
     (cons (first a-list) (delete item (rest a-list)))
     )
  )
)


(delete 3 (list 1 2 3 4))  ; (list 1 2 4)
(delete 'c '(a b c d))     ; (list 'a 'b 'd)
(delete 'f '(a b c d))     ; (list 'a 'b 'c 'd)
(delete 'f empty)          ; '()
(delete 'f (list 1 2 3 4)) ; (list 1 2 3 4)
|#

; 5)
#|
(define (contains? item a-list)
  (cond
    ((empty? a-list) false)
    ((eqv? item (first a-list) ) true)
   (else
     (contains? item (rest a-list))
     )
   )
  )

(contains? 'c '(a b c d))
(contains? 'f '(a b c d))
|#
