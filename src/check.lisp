(defpackage :clue/check
    (:use :cl)
    (:export :are-equal
             :deep-equal-p)
    (:local-nicknames (:err :clue/errors)
                      (:types :alive/types)))

(in-package :clue/check)


(defgeneric deep-equal-p (obj1 obj2))


(defmethod deep-equal-p ((obj1 cons) obj2)
    (cond ((not (typep obj2 'cons)) nil)
          ((not (eq (length obj1) (length obj2))) nil)
          (t (loop :with same := t

                   :for item1 :in obj1
                   :for item2 :in obj2 :do
                       (setf same (and same (deep-equal-p item1 item2)))

                   :finally (return same)))))


(defmethod deep-equal-p ((a string) b)
    (and (string-equal a b)))


(defmethod deep-equal-p ((a integer) b)
    (and (equal (type-of a) (type-of b))
         (eq a b)))


(defmethod deep-equal-p ((a T) b)
    (and (equal (type-of a) (type-of b))
         (eq a b)))


(defun are-equal (&key expected actual)
    (unless (deep-equal-p expected actual)
        (error 'err:test-failed
            :expected expected
            :actual actual)))
