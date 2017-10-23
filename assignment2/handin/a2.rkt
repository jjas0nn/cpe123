;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require rsound)
(define octave 12)

(define higha# (+ 70 octave))
(define higha (+ 69 octave))
(define highg# (+ 68 octave))
(define highg (+ 67 octave))
(define highf# (+ 66 octave))
(define highf (+ 65 octave))
(define highe (+ 64 octave))
(define highd# (+ 63 octave))
(define highd (+ 62 octave))
(define highc# (+ 61 octave))
(define highc (+ 60 octave))
(define highb (+ 59 octave))
(define lowa# (+ 58 octave))
(define lowa (+ 57 octave))
(define lowg# (+ 56 octave))
(define lowg (+ 55 octave))
(define lowf# (+ 54 octave))
(define lowf (+ 53 octave))
(define lowe (+ 52 octave))
(define lowd# (+ 51 octave))
(define lowd (+ 50 octave))
(define lowc# (+ 49 octave))
(define lowc (+ 48 octave))
(define lowb (+ 47 octave))
(define lowesta# (+ 46 octave))
(define lowesta (+ 45 octave))
(define lowestg# (+ 44 octave))
(define lowestg (+ 43 octave))


(define tempo 184)
;bpm * minutes/s = beats/s
;beats / (beats/s) = seconds
;seconds * frames/s = frames
(define (beats bt)
(round(* 44100(/ bt (/ tempo 60)))))


  
  (define (play-note note-number beat)
(synth-note "main" 12 note-number (beats beat)))

;(define-struct note (pitch dur))

(define (16thgroup first second third fourth)
  (rs-append (play-note first 1/4)
             (play-note second 1/4)
             (play-note third 1/4)
             (play-note fourth 1/4)))
(define (8thgroup first second third fourth)
  (rs-append (play-note first 1/2)
             (play-note second 1/2)
             (play-note third 1/2)
             (play-note fourth 1/2)))
             
; PART 1: CHARSKIE


(define measure1
  (silence (beats 0.5)))

(define measure2
  (rs-append
   (play-note highb 1)
   (play-note lowg 1)
   (play-note highc 1.5)
   (play-note highb 0.5)))

(define measure3
  (rs-append
   (play-note lowa 1)
   (play-note highb 1)
   (play-note highb 1)
   (play-note lowa 0.5)
   (silence (beats 0.5))))

(define measure4
  (rs-append
   (play-note lowe 2)
   (play-note lowd 1.5)
   (play-note lowc# 0.5)))

(define measure5
  (rs-append
   (play-note lowd 2)
   (play-note lowd 0.5)
   (play-note lowf 0.5)
   (play-note lowb 0.5)
   (silence (beats 0.5))))

(define measure6
  (rs-append
   (silence (beats 4))))

(define measure7
  (rs-append
   (play-note lowa 1)
   (play-note highc 0.5)
   (play-note lowb 0.25)
   (play-note lowa 0.25)
   (play-note highf 1)
   (play-note highg 0.5)
   (silence (beats 0.5))))

(define measure8
  (rs-append
   (silence (beats 2))
   (play-note lowg 2)))

(define measure9
  (rs-append
   (play-note lowg 1)
   (play-note lowf 1)
   (play-note lowg 1)
   (silence (beats 1))))

(define measure10
  (rs-append
   (silence (beats 2))
   (play-note lowg 2)))
   
(define measure11
  (rs-append
   (play-note lowd 1)
   (play-note lowc 1)
   (play-note lowb 1)
   (silence (beats 0.5))
   (play-note lowestg 0.5)))

(define measure12
  (rs-append
   (play-note lowd 1)
   (play-note lowg 1)
   (play-note lowg 1)
   (play-note lowf 0.5)
   (play-note lowe 0.5)))

(define measure13
  (rs-append
   (play-note lowd 0.5)
   (play-note lowd# 0.5)
   (play-note lowe 0.5)
   (play-note lowb 0.5)
   (play-note lowd 1)
   (play-note lowc 0.5)
   (play-note lowb 0.5)))

(define measure14
  (rs-append
   (play-note lowestg 1)
   (silence (beats 1))
   (silence (beats 0.5))
   (play-note lowg# 0.5)
   (play-note lowa 0.5)
   (play-note lowe 0.5)))

(define measure15
  (rs-append
   (play-note lowg 1)
   (play-note lowf 0.5)
   (silence (beats 0.5))
   (silence (beats 0.5))
   (play-note lowf 0.5)
   (play-note lowg 0.5)
   (play-note lowd# 0.5)))

(define measure16
  (rs-append
   (play-note lowf 0.5)
   (play-note lowe 0.5)
   (silence (beats 0.5))
   (play-note highb 0.5)
   (play-note lowa 1.5)
   (play-note lowg# 0.5)))

(define part1
  (rs-append
   measure1
   measure2
   measure3
   measure4
   measure5
   measure6
   measure7
   measure8
   measure9
   measure10
   measure11
   measure12
   measure13
   measure14
   measure15
   measure16))

;Part 2 Catherine

(define measure17
  (rs-append
   (play-note lowa 1)
   (silence (beats 1))
   (play-note lowa 1)
   (silence (beats 1))))
  
(define measure18
  (rs-append
   (silence (beats 0.5))
   (play-note lowb 0.5)
   (play-note lowc 0.5)
   (play-note lowc# 0.5)
   (play-note lowd 0.5)
   (play-note lowd# 0.5)
   (play-note lowe 0.5)
   (play-note lowf 0.5)))
(define measure19
  (rs-append
   (play-note lowf# 0.5)
   (play-note highb 0.5)
   (play-note lowa 0.5)
   (play-note lowg 0.5)
   (play-note lowf# 0.5)
   (play-note highc 0.5)
   (play-note highb 0.5)
   (play-note lowa 0.5)))
(define measure20
  (rs-append
   (play-note lowg 1)
   (silence (beats 1.5))
   (play-note highb 0.5)
   (play-note lowa 0.5)
   (play-note lowg 0.5)))
(define measure21
  (rs-append
   (play-note lowa 0.5)
   (play-note highb 0.5)
   (play-note highc 0.5)
   (play-note highd 0.5)
   (play-note lowf# 1)
   (play-note lowe 0.5)   
   (play-note lowestg 0.5)))
(define measure22
  (rs-append
   (play-note lowg 2)
   (silence (beats 1.5))
   (play-note lowestg 0.5)))

(define measure23
  (rs-append
   (play-note lowg 2.5)
   (play-note lowe 1)
   (play-note lowf 0.5)))
(define measure24
  (rs-append
   (play-note lowg 0.5)
   (play-note lowe 1)
   (play-note lowf 0.5)
   (play-note lowg 2)))
(define measure25
  (rs-append
   (play-note lowg 1.25)
   (play-note lowf# 0.25)
   (play-note lowe 0.25)
   (play-note lowd 0.25)
   (play-note lowc# 1)
   (silence (beats 0.5))
   (play-note lowa 0.5)))
(define measure26
  (rs-append
  (play-note lowf# 1)
  (play-note lowf# 1)
  (play-note lowf# 0.25)
  (play-note lowf 0.25)
  (play-note lowf# 0.25)
  (play-note lowf 0.25)
  (play-note lowf# 0.5)
  (play-note lowf# 0.5)))
(define measure27
  (rs-append
  (play-note lowa 1.5)
  (play-note lowf# 0.5)
  (play-note lowa 1.5)
  (play-note lowf# 0.5)))
(define measure28
  (rs-append
  (play-note lowe 1)
  (play-note lowe 1)
  (play-note lowe 0.25)
  (play-note lowd# 0.25)
  (play-note lowe 0.25)
  (play-note lowd# 0.25)
  (play-note lowe 0.5)
  (play-note lowe 0.5)))
(define measure29
  (rs-append
  (play-note lowg 1.5)
  (play-note lowe 0.5)
  (play-note lowg 1.5)
  (play-note lowe 0.5)))
(define measure30
  (rs-append
  (play-note lowd 1)
  (play-note lowd# 1)
  (play-note lowe 1)
  (play-note lowf 1)))
(define measure31
  (rs-append
  (play-note lowf# 1)
  (play-note lowg 0.25)
  (play-note lowa 0.25)
  (play-note highb 0.25)
  (play-note lowg 0.25)
  (play-note lowf 1)
  (play-note lowe 0.5)
  (silence (beats 0.5))))
  
(define part2
  (rs-append
   measure17
   measure18
   measure19
   measure20
   measure21
   measure22
   measure23
   measure24
   measure25
   measure26
   measure27
   measure28
   measure29
   measure30
   measure31))

; PART 3: REED
 
(define part3
(rs-append
 (play-note lowa 1)
 (play-note lowa 1)
 (play-note lowa 2)
 
 (silence (beats 1/2))
 (play-note lowa 1/2)
 (play-note highd 1.5)
 (play-note lowa 1/2)
 (play-note highd 1)
 
 (play-note lowa 1)
 (play-note lowa 1)
 (play-note lowa 2)
 
 (silence (beats 1/2))
 (play-note lowesta 1/2)
 (play-note lowa 1.5)
 (play-note lowesta 1/2)
 (play-note lowa 1)
 
 (play-note lowa 1)
 (play-note highc 1)
 (play-note highb 1)
 (play-note highd 1)

 (play-note highd .75)
 (play-note highf# .25)
 (play-note highe .5)
 (play-note highd .25)
 (play-note highc# .25)
 (play-note highd 1)
 (silence (beats 1))

 (play-note lowd 1)
 (play-note lowd# 1)
 (play-note lowe 1)
 (play-note lowf 1)
  
 (play-note lowf# .75)
 (play-note lowa .25)
 (play-note lowg .5)
 (play-note lowf# .25)
 (play-note lowe .25)
 (play-note lowd .5)
 (silence (beats 1.5))

 (play-note lowa .5)
 (play-note lowa .5)
 (play-note lowa .5)
 (silence (beats .5))
 (play-note lowa .5)
 (play-note lowa .5)
 (play-note lowa .5)
 (silence (beats .5))

 
 (silence (beats .5))
 (play-note highb .5)
 (silence (beats .5))
 (play-note highb .5)
 (play-note lowe 1)
 (16thgroup highd highc# highb lowa)

 (16thgroup lowg# lowa lowg# lowa)
 (16thgroup lowg# lowa highb lowg)
 (16thgroup lowf lowf# lowf lowf#)
 (16thgroup lowf lowf# lowa lowf#)

 (16thgroup lowd# lowe lowg lowe)
 (16thgroup lowe lowd lowd lowc#)
 (play-note lowd 2)))

;part4 jj
(define measure44
  (play-note highd 4))
(define measure45
  (rs-append
   (play-note highd 0.75)
   (play-note highf# 0.25)
   (play-note highe 0.5)
   (play-note highd 0.25)
   (play-note highc# 0.25)
   (play-note highd 2)))
(define measure46
  (rs-append
   (play-note higha 2)
   (play-note highb 2)))
(define measure47
  (rs-append
   (play-note highf# 2)
   (play-note highg 2)))
(define measure48
  (rs-append
   (play-note lowg 0.25)
   (play-note lowa 0.25)
   (play-note highb 0.25)
   (play-note highc# 0.25)
   (play-note highd 0.25)
   (play-note highe 0.25)
   (play-note highf# 0.25)
   (play-note highg 0.25)
   (play-note highf# 0.5)
   (silence (beats .5))
   (play-note highg 0.5)
   (silence (beats .5))
   ))
(define measure49
  (rs-append
   (play-note highf# 0.5)
   (silence (beats .5))
   (play-note highe 0.5)
   (silence (beats .5))
   (play-note highd 0.5)
   (silence (beats .5))
   (play-note highb 0.5)
   (silence (beats .5))
   ))
(define measure50
  (rs-append
   (play-note lowa 0.5)
   (silence (beats .5))
   (play-note lowg 0.5)
   (silence (beats .5))
   (play-note lowf# 0.5)
   (silence (beats .5))
   (play-note lowf 0.5)
   (silence (beats .5))
   ))
(define measure51
  (rs-append
   (play-note lowf 1)
   (play-note lowf# 1.5)
   (play-note lowf# 0.5)
   (play-note lowg 0.5)
   (play-note lowg 0.5)
   ))
(define measure52
  (rs-append
   (play-note lowf# 0.5)
   (silence (beats 0.5))
   (play-note lowf 2)
   (play-note lowf# 1)
   ))
(define measure53
  (rs-append
   (play-note lowf# 0.5)
   (play-note lowf# 0.5)
   (play-note lowg 0.5)
   (play-note lowg 0.5)
   (play-note lowf# 0.5)
   (silence (beats 0.5))
   (play-note lowg 0.5)
   (play-note lowg 0.5)
   ))
(define measure54
  (rs-append
   (play-note lowf# 0.5)
   (silence (beats 0.5))
   (play-note highf# 0.25)
   (play-note highg 0.25)
   (play-note highf# 0.25)
   (play-note highe 0.25)
   (play-note highd 0.5)
   (silence (beats 1.5))
   ))
(define measure55
  (rs-append
   (play-note lowd 0.75)
   (play-note lowd 0.25)
   (play-note lowd 0.75)
   (play-note lowd 0.25)
   (play-note lowd 0.75)
   (play-note lowd 0.25)
   (play-note lowd 0.75)
   (play-note lowd 0.25)
   ))
(define measure56
  (rs-append
   (play-note lowd 0.5)
   (silence (beats 0.5))
   (play-note lowc# 0.75)
   (play-note lowb 0.125)
   (play-note lowc# 0.125)
   (play-note lowd 1)
   (silence (beats 0.5))
   ))
(define part4
  (rs-append
   measure44
   measure45
   measure46
   measure47
   measure48
   measure49
   measure50
   measure51
   measure52
   measure53
   measure54
   measure55
   measure56))
;play song
(define quartet
  (rs-append
   part1
   part2
   part3
   part4))






; ONE PARAGRAPH WRITE-UP
; The first thing we decided on was that we needed a standard way to make a note including the pitch and length of the note.
; We also developed a function tat converted seconds into beats in order to make it easier for us
; to define lengths of notes and to check our work. The way we checked our work was to make sure the beats
; added up to four in every measure. We would then develop a play-note function to play our notes all based
; around the sound made from the (synth-note "main" 12 note-number (beats beat))) sound using our note-numbers
; based on the notes we had defined earlier. This includes the addition of incrementing every note in the song by a certain interval,
; allowing us to raise or lower the octave of our part.
; We would then also use our seconds to beats function inside of this to show the length of our note. We would then append these notes to
; make the measures and eventually build all of those together to create the song. We also had some ideas to
; build on this program, such as interactive aspects you could add to this program. Such as adding key presses
; that could pause the song, play the song faster, slower, or at a different volume. Currently the program is split
; into five parts, part 1 being founding definitions to use in the next four parts, which were then the parts of the
; song we had split up and assigned each team member to write the code for. Each part was 2 staffs, with the exception
; of the last staff which had one extra measure. We hope you enjoy our coded version of Violin 2!

