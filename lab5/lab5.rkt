;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lab5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rsound)
(require 2htdp/batch-io)
(require racket/string)
(require 2htdp/universe)
;129
(cons "Merc" (cons "venus" (cons "earth" (cons "mars" (cons "saturn" (cons "uranus" (cons "neptune" '())))))))
(cons "redbull" (cons "ice cream" (cons "pizza" '())))
(cons "red" (cons "green" (cons "blue" '())))
;A list of sounds is one of
;(cons rsound '())
;or '()
;or (cons rsound (cons rsound ...
(cons kick '())
(cons kick (cons ding '()))
;
(define mysounds (cons snare (cons ding (cons bassdrum (cons clap-1 '())))))
(first mysounds)
(rest (rest mysounds))
;135
(define (contains-flatt? alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon)
     (or (string=? (first alon) "Flatt")
         (contains-flatt? (rest alon)))]))
(contains-flatt? (cons "Flatt" (cons "C" '())))
;creates list containing "Flatt" and "C"
;replace cons with list
;compares list against empty? condition
;compares against OR conditions then evaluates list as true

;use alos to represent list of rsounds
;alos is one of '()
;or (cons rsound
;returns number of elements in list
;cons->number
(define (how-many alos)
  (cond
    [(empty? alos) 0]
    [else (+ (how-many (rest alos)) 1)]))
(check-expect (how-many mysounds) 4)

;a soundlist is one of '()
;or (cons rsound...
;use soundlist to represent list of rsounds
;returns total length of sounds in list as frames
;cons->integer
;(define (framelength soundlist)
;  (cond
;    [(empty? soundlist)...]
;    [else
;     (... (first soundlist) ... (framelength (rest soundlist)))]))
(define (framelength soundlist)
  (cond
    [(empty? soundlist) 0]
    [else
     (+ (rs-frames (first soundlist)) (framelength (rest soundlist)))]))
(check-expect (framelength mysounds) 5)

;140
;a boolist is one of
;'() or
;(cons booleans)
;use (cons #boolean to represent list of boolean values
;list->boolean
;determines if all values of list are #true
;(define (alltrue boolist) (cond [(empty? boolist)...]
;                               [(cons? boolist) (...(first boolist)...(rest...boolist)...)]))

(define (alltrue boolist) (cond
                            [(empty? boolist) #t]
                            [else
                             (if (not (first boolist)) #f (alltrue (rest boolist)))]))

(define listbool (cons #true (cons #true '())))
(alltrue listbool)
(check-expect (alltrue (cons #t '())) #t)
(check-expect (alltrue (cons #t (cons #f '()))) #f)
(check-expect (alltrue '()) #t)
;consumes boolean list and determines whether 1
;item in list is true
;boolist->boolean
(define (one-true boolist) (cond
                             [(empty? boolist) #t]
                             [(cons? boolist)
                              (if (eq? #t (first boolist)) #t (one-true (rest boolist)))]))
(check-expect (one-true '()) #t)

