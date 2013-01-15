(in-package :cl-user)

(defpackage :util
  (:use :common-lisp)
  (:export :elementp
           :element
           :bag))

(defpackage :set
  (:use :common-lisp :util)
  (:shadow :set
           :union
           :first
           :rest
           :remove-duplicates
           :intersection
           :remove
           :complement
           :subsetp
           :set-equal)
  (:export :set
           :makeset
           :union
           :first
           :rest
           :intersection
           :remove
           :complement
           :supsetp
           :set-equal))

(defpackage :ch16
  (:use :util
        :common-lisp))

(defpackage :match
  (:use :common-lisp)
  (:shadow :boundp)
  (:export :boundp))

(defpackage :misc)
