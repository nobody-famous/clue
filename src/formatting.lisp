(defpackage :clue/formatting
    (:use :cl)
    (:export :print-header))

(in-package :clue/formatting)


(defun print-header (header)
    (let ((size (length header)))
        (format T "~%~A~%~v@{~A~:*~}~%"
                header
                size "-")))
