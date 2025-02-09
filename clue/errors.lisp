(in-package :clue)


(define-condition test-failed (error)
        ((expected :accessor expected
                   :initform nil
                   :initarg :expected)
         (actual :accessor actual
                 :initform nil
                 :initarg :actual)
         (reason :accessor reason
                 :initform nil
                 :initarg :reason)
         (hex :accessor hex
              :initform nil
              :initarg :hex))
    (:report (lambda (condition stream)
                 (if (reason condition)
                     (format stream "~A"
                         (reason condition))
                     (format stream (if (hex condition) "Expected 0x~X, found 0x~X" "Expected ~A, found ~A")
                         (expected condition)
                         (actual condition))))))
