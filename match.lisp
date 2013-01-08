(defpackage match)

(defun variablep (e)
  "Returns T if the first char of the symbol's name is #\?"
  (and (symbolp e)
       (char= #\? (char (symbol-name e) 0))))

(defun dont-care (e)
  "Returns TRUE if its argument is ?, otherwise NIL."
  (and (symbolp e)
       (char= (char (symbol-name e) 0) #\?)
       (= (length (symbol-name e)) 0)))

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
