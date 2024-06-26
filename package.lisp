;;;; package.lisp

(defpackage #:dev.shft.dev.meaty
  (:use #:cl #:uiop)
  (:local-nicknames
   (#:alloy #:org.shirakumo.alloy)
   (#:glfw #:org.shirakumo.alloy.renderers.glfw)
   (#:simple #:org.shirakumo.alloy.renderers.simple)
   (#:presentations #:org.shirakumo.alloy.renderers.simple.presentations)
   (#:windowing #:org.shirakumo.alloy.windowing)
   (#:colors #:org.shirakumo.alloy.colored.colors)
   (#:animation #:org.shirakumo.alloy.animation)
   (#:colored #:org.shirakumo.alloy.colored)
   (#:colors #:org.shirakumo.alloy.colored.colors)))
