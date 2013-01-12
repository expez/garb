(in-package :set)

(defun setp (l)
  "Returns true if none if the elements of the argument list are
  EQL."
  (check-type l list)
  (cond ((null l) 't)
        ((in-list-p (first l) (rest l)) 'nil)
        (t (setp (rest l)))))

(defun in-list-p (e l)
  "Returns true if e is in l, as determined by EQL"
  (check-type l list)
  (cond ((null l) 'nil)
        ((eql (first l) e) 't)
        ('t (in-list-p e (rest l)))))

(deftype set ()
    "A set is a list of only unique elements."
  '(satisfies setp))
