;; 3.4.2 Local Variables and Environments

(define a 5.3)
(define b 4.7)
(define c 2.8)

(define area
  (let ((s (/ (+ a b c) 2)))
    (sqrt (* s (- s a) (- s b) (- s c)))))

(restart 1)

;; 3.4.4.1 An Example of Non-Lexical Scoping
(define currency-abbreviation "USD")

(define (currency-string units hundredths)
  (string-append currency-abbreviation
                 (number->string units)
                 "."
                 (number->string hundredths)))

(define (french-currency-string units hundredths)
  (let ((currency-abbreviation "FRF"))
    (currency-string units hundredths)))

(french-currency-string 33 44)

;; 3.4.5 Closure
(let ((s (/ (+ a b c) 2)))
  (sqrt (* s (- s a) (- s b) (- s c))))

;; 3.4.6 Example 1: A Serial Number Generator
(define (make-serial-number-generator)
  (let ((current-serial-number 0))
    (lambda ()
      (set! current-serial-number (+ current-serial-number 1))
      current-serial-number)))

(define entry-sn-generator (make-serial-number-generator))

(entry-sn-generator)

;; 3.4.7 Example 2: A Shared Persistent Variable
(define get-balance #f)
(define deposit #f)

(let ((balance 0))
  (set! get-balance
        (lambda ()
          balance))
  (set! deposit
        (lambda (amount)
          (set! balance (+ balance amount))
          balance)))

(define (withdraw amount)
  (deposit (- amount)))

(get-balance)

(deposit 50)

(withdraw 75)

;; 3.4.9 Example 4: Object Orientation
(define (make-account)
  (let ((balance 0))
    (define (get-balance)
      balance)
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (withdraw amount)
      (deposit (- amount)))

    (lambda args
      (apply
       (case (car args)
         ((get-balance) get-balance)
         ((deposit) deposit)
         ((withdraw) withdraw)
         (else (error "Invalid method!")))
       (cdr args)))))

(define my-account (make-account))

(my-account 'get-balance)

(my-account 'withdraw 5)

(my-account 'deposit 396)

(my-account 'get-balance)
