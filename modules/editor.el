;;; config/editor.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type t)

;; TODO: better way to search for full path in project
;; - better way to click-open file path in emacs (from terminal, for example)
;; - open unknown files by default in emacs

;; TODO: search online seems broken, depends on ivy / counsel

(map! :i [s-backspace] #'backward-kill-word
      :nv "M-/" #'comment-line)

(display-fill-column-indicator-mode t)

(load! "evil")
(load! "projectile")
(load! "vertico")
(load! "magit")

;; TODO: HTML web-mode folding doesn't seem to work
;; - investigate whether +lsp is worth using on javascript / typescript / react

;; TODO: investigate if bookmarks can set specific line number across files, to
;; jump to that point directly
;; TODO: probably can improve my dired setup. ranger? using g/.clj/d type
;; deletion in dired buffers?
