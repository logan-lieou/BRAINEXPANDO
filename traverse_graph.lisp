(defparameter *graph* '((a (a b) (a c))
                        (b (b a) (b c))
                        (c (c a) (c b) (c d))))

(defvar *q* nil)

;; implementation TODO
(defun bfs (s g)
  (setf *q* nil) ())
