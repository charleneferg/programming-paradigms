#lang racket
;http://stackoverflow.com/questions/28304072/scheme-access-data-pairs-in-list

(define get-difference      
  (lambda (x y)
    (abs (- x y))))



(define total-error
  (lambda (list-of-pairs)
    (apply + (map (lambda (pair) ; each element in the list is a pair
                    (get-difference (list-ref pair 0)
                                    (list-ref pair 1)))
                  list-of-pairs))))


(define total-error2
  (lambda (list-of-pairs)
    (foldl (lambda (pair sum)
             (+ (get-difference (list-ref pair 0)
                                (list-ref pair 1))
                sum))
           0
           list-of-pairs)))