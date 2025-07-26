;; 3.3 Expressions and Evaluation

(string-append "/home" "/" "andrew")

;; 3.3.1.2 Evaluating a Variable Reference

(define key "Paul Evans")

(set! key 3.74)

;; 3.3.1.3 Evaluating a Procedure Invocation Expressions

(string-length (string-append "/home" "/" "andrew"))

;; 3.3.2 Tail calls

(define (foo n)
  (display n)
  (newline)
  (foo (1+ n)))

;; infinite
;; (foo 1)

(define (my-last lst)
  (if (null? (cdr lst))
      (car lst)
      (my-last (cdr lst))))

(my-last '(1 2 3))
