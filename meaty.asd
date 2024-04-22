;;;; meaty.asd

(asdf:defsystem #:meaty
  :description "A lisp desktop environment suite"
  :author "Iván Villagrasa <ivvil412@gmail.com>"
  :license  "GPL-3"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "meaty")
			   (:module "bar"
						:components ((:file "bar")))
			   (:module "wallpaper"
						:components ((:file "wallpaper"))))
  :depends-on (:alloy
			   :alloy-windowing
			   :alloy-glfw
			   :bordeaux-threads))
