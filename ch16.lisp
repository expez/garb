(defpackage :ch16
  (:use :util :common-lisp))

(in-package :ch16)

(defun before (e1 e2 l)
  "Returns True if the element e1 occurs before the element e2 in the list l"
  (check-type e1 (satisfies util:elementp))
  (check-type e1 (satisfies util:elementp))
  (> (length (member e1 l)) (length (member e2 l))))
