#lang racket
(define range '(1 2 3 4 5 6 7 8 9))

(define result '((0 2 5 0 0 1 0 0 0)
  (1 0 4 2 5 0 0 0 0)
  (0 0 6 0 0 4 2 1 0)
  (0 5 0 0 0 0 3 2 0)
  (6 0 0 0 2 0 0 0 9)
  (0 8 7 0 0 0 0 6 0)
  (0 9 1 5 0 0 6 0 0)
  (0 0 0 0 7 8 1 0 3)
  (0 0 0 6 0 0 5 9 0)))

(define result2 
  '(((1 2 3 4 5 6 7 8 9) (2) (5) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9))
  ((1) (1 2 3 4 5 6 7 8 9) (4) (2) (5) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9))
  ((1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (6) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (4) (2) (1) (1 2 3 4 5 6 7 8 9))
  ((1 2 3 4 5 6 7 8 9) (5) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (3) (2) (1 2 3 4 5 6 7 8 9))
  ((6) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (2) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (9))
  ((1 2 3 4 5 6 7 8 9) (8) (7) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (6) (1 2 3 4 5 6 7 8 9))
  ((1 2 3 4 5 6 7 8 9) (9) (1) (5) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (6) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9))
  ((1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (7) (8) (1) (1 2 3 4 5 6 7 8 9) (3))
  ((1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (6) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (5) (9) (1 2 3 4 5 6 7 8 9))))

(define r1 '((1 2 3 4 5 6 7 8 9) (2) (5) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9) (1 2 3 4 5 6 7 8 9)))

              
(define count-atoms
  (lambda (lst)
    (cond
      ((null? lst) 0)
      ((not (list? (car lst))) (+ 1 (count-atoms (cdr lst))))
      (else (+ (count-atoms (car lst)) (count-atoms (cdr lst)))))))

(define count-lists
  (lambda (lst)
    (cond
      ((null? lst) 0)
      ((list? (car lst))
              (+ 1 (count-lists (cdr lst))))
      ((not (list? (car lst))) (count-lists (cdr lst)))
      )))


(define count-singles
  (lambda (lst)
    (cond
      ((null? lst) 0)
      ((and (list? (car lst)) (= 1 (length (car lst)))) (+ 1 (count-singles (cdr lst))))
      (else (+ 0 (count-singles (cdr lst))))
      )))


;examples (count-singles '())
;(count-singles '((1)))
;(count-singles '((1) (12) (1)))
;(define lsts '((1 2)))


(define traffic-signal
  (lambda (x)
    (cond
      ((eq? x 'red) 'stop)
      ((eq? x 'green) 'go)
      ((eq? x 'yellow) 'caution)
      (else 'broken))))

(define remove-num
  (lambda (x lst)
    (remove x lst)))


 