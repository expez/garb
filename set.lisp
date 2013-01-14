(in-package :set)

(defun setp (l)
  "Returns true if none if the elements of the argument list are
  EQL."
  (check-type l list)
  (if (eql (cl:first l) :set)
      't
      'nil))

(defun in-list-p (e l)
  "Returns true if e is in l, as determined by EQL"
  (check-type l list)
  (cond ((null l) 'nil)
        ((eql (cl:first l) e) 't)
        ('t (in-list-p e (cl:rest l)))))


(defun makeset (l)
  "Creates a set out of the list l."
  (check-type l list)
  (add-set-label (remove-duplicates l)))

(defun remove-duplicates (l)
  "Removes all duplicates from l."
  (check-type l list)
  (cond ((null l) '())
        ((in-list-p (cl:first l) (cl:rest l)) (remove-duplicates (cl:rest l)))
        ('t (cons (cl:first l) (remove-duplicates (cl:rest l))))))

(defun add-set-label (l)
  (check-type l list)
  (cons :set l))

(defun union (s1 s2)
  "Returns the union of set s1 and s2."
  (check-type s1 (satisfies setp))
  (check-type s2 (satisfies setp))
  (makeset (concatenate 'list s1 s2)))

(defun first (l)
  "Returns the first element of the set."
  (check-type l (satisfies setp))
  (elt l 1))

(defun rest (l)
  "Returns the set after dropping the first element."
  (check-type l (satisfies setp))
  (setf (elt l 0) 0) ;Without this (listp l) is nil.
  (cl:rest (cl:rest l)))

(deftype set ()
    "A set is a list of only unique elements."
  '(satisfies setp))
