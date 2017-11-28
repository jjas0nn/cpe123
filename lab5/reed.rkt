;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |lab 5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require rsound)
(require rsound/piano-tones)

(define planetList
 (cons "sun"
 (cons "mercury"
 (cons "venus"
 (cons "earth"
 (cons "mars"
 (cons "jupiter"
 (cons "saturn"
 (cons "uranus"
 (cons "neptune" '()))))))))))


(define mealList
 (cons "steak"
 (cons "french fries"
 (cons "beans"
 (cons "bread"
 (cons "water"
 (cons "brie"
 (cons "ice cream" '()))))))))

(define colorList
 (cons "red"
 (cons "orange"
 (cons "yellow"
 (cons "green"
 (cons "blue"
 (cons "purple" '())))))))


;a list-of-sounds is one of
;- '() or
;(cons rsound list-of-sounds)
;'()
;(cons ding (cons ding '()))


(define my-sounds
 (cons ding
 (cons ding
 (cons (rs-append ding ding)
 (cons ding '())))))

(define (thirdSound sl)
 (first (rest (rest sl))))

; List-of-names -> Boolean
; determines whether "Flatt" occurs on alon
(define (contains-flatt? alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon)
     (or (string=? (first alon) "Flatt")
         (contains-flatt? (rest alon)))]))


(contains-flatt? (cons "Flatt" (cons "C" '())))
;first racket replaces cons "C" with list "C"
;then it condenses (cons "Flatt" (cons "C" '())) to list "Flatt" "C"
;next it places these values into the contains-flatt? function
;it then evaluates the first conditional as false, and then moves on
;to the second conditional which evaluates as true
;then it moves to the string=? conditional which evaluates as true
;then the whole function returns true


;returns total length of sounds in a given list of sounds
;list of sounds --> number
;(define (soundsLen sl)
;  (cond
;    [(empty? sl) ]
;    [ else  (first sl) (soundsLen (rest sl) )]))

(define (soundsLen sl)
  (cond
    [(empty? sl) 0]
    [ else (+ (rs-frames (first sl)) (soundsLen (rest sl)))]))


(define (all-true bl)
  (cond
    [(empty? bl) #t]
    [else
      (cond
        [(not (first bl)) #f]
        [else (all-true (rest bl))])]))

(check-expect (all-true '()) #t)
(check-expect (all-true (cons #t (cons #f (cons #t '())))) #f)
(check-expect (all-true (cons #t (cons #t (cons #t '())))) #t)

(define ps (make-pstream))
;plays rsounds from list in reverse order
;list of sounds --> pstream
;(define (revplay los)
;  (cond
;    [(empty? los)    ]
;    [else        (first los)    (revplay (rest los))]))
(define (revplay los)
  (cond
    [(empty? los)   (silence 1) ]
    [else (andqueue ps (first los) (+ (pstream-current-frame ps) (remaining-frames los))    (revplay (rest los)))]))

(define (remaining-frames los)
  (cond
    [(empty? los) 0]
    [else (+ (rs-frames (first los)) (remaining-frames (rest los)))]
    ))

(define testlist
  (cons ding (cons snare (cons kick '()))))

;(revplay testlist) should play kick then snare then ding

;plays midi notes in a list of notes at a given volume
;list of tones --> list of sounds
;(define (tones-list lot vol)
;  (cond
;    [(empty? lot)   ]
;    [else  vol    (first lot)   (tones-list (rest lot))]))
(define (tones-list lot vol)
  (cond
    [(empty? lot)  '() ]
    [else  (cons (rs-scale vol (piano-tone (first lot)))   (tones-list (rest lot) vol))]))
  

(define (play-sound-list los)
  (cond
    [(empty? los) (silence 1)]
    [else (rs-append (first los) (play-sound-list (rest los)))]))



                                