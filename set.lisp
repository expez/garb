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
  (let ((l1 s1)
        (l2 s2))
    (setf (elt l1 0) 0)
    (setf (elt l2 0) 0)
    (makeset (concatenate 'list (cl:rest l1) (cl:rest l2)))))

(defun first (l)
  "Returns the first element of the set."
  (check-type l (satisfies setp))
  (elt l 1))

(defun rest (s)
  "Returns the set after dropping the first element."
  (check-type s (satisfies setp))
  (let ((l s)
        (setf (elt l 0) 0) ;Without this (listp l) is nil.
        (cons :set (cl:rest (cl:rest l))))))

(defun insert (e s)
  "Inserts element e into set s"
  (check-type s (satisfies setp))
  (union (makeset '(e)) s))

(deftype set ()
    "A set is a list of only unique elements."
  '(satisfies setp))
