;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname final_rev) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require rsound)
(require 2htdp/batch-io)
(require racket/string)
(require 2htdp/universe)
(require rsound/piano-tones)

(define mylist (cons 3 (cons 5 (cons 0 (cons 45 '())))))
(define mystring (cons "jason" (cons "jen" (cons "warthogs" '()))))
(define to-add (cons 4 (cons 6 (cons 82 (cons 0 (cons 5 '()))))))
;midterm correction
;(define (fun-for-laptop l)
;  (laptop-weight l)...
;  (laptop-name l)...
;  (laptop-memory l)...)

"free time"
(define-struct class [name])
(make-class "math")
(define (fun-for-se se)
  (cond [(string=? se "free time")...]
        [(class-name se)...]
  ))

;A worldstate is a
;place-image rectangle cursor on background
;and a string

;a student is (make-student string string string)
;(define-struct student [name gender major])
(define-struct student [name gender major])
(define student-1 (make-student "jason" "male" "bmed"))
(student-name student-1)
(student-gender student-1)
(student-major student-1)
;(define (fun-for-student s)
;  ((student-name s)
;  (student-gender s)
;  (student-major s)))

;a numlist is one of
;'()
;or (cons number numlist)
;returns sum of double of list elements
;numlist->numlist
;(define (listadd numlist)
(define (listadd numlist)(cond [(empty? numlist) 0]
                               [else (+(* 2 (first numlist))(listadd (rest numlist)))]))
(check-expect  (listadd mylist) 106)
(listadd mylist)
;listadd using foldr
(define (onedouble num1 num2) (+ (* 2 num1) (* 2 num2)))
(foldr onedouble 0 mylist)
;a stringlist is one of
;'()
;or (cons string stringlist)
;appends text to string
;stringlist->stringlist
(define (list-appender stringlist)
  (cond [(empty? stringlist) '()]
        [(cons? stringlist)
          (cons (string-append (first stringlist) "jj")
             (list-appender (rest stringlist)))]))
(define to-append mystring)
(list-appender to-append)

;a fact is a natural number
;or 0
;computes factorial of number
;number->number
;(define (factorial fact))
(define (factorial fact)
  (cond [(= 0 fact) 1]
        [else (* fact (factorial(- fact 1)))]))
(check-expect (factorial 5) 120)
(factorial 10)
 
;adds 1 to each list element 
;numlist->numlist
;(define (addnum numlist))
(define (addnum numlist)
  (cond [(empty? numlist) '()]
        [else (cons (+ 1 (first numlist))(addnum (rest numlist)))]))
(check-expect (addnum (cons 6 (cons 3 (cons 45 (cons 20 (cons 9 '())))))) (list 7 4 46 21 10))
(addnum to-add)
;addnum using map
(define (addone numb) (+ 1 numb))
(map addone to-add)

;filter numbers less than 4
(define (lessthan? a) (cond [(< a 5) #t]
                              [else #f]))
(check-expect (filter lessthan? mylist) (list 3 0))
(filter lessthan? mylist)

;a str is a string
;checks for wow ending strings
;then filters list
(define (wowend? str) (
   equal? (substring str (- (string-length str) 3) (string-length str)) "wow"))
(wowend? "warthogs")
(filter wowend? mystring)

;pstream
(define jj (make-pstream))
(pstream? jj)
(pstream-queue jj ding 999999)
