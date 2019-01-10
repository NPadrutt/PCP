;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Woche5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; a)
#|
(/
(+ 42 (- 25 (* 3 4)))
11)
|#

;b)
#|
(/
 (+ 24 32)
 (+ 7 (* 3 (- 17 15)))
 )
|#

;c)
#|
(/ 34428
   (- 38 (- 1103 197))
  )
|#

;3)
#|
(define-struct rectangle (laenge breite))

(define (get-diagonale rect)
        (sqrt(
              + (* (rectangle-laenge rect) (rectangle-laenge rect) )
                 (* (rectangle-breite rect) (rectangle-breite rect) )
              )
         )
        
 )

 (get-diagonale (make-rectangle 3 4))
|#

;4)
; a)

#|
(define (calc a b c)
  (-
   (- (+ [* 10 a] [* 20 b] (- [* 40 c]) ))
   (- (- [* 7 a] [* 14 c])
      (-
      (- [* 15 b] [* 4 c])
      (- [* 27 a] [* 5 b] )
      )
    )
  )
  )

(calc 1 2 3)
|#

;9)

(define-struct human (Alter Geschlecht Knochenlaenge))

(define (b-length body)
  (-
   (if (eq? (human-Geschlecht body) "f")
      (b-length-female (human-Knochenlaenge body))
      (b-length-male (human-Knochenlaenge body))
   )
   (calc-age-reduction (human-Alter body))
   )
  )

(define (b-length-male laenge)
  (+ 69.089 (* 2.238 laenge))
  )

(define (b-length-female laenge)
  (+ 61.412 (* 2.317 laenge))
  )

(define (calc-age-reduction age)
  ( if(>= age 30)
      (* 0.6 (- age 30))
      0
   )
 )

(b-length (make-human 14 "f" 10))
(b-length (make-human 35 "f" 10))

(b-length (make-human 14 "m" 10))
(b-length (make-human 35 "m" 10))