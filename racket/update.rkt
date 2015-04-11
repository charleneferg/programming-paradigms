#lang racket
(require racket/set)
(require racket/unit)
(require racket/trace)

(define x (list (list 1 2 3 4) 
                (list 5 6 7 8) 
                (list 9 10 11 12) 
                (list 13 14 15 16)
                (list 17 18 19 20)))


(define (replace lst x y)
  (cond
    [(empty? lst) lst]
    [(list? (first lst)) (cons (replace (first lst) x y) (replace (rest lst) x y))]
    [(equal? (first lst) x) (cons y (replace (rest lst) x y))]
    [else (cons (first lst) (replace (rest lst) x y))]))

(define (extract matrix row column number)
  (take (drop (car (take (drop matrix row)1))column)number))

(define (manipulate matrix row column number)
  (replace (replace (extract matrix row column number) 6 99) 7 101))

(define (trans matrix row column number)
  (let ([inner (take matrix row)]
        [remainder (drop matrix row)])
   (print "--") (print remainder)  (print "--")
    (cons (car inner) 
          (list 
           (flatten
            (list
             (take (first (take remainder 1))column)
             (manipulate matrix row column number)
             (drop (first (take remainder 1)) (+ column number)))  )            
           (car (drop matrix (- (length matrix) row)))
           
           )
          )
    )
  )

(trace trans)
(trans x 1 1 2)
(define rem '((5 6 7 8) (9 10 11 12) (13 14 15 16)))
(print "--")(take (first (take rem 1))1)(print "--")
(first (take rem 1))
(take rem 1)
(first (take rem 1))
(take (first (take rem 1))1)


  (cons (car inner) 
          (list 
           (flatten
            (list
             (take (first (take remainder 1))column)
             (manipulate matrix row column number)
             (drop (first (take remainder 1)) (+ column number)))  )            
           (car (drop matrix (- (length matrix) row)))
           
           )
          ))

(manipulate x 1 1 2)
(drop (first (take rem 1)) (+ 1 2))
(car (drop x (- (length x) 1)))
(drop '(1 2 3) 2)
(take '(1 2 3) 2)
(length x)
(- (length x) 1)
(drop x (- (length x) 1))