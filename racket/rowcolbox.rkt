#lang racket
(define (thing matrix row column number)
(take (drop (car(take (drop matrix row)1))column)number))

(define mat'((1 2 3 x 5 6 7 8 9)
      (1 2 3 y 5 6 7 8 9)
      (1 2 3 z 5 6 7 8 9)
      (1 2 3 4 5 6 7 8 9)
      (1 2 3 4 5 6 7 8 9)
      (1 2 3 4 5 6 7 8 9)
      (1 2 3 a (set 1 5) 6 7 8 9)
      (1 2 3 b 5 6 7 8 9)
      (1 2 3 c 5 6 7 8 9)))
  
  (flatten ( list (thing mat 6 6 3)
                  (thing mat 7 6 3)
                  (thing mat 8 6 3)))
(thing mat 2 8 1)
     
       