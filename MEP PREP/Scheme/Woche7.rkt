;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Woche7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#|
; 1)
(define (sort-a-list op a-list)
  (local(
         ; Einfügen in sortierter Liste
         (define (insert op item a-list)
           (cond
             ((empty? a-list) (list item))
             ((op item (first a-list)) (cons item a-list))
             (else (cons (first a-list) (insert op item (rest a-list))))
             ))
         )
    (cond
      ((empty? a-list) empty)
      (else (insert op (first a-list)
                    (sort-a-list op (rest a-list))))
      )
  )
)

; 2)

(define (fib n)
  (cond 
    ((or (= n 0) (= n 1)) n)
    (else (+ (fib (- n 1)) 
             (fib (- n 2))))))

(define (fib-acc n)
  (local (
          (define (fib-calc i current previous)
             (if(= i n) current
                (fib-calc (+ 1 i ) (+ current previous) current))
             )          
          )
    (fib-calc 0 0 1)
    )  
  )

(fib-acc 35)
(fib 35)

; fib-acc um vielfaches schneller als fib


; 3)
(define a 42)
(let ((a 1)
      (b (+ a 1)))
  b)
; = 43
(let* ((a 1)
       (b (+ a 1)))
  b)
; = 2

; Im zweiten Fall wird die Auswertung sequentiell gemacht, dadurch ist a = 1.
; Im ersten Fall wird a aus der definiton genommen. Damit a = 42.

;4)
(define x 1)
(define y 5)

((lambda (x y)
   (+ (* 2 x) y))
 y x)
; = 11

((lambda (a b)
   (+ (* 2 x) y))
 y x)
; = 7

; Im ersten Fall wird für x und y die übergebenen Werte genommen da die Namen identisch sind.
; Das heisst x = y und y = x.
; im zweiten Fall sind die Namen unterschiedlich. Damit werden die oben definierten Werte verwendet.

; 5)
(define a-list (list (list 1 2 3) (list 1 2) (list 1 2 3 4)))

(map (lambda (input-list) (cons 0 input-list)) a-list)
|#

; 6)
(define rect-calc-list
  (list (lambda (a b) (* a b)) (lambda (a b) (* 2 (+ a b)))))

(define (calc-a-list l side-a side-b)
  (local
    (
     (define (calc-a-list-pure l side-a side-b)
       (if (empty? l)
           empty
           (cons 
             ((first l) side-a side-b)
             (calc-a-list-pure (rest l) side-a side-b))))

     (define (display-list l)
       (if (empty? l)
           (display "finished")
           (begin
             (display (first l))
             (newline)
             (display-list (rest l)))))
    )
    (display-list (calc-a-list-pure l side-a side-b))))

(calc-a-list rect-calc-list 2 3)
(calc-a-list rect-calc-list 5 5)

; 7)
; a) Weil sie nebeneffekte einführt.