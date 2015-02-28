#lang racket
(require racket/set)
(require racket/unit)
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

;; assign matrix with zeros removed and the lists of 9 added
(define matrix2 (solve matrix))

; result from remove-zero function : removes zero and replaces zero with list possible valus 1-9
(define r1 '((1 2 3 4 5 6 7 8 9) 2 5 (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) 1 (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9)))


;store the results of singles from row2
(define s1 (singles r1))
  
; remove singles from one row

(define (remove-all-singles-row lst2)
  (map (lambda (i)
         (if(list? i)
           (remove-singles s1 range)
           i) 
         )lst2))

  (remove-all-singles-row r1)
(define matrix-set '())
;store list of sets in variable
(set! matrix-set (transform matrix))

(define set1 (set 1 2 3 4 5 6 7 8 9))

 (set-member? set1 5)
(set-empty? set1)

(set-remove set1 2)
(set-count set1)

(set-first set1)
(set-rest set1)

(define count-singles
  (lambda (lst)
    (cond
      ((null? lst) 0)
      ((and (list? (car lst)) (= 1 (length (car lst)))) (+ 1 (count-singles (cdr lst))))
      (else (+ 0 (count-singles (cdr lst))))
      )))

;; get row
(define (getrow matrix x)
  (list-ref matrix x)
  )

;; get column
(define (getcolumn lst)
  (map first lst))

;(getcolumn matrix)


(define newmemo
  (letrec([memo null]
          [f (lambda (x)
            (let ([ans (assoc x memo)])  
              (if ans
                  (cdr ans)
                  (let ([new-ans (if (= x 0) 
                                     24
                                     99)])
                      (begin
                      (set! memo (cons (cons x new-ans) memo))
                      new-ans)))))])
    f))

(let ((x 1) (y 2))
  (+ y(* x 2)))

(let ((x '(1 2 3)))
  (remove 1 x))

;applies proc to a set returns a list in unspecified order
(set-map (set 1 2 3 4) add1)  ; =>'(5 4 3 2)

 (define (remove-list lst x)
   (cond ((null? lst) '())
         ((equal? (car lst) x) (remove-list (cdr lst) x))
         (else (cons (car lst) (remove-list (cdr lst) x)))))

(remove-list '(1 2 3 4 5 6 7 8 9) 2) ;=> '(1 3 4 5 6 7 8 9)

(remove-list r1 2)

(set-rest  (set 1 2 3 4 5 6 7 8 9)) ;=> (set 2 3 4 5 6 7 8 9)
(set-first  (set 1 2 3 4 5 6 7 8 9)) ;=> 1