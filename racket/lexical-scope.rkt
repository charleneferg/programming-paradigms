#lang racket
;https://www.youtube.com/watch?v=-zZAFiwK-YE&index=8&list=PLO9y7hOkmmSHSB3HZL00yAU6_1-MMcSzK
;a function body can use more than its arguements or local arguments it defines.
;it can use anything in its local environment or anything in scope
;which environment and which scope the answer is lexical scope

;Lexical scope is we use the environment where the function was defined and not where
;the function is called.

(define x = 1)
(define (f y)
  (+ x y)
  
  )

;function value has two parts, the code, the environment that was current when the function was defined
