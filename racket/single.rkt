#lang racket
(define lst '( (1 2) 3))

(define replace
  (lambda (ls)
    (cond
      ((null? ls) '())
      ((list? (car ls)) (cons (replace (car ls)) (replace (cdr ls))))
      (else (cons 
             (if (equal? (car ls) 'z)
                '!
                 (car ls))
             (replace (cdr ls)))))))

(define findLength
  (lambda (ls)
    (cond
      ((null? ls) '())
      ((list? (car ls)) (cons (findLength (car ls)) (findLength (cdr ls))))
      (else (cons 
             (if (= 1 (length (car ls)))
                
                 (car ls))
             (findLength (cdr ls)))))))

              
(define count-atoms
  (lambda (lst)
    (cond
      ((null? lst) 0)
      ((not (list? (car lst))) (+ 1 (count-atoms (cdr lst))))
      (else (+ (count-atoms (car lst)) (count-atoms (cdr lst)))))))