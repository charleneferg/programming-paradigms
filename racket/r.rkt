#lang racket
(require racket/set)

(define x (cdar (list (cons 0 0) (cons 0 1))))
(define puzzle '([0 2 5] [1 0 4] [0 0 6]))

;#(map (lambda(s) (print s)) puzzle)

(define (getElement pos lst)
  (let ([x (car pos)]
        [y (cdr pos)])  
    (traverse y (traverse x lst))))


(define (traverse x lst)
  (cond [(= x 0) (car lst)] 
        [ else (traverse (- x 1) (cdr lst))]))

(define val (set 1 2 3 4 5 6 7 8 9))

(define (transform lst)
  (cond [(empty? lst) '()]
        [(list? (car lst)) (cons (transform (car lst)) (transform (cdr lst)))]
        [(= (car lst) 0) (cons val (transform (cdr lst)))]
        [else (cons (set (car lst))(transform (cdr lst)))]))

;(transform puzzle)
(set-remove (getElement (cons 1 1) (transform puzzle)) 5)
