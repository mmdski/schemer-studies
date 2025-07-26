;; 3.2.2 Simple Procedure Invocation

(string-append "/home" "/" "andrew")

(string-length "abc")

(string-length (string-append "/home" "/" "andrew"))

;; causes error
;; In procedure string-append: Wrong type (expecting string): 3
;; (string-append "/home" (string-length "abc"))

;; 3.2.3 Creating and Using a New Procedure

(lambda (name address)
  (string-append "Name=" name ":Address=" address))

((lambda (name address)
   (string-append "Name=" name ":Address=" address))
 "FSF"
 "Cambridge")

(define make-combined-string
  (lambda (name address)
    (string-append "Name=" name ":Address=" address)))
(make-combined-string "FSF" "Cambridge")

;; 3.2.4 Lambda Alternatives

(define (make-combined-string name address)
  (string-append "Name=" name ":Address=" address))
