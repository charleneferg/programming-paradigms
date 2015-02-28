#lang racket
(define (max-of-list xs)
  (cond [(null? xs) (error "max-of-list given empty list")]
        [(null? (cdr xs)) (car xs)]
        [#t (let ([tlans (max-of-list (cdr xs))])
                  
               (if (> tlans (car xs))
                   tlans
                   (car xs)))]))

(define (sum xs)
  (cond [(null? xs) 0]
        [(number? xs) (+ (car xs) (sum (cdr xs)))]
        [(list? xs) (+ (sum car xs)) (sum (cdr xs))]
        [#t (sum (cdr xs))]))