(in-package :set)

(defun setp (l)
  "Returns true if none if the elements of the argument list are
  EQL."
  (check-type l list)
  (if (eql (first l) :set)
      't
      'nil))

(defun in-list-p (e l)
  "Returns true if e is in l, as determined by EQL"
  (check-type l list)
  (cond ((null l) 'nil)
        ((eql (first l) e) 't)
        ('t (in-list-p e (rest l)))))

(defun makeset (l)
  "Creates a set out of the list l."
  (cond ((null l) '())
        ((in-list-p (first l) (rest l)) (makeset (rest l)))
        ('t (cons (first l) (makeset (rest l)))))
  (if (not (eql (first l) :set))
      (cons :set l)))

(defun union (s1 s2)
  "Returns the union of set s1 and s2."
  (check-type s1 (satisfies setp))
  (check-type s2 (satisfies setp))
  (makeset (concatenate 'list s1 s2)))

(deftype set ()
    "A set is a list of only unique elements."
  '(satisfies setp))
