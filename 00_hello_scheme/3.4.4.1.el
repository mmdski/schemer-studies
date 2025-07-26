;;; 3.4.4.1.el --- Dynamic Scoping Example           -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Marian Domanski

;; Author: Marian Domanski <marian@killy.local>
;; Keywords: lisp

(defvar currency-abbreviation "USD")

(defun currency-string (units hundredths)
  (concat
   currency-abbreviation
   (number-to-string units)
   "."
   (number-to-string hundredths)))

(defun french-currency-string (units hundredths)
  (let ((currency-abbreviation "FRF"))
    (currency-string units hundredths)))

(french-currency-string 33 44)
