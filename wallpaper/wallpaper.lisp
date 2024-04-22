(in-package :meaty)

(defparameter *swww-options* "--transition-type grow")

(defun get-cursor-position ()
  (multiple-value-bind (output output-error exit-code)
      (run-program "hyprctl cursorpos" :output :string :ignore-error-status t)
    (if (= exit-code 0)
		(map 'vector #'parse-integer (split-sequence:split-sequence #\, output))
        (progn
          (format t "Error while running \"hyprctl cursorpos\": ~a~%" output-error)
          nil))))

(defun change-wallpaper (img opt)
  (bt:make-thread
   (lambda ()
	 (let ((exit-code (wait-process (run-program (append '("swww")
														 img
														 opt)
												 :error-output :string
												 :ignore-error-status t))))
	   (if (zerop exit-code)
		   (print :success)
		   (print :failure))))
   :name "Waiting for swww"))


