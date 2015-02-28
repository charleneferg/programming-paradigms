#lang racket
(require racket/set)
(require racket/unit)

;; define the rows of the Sudoku puzzle with each sublist representing a row of the puzzle

(define row1 '(0 2 5 0 0 1 0 0 0))
(define row2 '(1 0 4 2 5 0 0 0 0))
(define row3 '(0 0 6 0 0 4 2 1 0))
(define row4 '(0 5 0 0 0 0 3 2 0))
(define row5 '(6 0 0 0 2 0 0 0 9))
(define row6 '(0 8 7 0 0 0 0 6 0))
(define row7 '(0 9 1 5 0 0 6 0 0))
(define row8 '(0 0 0 0 7 8 1 0 3))
(define row9 '(0 0 0 6 0 0 5 9 0))


(define matrix (list row1 row2 row3 row4 row5 row6 row7 row8 row9))





;; @param Accepts a Sudoku puzzle containing a list of lists
;; @ returns a similar list with zeros replaces by the numbers 1...9


(define (solve lst)
  (map remove-zero lst))

;(solve matrix)

(define (transform lst)
  (map remove-zero-set lst)
  )