(in-package :meaty)

(defparameter *swww-options* (list "--transition-type" "grow"))

(defun get-cursor-position ()
  (multiple-value-bind (output output-error exit-code)
      (run-program "hyprctl cursorpos" :output :string :ignore-error-status t)
    (if (= exit-code 0)
        (map 'vector #'parse-integer (split-sequence:split-sequence #\, output))
        (progn
          (format t "Error while running \"hyprctl cursorpos\": ~a~%" output-error)
          nil))))

(defun change-wallpaper (img &optional (opt))
  (multiple-value-bind (output output-error exit-code)
	  (run-program (append (list "swww" "img" (native-namestring img)) opt)
				   :error-output :string
				   :ignore-error-status t)
	(if (= exit-code 0)
		output
        (progn
          (format t "Error while running \"swww\": ~a~%" output-error)
          nil))))

(defun change-wallpaper-with-animation (img)
  (change-wallpaper img (append *swww-options*
							(list "--transition-pos"
								  (format nil "~{~a~^,~}" (coerce (get-cursor-position) 'list))))))


