;;; modules/editor.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type t)

;; TODO:
;; - modify link following (g f or clicking) to check absolute link with project
;; base as candidate as well
;; TODO: mouse click URLs that end with . in READMEs adds it to the URL. g f
;; does not have this behavior
;; TODO:
;; - add some kind of modifier to perform most navigations into a new buffer,
;; sort of like C-x 4 b. I wonder if this exists already
;; TODO:
;; - (esp. clojure-mode) pretty-print or wrap G R inline evaluation results

(map! :i [s-backspace] #'backward-kill-word
      :nv "M-/" #'comment-line)

(display-fill-column-indicator-mode t)

(load! "evil")
(load! "search")
(load! "magit")
