#lang racket
(require racket/set)
(require racket/unit)
(require racket/trace)

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

(define puzzle2 (list'(0 2 5 0 0 1 0 0 0)
'(1 0 4 2 5 0 0 0 0)
'(0 0 6 0 0 4 2 1 0)
'(0 5 0 0 0 0 3 2 0)
'(6 0 0 0 2 0 0 0 9)
'(0 8 7 0 0 0 0 6 0)
'(0 9 1 5 0 0 6 0 0)
'(0 0 0 0 7 8 1 0 3)
'(0 0 0 6 0 0 5 9 0)))

(define puzzle3 (list'(0 0 0 3 9 0 7 0 0)
'(2 0 4 0 7 0 8 0 3)
'(0 0 3 5 0 0 4 0 6)
'(0 1 8 0 6 0 5 0 0)
'(0 2 7 4 0 0 3 8 0)
'(0 0 9 2 8 0 0 0 0)
'(3 0 0 0 0 0 0 5 0)
'(0 0 5 0 1 9 2 0 8)
'(0 9 2 7 0 5 6 0 0)))

(define small-puzzle (list '(0 2 5 0 0 1 0 0 0)'(1 0 4 2 5 0 0 0 0)))

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
(define (singles1 lst) 
  (filter-not list? lst))


;remove singles from list using remove*

(define (remove-singles1 lst1 lst2)
  (remove* lst1 lst2)
  )


(define (solve lst)
  (map remove-zero lst))

(define (transform lst)
  (begin
  (map remove-zero-set lst)
  )
  )

(define (transform2 lst)
  (begin
  (map remove-zero-set lst)
  )
  )


(solve matrix)



(define puzzle (transform matrix))

;; assign matrix with zeros removed and the lists of 9 added
(define matrix2 (solve matrix))

(transform matrix)

; result from remove-zero function : removes zero and replaces zero with list possible valus 1-9
(define r1 '((1 2 3 4 5 6 7 8 9) 2 5 (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) 1 (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9)))


;store the results of singles from row2
(define s1 (singles1 r1))
  
; remove singles from one row

(define (remove-all-singles-row lst2)
  (map (lambda (i)
         (if(list? i)
           (remove-singles1 s1 range)
           i) 
         )lst2))

(remove-all-singles-row r1)

(define matrix-set '())
;store list of sets in variable
(set! matrix-set (transform matrix))

(define set1 (set 1 2 3 4 5 6 7 8 9))








(define (get-row1 puzzle) 
  (let ( [row (flatten (take puzzle 1))])
         row))

(define (get-row2 puzzle) 
  (let ( [row (flatten (drop (take puzzle 2) 1))])
         row))

(define (get-row3 puzzle) 
  (let ( [row (flatten (drop (take puzzle 3) 2))])
         row))

(define (get-row4 puzzle) 
  (let ( [row (flatten (drop (take puzzle 4) 3))])
         row))

(define (get-row5 puzzle) 
  (let ( [row (flatten (drop (take puzzle 5) 4))])
         row))

(define (get-row6 puzzle) 
  (let ( [row (flatten (drop (take puzzle 6) 5))])
         row))

(define (get-row7 puzzle) 
  (let ( [row (flatten (drop (take puzzle 7) 6))])
         row))

(define (get-row8 puzzle) 
  (let ( [row (flatten (drop (take puzzle 8) 7))])
         row))

(define (get-row9 puzzle) 
  (let ( [row (flatten (drop (take puzzle 9) 8))])
         row))


(define (column1 puzzle)
(let([c1 (take (car (get-row1 puzzle)) 1)]
[c2 (take (car (get-row2 puzzle)) 1)]
[c3 (take (car (get-row3 puzzle)) 1)]
[c4 (take (car (get-row4 puzzle)) 1)]
[c5 (take (car (get-row5 puzzle)) 1)]
[c6 (take (car (get-row6 puzzle)) 1)]
[c7 (take (car (get-row7 puzzle)) 1)]
[c8 (take (car (get-row8 puzzle)) 1)]
[c9 (take (car (get-row9 puzzle)) 1)])
  (flatten (list c1 c2 c3 c4 c5 c6 c7 c8 c9))
  ))

(define (column2 puzzle)
(let([c1 (drop (take (car (get-row1 puzzle)) 2) 1)]
[c2 (drop (take (car (get-row2 puzzle)) 2) 1)]
[c3 (drop (take (car (get-row3 puzzle)) 2) 1)]
[c4 (drop (take (car (get-row4 puzzle)) 2) 1)]
[c5 (drop (take (car (get-row5 puzzle)) 2) 1)]
[c6 (drop (take (car (get-row6 puzzle)) 2) 1)]
[c7 (drop (take (car (get-row7 puzzle)) 2) 1)]
[c8 (drop (take (car (get-row8 puzzle)) 2) 1)]
[c9 (drop (take (car (get-row9 puzzle)) 2) 1)])
  (flatten (list c1 c2 c3 c4 c5 c6 c7 c8 c9))
  ))

(define (column3 puzzle)
(let([c1 (drop (take (car (get-row1 puzzle)) 3) 2)]
[c2 (drop (take (car (get-row2 puzzle)) 3) 2)]
[c3 (drop (take (car (get-row3 puzzle)) 3) 2)]
[c4 (drop (take (car (get-row4 puzzle)) 3) 2)]
[c5 (drop (take (car (get-row5 puzzle)) 3) 2)]
[c6 (drop (take (car (get-row6 puzzle)) 3) 2)]
[c7 (drop (take (car (get-row7 puzzle)) 3) 2)]
[c8 (drop (take (car (get-row8 puzzle)) 3) 2)]
[c9 (drop (take (car (get-row9 puzzle)) 3) 2)])
  (flatten (list c1 c2 c3 c4 c5 c6 c7 c8 c9))
  ))

(define (column4 puzzle)
(let([c1 (drop (take (car (get-row1 puzzle)) 4) 3)]
[c2 (drop (take (car (get-row2 puzzle)) 4) 3)]
[c3 (drop (take (car (get-row3 puzzle)) 4) 3)]
[c4 (drop (take (car (get-row4 puzzle)) 4) 3)]
[c5 (drop (take (car (get-row5 puzzle)) 4) 3)]
[c6 (drop (take (car (get-row6 puzzle)) 4) 3)]
[c7 (drop (take (car (get-row7 puzzle)) 4) 3)]
[c8 (drop (take (car (get-row8 puzzle)) 4) 3)]
[c9 (drop (take (car (get-row9 puzzle)) 4) 3)])
  (flatten (list c1 c2 c3 c4 c5 c6 c7 c8 c9))
  ))

(define (column5 puzzle)
(let([c1 (drop (take (car (get-row1 puzzle)) 5) 4)]
[c2 (drop (take (car (get-row2 puzzle)) 5) 4)]
[c3 (drop (take (car (get-row3 puzzle)) 5) 4)]
[c4 (drop (take (car (get-row4 puzzle)) 5) 4)]
[c5 (drop (take (car (get-row5 puzzle)) 5) 4)]
[c6 (drop (take (car (get-row6 puzzle)) 5) 4)]
[c7 (drop (take (car (get-row7 puzzle)) 5) 4)]
[c8 (drop (take (car (get-row8 puzzle)) 5) 4)]
[c9 (drop (take (car (get-row9 puzzle)) 5) 4)])
  (flatten (list c1 c2 c3 c4 c5 c6 c7 c8 c9))
  ))

(define (column6 puzzle)
(let([c1 (drop (take (car (get-row1 puzzle)) 6) 5)]
[c2 (drop (take (car (get-row2 puzzle)) 6) 5)]
[c3 (drop (take (car (get-row3 puzzle)) 6) 5)]
[c4 (drop (take (car (get-row4 puzzle)) 6) 5)]
[c5 (drop (take (car (get-row5 puzzle)) 6) 5)]
[c6 (drop (take (car (get-row6 puzzle)) 6) 5)]
[c7 (drop (take (car (get-row7 puzzle)) 6) 5)]
[c8 (drop (take (car (get-row8 puzzle)) 6) 5)]
[c9 (drop (take (car (get-row9 puzzle)) 6) 5)])
 (flatten (list c1 c2 c3 c4 c5 c6 c7 c8 c9))
  ))


(define (column7 puzzle)
(let([c1 (drop (take (car (get-row1 puzzle)) 7) 6)]
[c2 (drop (take (car (get-row2 puzzle)) 7) 6)]
[c3 (drop (take (car (get-row3 puzzle)) 7) 6)]
[c4 (drop (take (car (get-row4 puzzle)) 7) 6)]
[c5 (drop (take (car (get-row5 puzzle)) 7) 6)]
[c6 (drop (take (car (get-row6 puzzle)) 7) 6)]
[c7 (drop (take (car (get-row7 puzzle)) 7) 6)]
[c8 (drop (take (car (get-row8 puzzle)) 7) 6)]
[c9 (drop (take (car (get-row9 puzzle)) 7) 6)])
  (flatten (list c1 c2 c3 c4 c5 c6 c7 c8 c9))
  ))

(define (column8 puzzle)
(let([c1 (drop (take (car (get-row1 puzzle)) 8) 7)]
[c2 (drop (take (car (get-row2 puzzle)) 8) 7)]
[c3 (drop (take (car (get-row3 puzzle)) 8) 7)]
[c4 (drop (take (car (get-row4 puzzle)) 8) 7)]
[c5 (drop (take (car (get-row5 puzzle)) 8) 7)]
[c6 (drop (take (car (get-row6 puzzle)) 8) 7)]
[c7 (drop (take (car (get-row7 puzzle)) 8) 7)]
[c8 (drop (take (car (get-row8 puzzle)) 8) 7)]
[c9 (drop (take (car (get-row9 puzzle)) 8) 7)])
  (flatten (list c1 c2 c3 c4 c5 c6 c7 c8 c9))
  ))

(define (column9 puzzle)
(let([c1 (drop (take (car (get-row1 puzzle)) 9) 8)]
[c2 (drop (take (car (get-row2 puzzle))9) 8)]
[c3 (drop (take (car (get-row3 puzzle)) 9) 8)]
[c4 (drop (take (car (get-row4 puzzle))9) 8)]
[c5 (drop (take (car (get-row5 puzzle)) 9) 8)]
[c6 (drop (take (car (get-row6 puzzle)) 9) 8)]
[c7 (drop (take (car (get-row7 puzzle)) 9) 8)]
[c8 (drop (take (car (get-row8 puzzle)) 9) 8)]
[c9 (drop (take (car (get-row9 puzzle)) 9) 8)])
  (flatten (list c1 c2 c3 c4 c5 c6 c7 c8 c9))
  ))

(define (box1 puzzle)
(let([c1 (take (car (get-row1 puzzle)) 3)]
[c2 (take (car (get-row2 puzzle))3)]
[c3 (take (car (get-row3 puzzle))3)]
)
  (flatten (list c1 c2 c3))
  ))

(define (box2 puzzle)
(let([c1 (drop (take (car (get-row1 puzzle)) 6) 3)]
[c2 (drop (take (car (get-row2 puzzle))6) 3)]
[c3 (drop (take (car (get-row3 puzzle))6) 3)]
)
  (flatten (list c1 c2 c3))
  ))

(define (box3 puzzle)
(let([c1 (drop (take (car (get-row1 puzzle)) 9) 6)]
[c2 (drop (take (car (get-row2 puzzle))9) 6)]
[c3 (drop (take (car (get-row3 puzzle))9) 6)]
)
  (flatten (list c1 c2 c3))
  ))

(define (box4 puzzle)
(let(
[c4 (take (car (get-row4 puzzle))3)]
[c5 (take (car (get-row5 puzzle))3)]
[c6 (take (car (get-row6 puzzle))3)]
)
  (flatten (list c4 c5 c6))
  ))

(define (box5 puzzle)
(let([c1 (drop (take (car (get-row4 puzzle)) 6) 3)]
[c2 (drop (take (car (get-row5 puzzle))6) 3)]
[c3 (drop (take (car (get-row6 puzzle))6) 3)]
)
  (flatten (list c1 c2 c3))
  ))

(define (box6 puzzle)
(let([c1 (drop (take (car (get-row4 puzzle)) 9) 6)]
[c2 (drop (take (car (get-row5 puzzle))9) 6)]
[c3 (drop (take (car (get-row6 puzzle))9) 6)]
)
  (flatten (list c1 c2 c3))
  ))


(define (box7 puzzle)
(let(
[c7 (take (car (get-row7 puzzle))3)]
[c8 (take (car (get-row8 puzzle))3)]
[c9 (take (car (get-row9 puzzle))3)])
  (flatten (list c7 c8 c9))
  ))

(define (box8 puzzle)
(let([c1 (drop (take (car (get-row7 puzzle)) 6) 3)]
[c2 (drop (take (car (get-row8 puzzle))6) 3)]
[c3 (drop (take (car (get-row9 puzzle))6) 3)]
)
  (flatten (list c1 c2 c3))
  ))

(define (box9 puzzle)
(let([c1 (drop (take (car (get-row7 puzzle)) 9) 6)]
[c2 (drop (take (car (get-row8 puzzle))9) 6)]
[c3 (drop (take (car (get-row9 puzzle))9) 6)]
)
  (flatten (list c1 c2 c3))
  ))

 
(define x (flatten (get-row1 puzzle)))

(define map-single (map (lambda (x) (= 1 (set-count x)))
                 x))

(define (map-single? xs) (map (lambda (xs) (= 1 (set-count xs)))
                 xs))


;Gets the single elements from a list
(define (t xs ys)
  (cond [(null? xs) xs]
        [(= 1 (set-count (car xs))) (cons (car xs) (t (cdr xs) ys))]
        [else (t (cdr xs) ys)]))


; Stackoverflow get the index of a list

;Gets the position of an element in a list.
(define (get-index xs y)
  (let loop (( xs xs)
             (index 0))
  (cond[(null? xs) #f]
       [(equal? (car xs) y) index]
       (else (loop (cdr xs) (+ 1 index))))))

;(get-index n (set 2)) 


;get one single from a list
(define (z xs ys)
  (cond [(null? xs) xs]
        [(= 1 (set-count (car xs))) (car xs) ]
        [else (t (cdr xs) ys)]))


(define values (t (get-row1 puzzle) (set)))

;Store the result of first row in a variable
(define n (get-row1 puzzle))


(define (remove-element xs y)
  (cond [(null? xs) xs]
        [(= 1 (set-count (car xs))) (cons (car xs) (remove-element (cdr xs) y))]
        [(= 1 (set-count y)) (cons (set-subtract (car xs) y) (remove-element (cdr xs) y))]
        [(set-member? (car xs)  y) (cons (set-subtract (car xs) y) (remove-element (cdr xs) y))]
        [else (remove-element (cdr xs) y)]))
 

;(trace remove-element)
;(remove-element n (set 2))
