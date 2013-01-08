(defpackage misc)
(declaim (optimize (speed 0) (safety 0) (debug 3)))

(defun sum (n1 n2)
  "Returns the sum of two nonneggative integers."
  (assert
   (and (integerp n1) (>= n1 0))
   (n1)
   "N1 must be a nonnegative integer, instead it's ~S."
   n1)
  (assert
   (integerp n2)
   (n2)
   "N2 must be an integer, instead it's ~S."
   n2)
  (if (zerop n1) n2
      (sum (1- n1) (1+ n2))))


(defun sum2 (n1 n2)
  "Returns the sum of two nonnegative integers."
  (assert
   (and (integerp n1) (>= n1 0))
   (n1)
   "N1 must be a nonnegative integer, but it’s ~S."
   n1)
  (assert
   (integerp n2)
   (n2)
   "N2 must be an integer, instead it’s ~S."
   n2)
  (if (zerop n1) n2
      (1+ (sum2 (1- n1) n2))))

(defun product (n1 n2)
  "Returns the product of n1 and n2"
  (assert
   (and (integerp n1) (integerp n2))
   (n1 n2)
   "N1 and N2 must both be integers, but are ~S and ~S" n1 n2)
  (cond ((or (zerop n1) (zerop n2)) 0)
        ((= 1 n1) n2)
        ('t (sum n2 (product (1- n1) n2)))))

(defun power (n i)
       "Returns n^i"
       (if (= i 0) 1
           (product n (power n (1- i)))))
