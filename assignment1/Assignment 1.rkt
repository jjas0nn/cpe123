;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rsound)
(require racket/string)
(define nova (rs-scale 0.5 (rs-read/clip "C:/Users/JasonJen/OneDrive/school/cal_poly/q1/cpe/assignment1/nova.wav" 882000 1102500)))

(define nova6 (rs-append nova (rs-overlay (rs-overlay nova snare) snare) snare nova (rs-overlay (rs-overlay nova snare) snare) snare nova nova))

(define novashort (rs-read/clip "C:/Users/JasonJen/OneDrive/school/cal_poly/q1/cpe/assignment1/nova.wav" 1000000 1102500))

(define novarepeat (rs-append novashort novashort novashort novashort))

(define almostfull (rs-overlay (rs-overlay nova6 novarepeat) snare))

(define w (make-tone 500 3 50000))

(play almostfull)