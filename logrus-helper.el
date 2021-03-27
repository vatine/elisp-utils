(defvar go-insert-logrus-package "log"
  "Name of the logrus package (defaults to \"log\")")

(defun go-insert-logrus (severity)
  "Insert a log entry for the desired severity.

 If the severity is 'error' or 'fatal', a line for the log symbol 'error',
and the variable err will be auto-inserted."
  (interactive "sSeverity: ")
  (let ((start (point))
	(sev (capitalize severity)))
    (insert
     (format "%s.WithFields(%s.Fields{"
	     go-insert-logrus-package go-insert-logrus-package))
    (newline-and-indent)
    (insert (format "}).%s()" sev))
    (indent-for-tab-command)
    (goto-char start)
    (end-of-line)
    (when (go-insert-logrus-error-p sev)
      (newline-and-indent)
      (insert "\"error\": err,")
      (indent-for-tab-command)
      )
    )
  )

(defun go-insert-logrus-error-p (sev)
  (cond ((string= sev "Error"))
	((string= sev "Fatal"))
	(t nil)))
