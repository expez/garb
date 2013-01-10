(defpackage :ch16
  (:use :util :common-lisp))

(in-package :ch16)

(defun before (e1 e2 l)
  "Returns True if the element e1 occurs before the element e2 in the list l"
  (check-type e1 (satisfies util:elementp))
  (check-type e1 (satisfies util:elementp))
  (> (length (member e1 l)) (length (member e2 l))))

(defun my-count (e l)
  "Returns the number of occurrences of e in l"
  (check-type l list)
  (cond ((null l) 0)
        ((eql (first l) e) (1+ (my-count e (rest l))))
        ('t (my-count e (rest l)))))
