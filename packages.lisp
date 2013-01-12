(in-package :cl-user)

(defpackage :set
  (:use :common-lisp)
  (:shadow :set)
  (:export :set))

(defpackage :ch16
  (:use :util :common-lisp))

(defpackage :match
  (:use :common-lisp))

(defpackage :misc)
