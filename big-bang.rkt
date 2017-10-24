;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname big-bang) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rsound)
(require 2htdp/batch-io)
(require racket/string)
(require 2htdp/universe)
(require 2htdp/image)
(define rad 10)
(define background (empty-scene 500 500))
(define (render rad x y)
  (place-image (circle rad "solid" "black") x y background))
(define (seconds ws)
  (+ 3 ws))
(define (main ws)
  (big-bang ws
            [on-tick seconds]
            [to-draw render]))