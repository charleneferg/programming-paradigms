#lang racket
(require racket/set)
; define a variable sublist that contains a list
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



; replace 0 with integers 1 to 9

; list of integers 1 to 9
(define range '(1 2 3 4 5 6 7 8 9))

; set of integers 1 to 9
(define range2 (set 1 2 3 4 5 6 7 8 9))

; map check if element is zero replace with set range2

(define (remove-zero-set lst)
  (map (lambda (i)
        (if(zero? i)
         range2
         (set i))
         ) lst))

;; map check if element is zero replace with list range 

(define (remove-zero lst)
(map (lambda (i)
        (if(zero? i)
         range
         i)
         ) lst))

;select singles
(define (singles lst) 
  (filter-not list? lst))


;remove singles from list using remove*

(define (remove-singles lst1 lst2)
  (remove* lst1 lst2)
  )


(define (solve lst)
  (map remove-zero lst))

(define (transform lst)
  (map remove-zero-set lst)
  )

;(solve matrix)
  
