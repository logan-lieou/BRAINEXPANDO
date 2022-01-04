;; graph representation in symbolssss
(defparameter *graph* '((a (a b . 7) (a c . 9) (a f . 14))
                    (b (b c . 10) (b d . 15))
                    (c (c d . 11) (c f . 2))
                    (d (d e . 6))
                    (e (e f . 9))))

;; q data struct
(defvar *r* nil)

;; search algorithm greedy dijkstra be like 1 -> [2, 3, 4]; 1 -> 2 -> [2, 6, 1]; 1 -> 2 -> 1;
(defun dijkstra-short-path (i g)
  (setf *r* nil) (paths i g 0 `(,i))
  (car (sort *r* #'< :key #'cadr)))

;; bfs ??? idk all this code was yonked from public domain anw
(defun paths (c g z v)
  (if (eql c g) (push `(,(reverse v) ,z) *r*)
      (loop for a in (nodes c) for b = (cadr a) do
            (unless (member b v)
              (paths b g (+ (cddr a) z) (cons b v))))))

;; scuffed
(defun nodes (c)
	(sort (cdr (assoc c *graph*)) #'< :key #'cddr))

;; output the shortest path
(format t "~a~%" (dijkstra-short-path 'a 'b))

