(defpackage :clue/run
    (:use :cl)
    (:export :suite
             :test)
    (:local-nicknames (:fmt :clue/formatting)))

(in-package :clue/run)


(defun suite (label fn)
    (fmt:print-header label)
    (funcall fn))


(defun test (label fn)
    (let ((result (handler-case

                          (funcall fn)

                      (error (c) (format nil "~A" c)))))

        (format T "~A [~A]~%" label (if result
                                        (format nil "FAILED: ~A" result)
                                        "OK"))))
