;;; config/editor.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type t)

;; TODO:
;; - better way to click-open file path in emacs (from terminal, for example)

(map! :i [s-backspace] #'backward-kill-word
      :nv "M-/" #'comment-line)

(display-fill-column-indicator-mode t)

(load! "evil")
(load! "projectile")
(load! "vertico")
(load! "magit")
