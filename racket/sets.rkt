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
(define singleList (set))

; set of integers 1 to 9
(define range2 (set 1 2 3 4 5 6 7 8 9))

; map check if element is zero replace with set range2

(define (remove-zero-set lst)
  (map (lambda (i)
         (if(zero? i)
            range2
            (set i))
         ) lst))

(define (transform lst)
  (map remove-zero-set lst)
  )


;
(define puzzle (transform matrix))

;get the first row of puzzle
(define puzzle-row1 (car puzzle))

;(= 1 (set-count (set 2)))

;(= 1 (set-count (set 1 2 3 4 5 6 7 8 9)))

(define (single? lst)
  (= 1 (set-count lst)))

;(map single? puzzle-row1)

;(map single? puzzle)

;(set-count (set 1 2 3 4 5 6 7 8 9)) ;9

;(set-count (set 2)) ;1

(define (add1 x)
  (+ 1 x)
  )


(define (return-element xs lst)
  (cond ((null? xs) xs)
        ((null? lst) xs)
        ((set-empty? xs) xs)
        ((set-empty? lst) xs)
        ((set-member? xs (set-first lst)) (return-element (set-remove xs (set-first lst)) (set-rest lst)) )
        (else (eval xs))
        ))

(trace return-element)

;(return-element (set 1 2 3 4 5 6 7 8 9) (set 2 5)) => (set 1 3 4 6 7 8 9)


;(return-single (set 1)) => 1

;applies proc to a set returns a list in unspecified order
;(set-map (set 1 2 3 4) add1)  ; =>'(5 4 3 2)

(define (remove lst x)
  (cond ((null? lst) '())
        ((equal? (car lst) x) (remove (cdr lst) x))
        (else (cons (car lst) (remove (cdr lst) x)))))

;(remove '(1 2 3 4 5 6 7 8 9) 2) ;=> '(1 3 4 5 6 7 8 9)

;(set-rest  (set 1 2 3 4 5 6 7 8 9)) ;=> (set 2 3 4 5 6 7 8 9)
;(set-first  (set 1 2 3 4 5 6 7 8 9)) ;=> 1
;(set-empty? (set ))


(define (getElement xs lst)
  
  (cond ((null? xs) '(()) )
        ((set-empty? xs) '(()) )
        (else set(set-add lst (set-first xs)))
        )
  )

(trace getElement)

(define (remove-set xs element)
  (cond ((null? xs) xs)
        ((set-empty? xs) xs)
        ((set-member? xs element) (set-remove xs element))
        (else (eval xs)
              ))
  )
;(remove-set (set 1 2 3 4 5 6 7 8 9) 1)

;(getSingle (set 1))
;(getSingle (set 1 2))  

(define (main-routine puzzle)
  (map
   (lambda (x)
     (let((row x))
       (map 
        (lambda (y)
            (if (single? y)
               (set! singleList (getElement y singleList))
               (return-element y singleList)
                ))x))) puzzle))

;(trace main-routine)
(main-routine puzzle)


