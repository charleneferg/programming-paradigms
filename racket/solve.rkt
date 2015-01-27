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
(define box2 '(0 0 1 2 5 0 0 0 4))
(define box3 '(0 0 0 0 0 0 2 1 0))
(define box4 '(0 5 0 6 0 0 0 8 7))
(define box5 '(0 0 0 0 2 0 0 0 0))
(define box6 '(3 2 0 1 0 0 0 0 6))
(define box7 '(0 9 1 0 0 0 0 0 0))
(define box8 '(5 0 0 0 7 8 6 0 0))
(define box9 '(6 0 0 1 0 3 5 9 0))

(define matrix (list row1 row2 row3 row4 row5 row6 row7 row8 row9))
(define matrix2 (list row1 row2 row3 row4 row5 row6 row7 row8 row9))

(define range '(1 2 3 4 5 6 7 8 9))
(define (remove-zero lst)
(map (lambda (i)
        (if(zero? i)
         range
         i)
         ) lst))


(define (solve lst)
  (map remove-zero lst))


; result from remove-zero function : removes zero and replaces zero with list possible valus 1-9
(define r1 '((1 2 3 4 5 6 7 8 9) 2 5 (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) 1 (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9)))

;store the result of row2 after applying remove zero function
(define r2 (remove-zero row2))

;create a test list
(define l1 '(1 2 3 4 5 6 7 8 9))

;select singles
;from a list get all elements that are not a list return as a list
(define (singles lst) 
  (filter-not list? lst))

(define (singles3 lst) 
  (cond [(null? lst)  '() ]
        [(= (length (car lst)) 1) (car lst) ]
        )
  )

;select first element from a row

;(car r1)

;select second element from a row

;(cadr r1)

;select third element from a row

;(caddr r1)

;select fourth elment from a row
;(cadddr r1)

;store the results of singles from row2
(define s1 (singles r1))

;remove singles from list using remove*

(define (remove-singles lst1 lst2)
  (remove* s1 lst2)
  )


; remove singles from one row

(define (remove-all-singles-row lst2)
  (map (lambda (i)
         (if(list? i)
           (remove-singles s1 l1)
           i) 
         )lst2))

  (remove-all-singles-row r1)

;remove singles for different rows

 

;find columns same position in each row represents a column
;find position 2 for each row is column 2 


;find box1 which first 3 elements of first 3 rows
;box 2 elements 4-6 first 3 rows
;box 3 elements 7-9 first 3 rows etc
  
;; assign matrix with zeros removed and the lists of 9 added
(set! matrix (solve matrix))

;;find first element of list matrix which is row1
;(list-ref matrix 0)

;;find second element of list matrix which is row2
;(list-ref matrix 1)

;;find first element of row1 is also first element of col 1
;(list-ref (car matrix) 0)

;;find second element of row1
;(list-ref (car matrix) 1)

;; get row
(define (getrow matrix x)
  (list-ref matrix x)
  )

;; get column
(define (getcolumn lst)
  (map first lst))

;(getcolumn matrix)

matrix

 ;(cons (getcolumn matrix)(getrow matrix 0))

 (append (getcolumn matrix) (getrow matrix 0))


       

