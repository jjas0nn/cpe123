;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lab4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rsound)
(require 2htdp/batch-io)
(require racket/string)
(require 2htdp/universe)
(make-pstream)
(define (sec second) (* 44100 second))
(define ib (rs-read/clip "ib.wav" 0 (sec 10)))
(define 1add (rs-scale 0.5 (assemble (list (list ib 0)
                (list ib 10000)))))
(define 2add (rs-scale 0.5 (assemble (list (list 1add 0)
                             (list 1add 10)))))
(define 3add (rs-scale 0.5 (assemble (list (list 2add 0)
                             (list 2add 5)))))
(define 4add (rs-scale 0.5 (assemble (list (list 3add 0)
                             (list 3add 1)))))
;there are more echos
(rsound->signal/left ib)
(rs-ith/left ib 1)
(rs-ith/left ib 2)
(rs-ith/left ib 3)
(rs-ith/left ib 4)
(rs-ith/left ib 440999)
(rs-ith/left ib 440998)
(rs-ith/left ib 440997)
(rs-ith/left ib 440996)
;#i-0.4922330393383587
;#i-0.4699850459303568
;#i-0.4419995727408673
;#i-0.42756431775872067

;We will use integer to represent frame index.
;number->number
;computes sample for reversed sound from frame index.
; (define (revsnd clip frame-index) (rs-ith/left clip (- 441000 frame-index)))
;(define (revsnd ib 




(define (noisefun i)
  (rs-ith/left ib (/ (random 441000) 100)))
 
(define noisysound
  (signal->rsound
   (* 1 FRAME-RATE)
   (indexed-signal noisefun)))
