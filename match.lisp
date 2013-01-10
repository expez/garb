(defpackage :match
  (:use :common-lisp))

(in-package :match)


(defun variablep (e)
  "Returns T if the first char of the symbol's name is #\?"
  (and (symbolp e)
       (char= #\? (char (symbol-name e) 0))))

(defun dont-care (e)
  "Returns TRUE if its argument is ?, otherwise NIL."
  (and (symbolp e)
       (char= (char (symbol-name e) 0) #\?)
       (= (length (symbol-name e)) 1)))

(defun either-is-qmarkp (e1 e2)
  (or (dont-care e1) (dont-care e2)))

(defun match-element (e1 e2)
  "Returns TRUE if its two arguments are EQL or either argument is ?.
If either argument is a variable, as defined by variablep, a two member list is
returned where the first member is the variable.  For all other cases NIL is
returned."
 (cond ((or (either-is-qmarkp e1 e2) (eql e1 e2)) 't)
       ((variablep e1) (list e1 e2))
       ((variablep e2) (list e2 e1))
       ('t 'nil)))


(defun matchlelt (l1 l2)
  "Returns TRUE if the corresponding members in l1 and l2 are EQL or
either is ?."
  (check-type l1 list)
  (check-type l2 list)
  (cond ((and (null l1) (null l2)) 't)
        ((or (null l1) (null l2)) 'nil)
        ((or
          (eql (first l1) (first l2))
          (either-is-qmarkp (first l1) (first l2)))
         (matchlelt (rest l1) (rest l2)))
        ('t 'nil)))
