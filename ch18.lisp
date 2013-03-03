(in-package :ch18)
(declaim (optimize (speed 0) (safety 3) (debug 3)))

(defun atom-equal (a1 a2)
  "True if a1 and a2 are atoms and are equal according to the proper
  equality predicate."
  (typecase a1
    (number (= a1 a2))
    (character (char= a1 a2))
    (package (equal a1 a2))
    (symbol (equal a1 a2))
    (string (string= a1 a2))))

(defun tree-equal (t1 t2)
  "Returns True if T1 and T2 are trees with
1. the same structure,
2. equal corresponding leaves (according to atom-equal);
NIL, otherwise."
  (cond ((atom t1) (atom-equal t1 t2))
        ((atom t2) nil)
        ((tree-equal (first t1) (first t2)))
        (tree-equal (rest t2) (rest t2))
        (t nil)))
