(in-package :calculator)

(defun combine-expr (op operand exp)
  "'+ 3 '(5 - 6 * 8) => ((+ 3 5) - 6 * 8)"
  (check-type op symbol)
  (check-type exp list)
  (cons (list op operand (first exp)) (rest exp)))

(defun enclose-expression (exp)
  "Takes a list of arithmetic expressions and returns a singleton list
  whose only member is the expression transformed to Cambridge infix
  notation."
  (check-type exp list)
  (cond ((or (null exp)
             (> 3 (length exp))) exp)
        (t (enclose-expression
            (combine-expr (second exp) (first exp) (subseq exp 2))))))
