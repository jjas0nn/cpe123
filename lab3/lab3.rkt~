;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require rsound)
(require 2htdp/batch-io)
(require racket/string)
(require 2htdp/universe)
(define (sec second) (* 44100 second))
(define four (rs-overlay (make-tone 440 .5 120000) (make-tone 444 .5 120000)))
(define two (rs-overlay (make-tone 440 .5 120000) (make-tone 442 .5 120000)))
(define one (rs-overlay (make-tone 440 .5 120000) (make-tone 441 .5 120000)))
;rate of beating is directly proportional to difference between frequencies.  The bigger the difference the faster the rate.
(define c (make-tone 261.6 .5 (sec 1)))
(define d (make-tone 293.7 .5 (sec 1)))
(define epsilon (make-tone 329.7 .5 (sec 1)))
(define f (make-tone 349.2 .5 (sec 1)))
(define g (make-tone 392 .5 (sec 1)))
(define a (make-tone 440 .5 (sec 1)))
(define b (make-tone 493 .5 (sec 1)))
(define hc (make-tone 523.3 .5 (sec 1)))
(/ 293.7 261.6)
(/ 329.7 293.7)
(/ 349.2 329.7)
(/ 392.5 349.2)
(/ 440 392)
(/ 493 440)
(/ 523.3 493)
;there are 2 different intervals
;31
(define (letter fst lst signature-name)
  (string-append
    (opening fst)
    "\n\n"
    (body fst lst)
    "\n\n"
    (closing signature-name)))
 
(define (opening fst)
  (string-append "Dear " fst ","))
 
(define (body fst lst)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " lst " have won our lottery. So, " "\n"
   fst ", " "hurry and pick up your prize."))
 
(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

(define (write_letter in-fst in-lst in-signature out)
  (write-file out
              (letter (read-file in-fst)
                      (read-file in-lst)
                      (read-file in-signature))))

;34
(define (string-first str) (substring str 0 1))
;40
(define WIDTH-OF-WORLD 200)
(define HEIGHT-OF-WORLD 200)
(define BACKGROUND (rectangle
                    WIDTH-OF-WORLD
                    HEIGHT-OF-WORLD
                    "outline"
                    "black"))
(define Y-CAR (/ HEIGHT-OF-WORLD 2))

(define WHEEL-RADIUS 10)

(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle WHEEL-DISTANCE WHEEL-RADIUS
                         "solid" "transparent"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))

(define CAR-BODY (overlay/align "middle" "bottom"
                                (rectangle
                                 (* 6 WHEEL-RADIUS)
                                 (* 4 WHEEL-RADIUS)
                                 "solid" "blue")
                                (rectangle
                                 (* 12 WHEEL-RADIUS)
                                 (* 2 WHEEL-RADIUS)
                                 "solid" "blue")))

(define CAR (above CAR-BODY BOTH-WHEELS))

(define (render x)
  (place-image CAR x Y-CAR BACKGROUND))


(define (tock ws)
  (+ ws 3))


(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]))

(main 13)

(check-expect (render 50) (place-image CAR 50 Y-CAR BACKGROUND))
(check-expect (render 200) (place-image CAR 200 Y-CAR BACKGROUND))
(check-expect (render 50) (place-image CAR 900 Y-CAR BACKGROUND))
(check-expect (render 200) (place-image CAR -178 Y-CAR BACKGROUND))
;41
(define cat1 (bitmap "../images/cat1.png"))
(define cat2 (bitmap "../images/cat2.png"))

(define CAT-Y 250)

(define HEIGHT-OF-WORLD
  (* 3 (image-height cat1)))
(define WIDTH-OF-WORLD
  (* 10 (image-width cat1)))

(define BACKGROUND
  (rectangle
   WIDTH-OF-WORLD
   HEIGHT-OF-WORLD
   "outline"
   "black"))

(define (render ws)
  (place-image
   (cond [(odd? ws) cat1]
         [else cat2])
   (modulo (* 3 ws) WIDTH-OF-WORLD)
   CAT-Y
   BACKGROUND))

(define (tock x)
  (+ x 1))


(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]))

(main 13)

(check-expect (render 13) (place-image cat1 (* 3 13) CAT-Y BACKGROUND))