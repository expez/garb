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

(defun equal-lelt (l1 l2)
  "Returns TRUE if the corresponding members in l1 and l2 are EQL."
  (check-type l1 list)
  (check-type l2 list)
  (cond ((and (null l1) (null l2)) 't)
        ((or (null l1) (null l2)) 'nil)
        ((eql (first l1) (first l2)) (equal-lelt (rest l1) (rest l2)))
        ('t 'nil)))
