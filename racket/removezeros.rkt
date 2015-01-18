#lang racket

(define row1 '(0 2 5 0 0 1 0 0 0))
(define row2 '(1 0 4 2 5 0 0 0 0))
(define row3 '(0 0 6 0 0 4 2 1 0))
(define row4 '(0 5 0 0 0 0 3 2 0))
(define row5 '(6 0 0 0 2 0 0 0 9))
(define row6 '(0 8 7 0 0 0 0 6 0))
(define row7 '(0 9 1 5 0 0 6 0 0))
(define row8 '(0 0 0 0 7 8 1 0 3))
(define row9 '(0 0 0 6 0 0 5 9 0))

(define col1 '(0 1 0 0 6 0 0 0 0))
(define col2 '(2 0 0 5 0 8 9 0 0))
(define col3 '(5 4 6 0 0 7 1 0 0))
(define col4 '(0 2 0 0 0 0 5 0 6))
(define col5 '(0 5 0 0 2 0 0 7 0))
(define col6 '(1 0 4 0 0 0 0 8 0))
(define col7 '(0 0 2 3 0 0 6 1 5))
(define col8 '(2 0 0 5 0 8 9 0 0))
(define col9 '(0 0 0 0 9 0 0 3 0))

(define box1 '(0 2 5 1 0 4 0 0 6))

(define matrix (list row1 row2 row3 row4 row5 row6 row7 row8 row9))

(define range '(1 2 3 4 5 6 7 8 9))
(define count 1)
(define (remove-zero lst)
(map (lambda (i)
        (if(zero? i)
         range
         i)
         ) lst))


(define (all-list lst)
  (map remove-zero lst))


; result from remove-zero function : removes zero and replaces zero with list possible valus 1-9
(define r1 '((1 2 3 4 5 6 7 8 9) 2 5 (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) 1 (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9)))

;store the result of row2 after applying remove zero function
(define r2 (remove-zero row2))

;select singles
(define (singles lst) 
  (filter-not list? lst))

;store the result of singles from row2
(define s2 (singles r2))

;create a test list
(define l1 '(1 2 3 4 5 6 7 8 9))

;remove singles from list using remove*

(define (remove-singles lst1 lst2)
  (remove* lst1 lst2)
  )

;(remove* s2 l1)
  
     


;removes every element of list from second list
;(remove* (list 1 2) (list 1 2 3 2 4 5 2))
;'(3 4 5)


;check whether the elements in a list are a list
;(map list? r1)




;filter-map - example
;(filter-map (lambda (x) (and (positive? x) x)) '(1 2 3 -2 8))
;'(1 2 3 8)

;count 
;(count positive? '(1 -1 2 3 -2 5))
;4

;select the elements in a list that are not even
;(filter-not even? '(1 2 3 4 5 6))
;'(1 3 5)

