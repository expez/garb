(defpackage :ch16
  (:use :util :common-lisp))

(in-package :ch16)

(defun before (e1 e2 l)
  "Returns True if the element e1 occurs before the element e2 in the list l"
  (check-type e1 (satisfies util:elementp))
  (check-type e1 (satisfies util:elementp))
  (cond ((null l) nil)
        ((eql (first l) e1) 't)
        ('t (before e1 e2 (rest l)))))
