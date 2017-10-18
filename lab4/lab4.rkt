;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rsound)
(require 2htdp/batch-io)
(require racket/string)
(require 2htdp/universe)
(define (sec second) (* 44100 second))
(rs-read/clip "C:/Users/Administrator/Documents/git/cpe123/lab4/ib.wav" 0 (sec 10))