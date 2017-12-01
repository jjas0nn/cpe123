;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lab5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rsound)
(require 2htdp/batch-io)
(require racket/string)
(require 2htdp/universe)
(require rsound/piano-tones)
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
(first((rest (rest mysounds))))
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
;or (cons rsound soundlist)
;use soundlist to represent list of rsounds
;returns total length of sounds in list as frames
;cons->integer
;(define (soundslen soundlist)
;  (cond
;    [(empty? soundlist)...]
;    [else
;     (... (first soundlist) ... (framelength (rest soundlist)))]))
(define (soundslen soundlist)
  (cond
    [(empty? soundlist) 0]
    [else
     (+ (rs-frames (first soundlist)) (soundslen (rest soundlist)))]))
(check-expect (soundslen mysounds) 5)

;140
;a boolist is one of
;'() or
;(cons boolean list-of-booleans)
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
                             [(empty? boolist) #f]
                             [(cons? boolist)
                              (if (eq? #t (first boolist)) #t (one-true (rest boolist)))]))
(check-expect (one-true '()) #t)


(define ps (make-pstream))

;a soundlist is one of '()
;or (cons rsound soundlist)
;soundlist->integer
;returns number of frames in rest of soundlist
;helper fn for revplay
;(define (remaining-frames soundlist)
;(cond
;  [(empty? soundlist) ...]
;  (else ... (rs-frames (first soundlist)) ... (remaining-frames (rest-soundlist))...]
(define (remaining-frames soundlist)
  (cond
    [(empty? soundlist) 0]
    [else (+ (rs-frames (first soundlist)) (remaining-frames (rest soundlist)))]
    ))
(remaining-frames mysounds)
;plays rsounds from list in reverse order
;soundlist->pstream
;(define (revplay soundlist)
;  (cond
;    [(empty? soundlist)...]
;    [else...(first soundlist)...(revplay (rest soundlist))]))
(define (revplay soundlist)
  (cond
    [(empty? soundlist)   (silence 1) ]
    [else (andqueue ps (first soundlist) (+ (pstream-current-frame ps) (remaining-frames soundlist)) (revplay (rest soundlist)))]))
(revplay mysounds)
;(revplay mysounds) should play clap, bassdrum,ding, finally snare

;a midilist is one of
;'()
;or (cons integer midilist)
;returns list of rsounds generated from midi numbers in midilist
;midilist --> soundlist
;(define (tones-list lot vol)
;  (cond
;    [(empty? lot)...]
;    [else...vol...(first lot)...(tones-list (rest lot))]))
(define list-of-midi (cons 63 (cons 54 (cons 68 (cons 73 '())))))
(define (tones-list midilist vol)
  (cond
    [(empty? midilist) '() ]
    [else  (cons (rs-scale vol (piano-tone (first midilist))) (tones-list (rest midilist) midilist))]))
(tones-list list-of-midi 0.5)  
;generates rsound from list of sounds
;soundlist->rsound
;define (play-sound-list soundlist)
;  (cond
;    [(empty? soundlist) ...]
;    [else ... (first soundlist)... (play-sound-list (rest soundlist))]))
(define (play-sound-list soundlist)
  (cond
    [(empty? soundlist) (silence 1)]
    [else (rs-append (first soundlist) (play-sound-list (rest soundlist)))]))
st02cq

