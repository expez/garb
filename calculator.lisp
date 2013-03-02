(in-package :calculator)
(declaim (optimize (speed 0) (safety 3) (debug 3)))

(defun combine-expr (op operand exp)
  "'+ 3 '(5 - 6 * 8) => ((+ 3 5) - 6 * 8)"
  (check-type op symbol)
  (check-type exp list)
  (cons (list op operand (first exp)) (rest exp)))

(defun enclose-expression (exp)
  "Takes a list of arithmetic expressions and returns a singleton list
  whose only member is the expression transformed to Cambridge prefix
  notation."
  (check-type exp list)
  (cond ((or (null exp)
             (> 3 (length exp))) exp)
        (t (enclose-expression
            (combine-expr (second exp) (first exp) (subseq exp 2))))))

;;; TODO rewrite this completely
(defun enclose-term (exp)
  "Terms are separated by '-' or '+'.  Returns exp with the first term
  written in Cambridge prefix notation."
  (check-type exp list)
  (let* ((op-index (last-consecutive-index '(- +) exp))
         (term (subseq exp 0 (min (+ op-index 2) (length exp))))
         (exp-end (min (+ op-index 1) (length exp)))
         (exp-rest (subseq exp exp-end)))
    (if (and (null (member '/ exp))
             (null (member '* exp)))
        exp
        (cons (enclose-expression term) (enclose-term exp-rest)))))

(defun last-consecutive-index (ops exp)
  "Returns the last consecutive index, in EXP, of operators only from
OPS"
  (check-type exp list)
  (check-type ops list)
  (if (not (or (mapcar (lambda (e) (null (member e ops))) exp)))
      0
      (if (first-occurence-of-unknown ops exp)
          (first-occurence-of-unknown ops exp)
          (length exp))))

(defun first-occurence-of-unknown (ops exp)
  "Returns the index of the first occurrence of any element from exp
which isn't in OPS and is not a number"
  (check-type ops list)
  (check-type exp list)
  (let ((number-or-op-at-index (mapcar
                                 (lambda (e)
                                   (not (and (null (member e ops))
                                             (null (numberp e)))))
                                 exp)))
    (if (position nil number-or-op-at-index)
        (position nil number-or-op-at-index)
        (length exp))))

;;; TODO: Rewrite this.
(defun enclose-factor (exp)
  "A factor is one of the operands of multiplication or division.
  This function returns the first factor, written in cambridge prefix
  notation."
  (check-type exp list)
  (let* ((op-index (last-consecutive-index '(* /) exp))
         (term (subseq exp 0 (+ 2 op-index)))
         (exp-rest (subseq exp (+ 2 op-index))))
    (cons (enclose-expression term) exp-rest)))
