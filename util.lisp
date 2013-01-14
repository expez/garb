(in-package :util)

(defun elementp (e)
  "Returns True if e is testable with EQL, i.e. e is of type
  character, number or package."
  (or (characterp e) (numberp e) (packagep e)))

(deftype element ()
  "Elements are objects testable by EQL, namely symbols, characters,
  numbers and packages."
  '(satifies util:elementp))

(deftype bag ()
  "A bag is a list where the order of elements does not matter and
  elements can occur more than once."
  '(satisfies listp))
