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

(defun my-nth (n l)
  "Returns the nth element of l."
  (check-type l list)
  (cond ((null l) 'nil)
        ((= 0 n) (first l))
        ('t (my-nth (1- n) (rest l)))))

(defun my-assoc (e xss)
  "xss is a list of list. Assoc returns the first list from xss where
  the first element is e."
  (check-type xss list)
  (cond ((null xss) 'nil)
        ((eql (first (first xss)) e) (first xss))
        ('t (my-assoc e (rest xss)))))

(defun allbut (n l)
  "Returns the list l after dropping the first n elements."
  (check-type l list)
  (assert (> n 0) (n) "n has to be greater than 0, but is ~S." n)
  (cond ((> n (length l)) '())
        ((= 0 n) l)
        ('t (allbut (1- n) (rest l)))))
