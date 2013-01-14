(in-package :cl-user)

(defpackage :util
  (:use :common-lisp)
  (:export :elementp
           :element
           :bag))

(defpackage :set
  (:use :common-lisp :util)
  (:shadow :set
           :union)
  (:export :set
           :makeset
           :union))

(defpackage :ch16
  (:use :util
        :common-lisp))

(defpackage :match
  (:use :common-lisp))

(defpackage :misc)
