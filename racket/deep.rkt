#lang racket
;https://www.youtube.com/watch?v=G_Ej_LBDEfc

;Cases we have to consider
;(count-atoms* '(abc)) ==> 3  when flat list
;(count-atoms* '(a (1 (2))c)) ==> 4 when car is not a list
;(count-atoms* '()==> 0 when empty list
              
              
(define count-atoms
  (lambda (lst)
    (cond
      ((null? lst) 0)
      ((not (list? (car lst))) (+ 1 (count-atoms (cdr lst))))
      (else (+ (count-atoms (car lst)) (count-atoms (cdr lst)))))))

(count-atoms '(a b c d))  ;4

(count-atoms '(a (b c d e f))) ;6

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

(replace '(a b z))
(replace '(a (b z)z z (1 2 (z))))

;deep reverse

(define deep-reverse
  (lambda (ls)
    (cond
      ((null? ls) '())
      ((not (list? (car ls))) (append (deep-reverse (cdr ls)) (list (car ls))))
      (else (append (deep-reverse (cdr ls)) (list (deep-reverse (car ls))))))))
  
(deep-reverse '(a b c))
(deep-reverse '(a(b c) d e))

;depth https://www.youtube.com/watch?v=0iQZorLggAQ

(define depth
  (lambda (ls)
    (cond
      ((not (list? ls)) 0)
      ((null? ls) 1)
      ((not (list? (car ls))) (depth (cdr ls)))
      (else 
       (max (+ 1 (depth (car ls))) (depth (cdr ls)))))))

(depth '((ab) c (d (e))))

