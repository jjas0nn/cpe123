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
(contains-flatt? (cons "Flatt" (cons "C" '())))