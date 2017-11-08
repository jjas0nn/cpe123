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
(define delayed_sample (rs-read/clip "ib.wav" 10000 (sec 10)))
(define delayed_sample1 (rs-read/clip "ib.wav" 10 (sec 10)))
(define delayed_sample2 (rs-read/clip "ib.wav" 5 (sec 10)))
(define delayed_sample3 (rs-read/clip "ib.wav" 1 (sec 10)))
(define delay (rs-scale 0.25 (assemble (list
                                       (list delayed_sample 0)
                                       (list delayed_sample1 0)
                                       (list delayed_sample2 0)
                                       (list delayed_sample3 0)))))

;there are more echos.  the closer the starting frame reaches zero, the more normal the piece sounds.  a high starting frame leaves more echos
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
(define (revsnd frame-index)
(rs-ith/left ib (- 441000 frame-index)))

;(play (signal->rsound 441000 (indexed-signal revsnd ) ))

(define (noisefun i)
  (rs-ith/left ib i))
;(play (signal->rsound 44100 (indexed-signal noisefun ) ))



(define (stretchsnd pos)
(rs-ith/left ib (/ pos 2)))

;(play (signal->rsound 960000 (indexed-signal stretchsnd ) ))

(define DefHz (/ 48000 (* 2 pi)))

(define (sinesnd pos)
 (* 10000 (sin (* pos (/ 440 DefHz)) )) )

;(play (signal->rsound 48000 (indexed-signasl sinesnd ) ))

(define (multsnd pos)
  (*(sin (* pos (/ 20 DefHz) ) ) (noisefun pos)))

;(play (signal->rsound 480000 (indexed-signal multsnd ) ))

(define (sqrsnd pos)

(abs (* 10000 (sin (* pos (/ 250 DefHz)) )) )

 ; (cond
  ; [(positive? (sin (* pos (/ 250 DefHz)))) 10000]
  ; [else 5000]
  ; )
  )

(play (signal->rsound 48000 (indexed-signal sqrsnd ) ))
