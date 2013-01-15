(in-package :set)
 (declaim (optimize (speed 0) (safety 3) (debug 3)))

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
  (let ((l1 (copy-list s1))
        (l2 (copy-list s2)))
    (setf (elt l1 0) 1)
    (setf (elt l2 0) 2)
    (makeset (concatenate 'list (cl:rest l1) (cl:rest l2)))))

(defun first (l)
  "Returns the first element of the set."
  (check-type l (satisfies setp))
  (if (empty l)
      (list :set)
      (elt l 1)))

(defun rest (s)
  "Returns the set after dropping the first element."
  (check-type s (satisfies setp))
  (let ((l (copy-list s)))
    (setf (elt l 0) 0) ;Without this (listp l) is nil.
    (cons :set (cl:rest (cl:rest l)))))

(defun insert (e s)
  "Inserts element e into set s"
  (check-type s (satisfies setp))
  (if (null e)
      s
      (union (makeset (list e)) s)))

(defun intersection (s1 s2)
  "Returns the intersection of sets s1 and s2."
  (check-type s1 (satisfies setp))
  (check-type s2 (satisfies setp))
  (let ((e (next-common-element s1 s2)))
    (if e
        (insert e (intersection (remove e s1) (remove e s2)))
        '(:set))))

(defun remove (e s)
  "Removes element e from set s"
  (check-type s (satisfies setp))
  (cond ((empty s) '(:set))
        ((eql (first s) e) (rest s))
        ('t (insert (first s) (remove e (rest s))))))

(defun next-common-element (s1 s2)
  "Returns the next element s1 and s2 has in common."
  (check-type s1 (satisfies setp))
  (check-type s2 (satisfies setp))
  (cond ((empty s1) 'nil)
        ((empty s2) 'nil)
        ((in-set-p (first s1) s2) (first s1))
        ((next-common-element (rest s1) s2))))

(defun in-set-p (e s)
  "Returns true if e is in s"
  (check-type s (satisfies setp))
  (cond ((empty s) 'nil)
                   ((eql (first s) e) 't)
                   ('t (in-set-p e (rest s)))))

(defun empty (s)
  "Returns true if s is an empty set."
  (check-type s (satisfies setp))
  (if (and (= 1 (length s)) (eql (elt s 0) :set))
      't
      'nil))

(defun complement (s1 s2)
  "Returns the complement of sets s1 and s2: the elements in s1 but
  not in s2."
  (check-type s1 (satisfies setp))
  (check-type s2 (satisfies setp))
  (let ((e (next-common-element s1 s2)))
    (cond ((empty s1) s2)
          ((empty s2) s1)
          (e (complement (remove e s1) (remove e s2)))
          ((null e) (union s1 s2))
          ('t '(:set)))))

(deftype set ()
    "A set is a list of only unique elements."
  '(satisfies setp))
