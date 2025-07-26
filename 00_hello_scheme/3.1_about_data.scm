;; 3.1.3 Defining and set

;; Make a variable `x' with initial numeric value 1.
(define x 1)

;; Make a variable `organization' with an initial string value.
(define organization "Free Software Foundation")

;; Change the value of `x' to 5.
(set! x 5)
x

;; Change the value of `organization' to the FSF's street number.
(set! organization 545)
organization

(set! x (+ x 1))
x
