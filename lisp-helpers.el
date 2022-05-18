(defun lisp-insert-slot (name &optional read-only)
  (let ((frobber (if read-only ":reader" ":accessor")))
    (insert (format "(%s %s %s :initarg :%s)" name frobber name name))
    (newline-and-indent)))

(defun lisp-clos-insert-accessor (name)
  (interactive "sName: ")
  (lisp-insert-slot name))

(defun lisp-clos-insert-reader (name)
  (interactive "sName: ")
  (lisp-insert-slot name t))
