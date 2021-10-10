;;; config/editor.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type t)

;; TODO: better way to search for full path in project
;; - better way to click-open file path in emacs (from terminal, for example)
;; - open unknown files by default in emacs

;; TODO: search online seems broken, depends on ivy / counsel

;; TODO: search up projectile search backend and see what settings they use.
;; - could ignore git files

(map! :desc "Kill word backwards" :i [s-backspace] #'backward-kill-word)

;; TODO:
;; - better support for pasting filepath and going to it (C-y does yank
;; from kill ring, and also it doesn't seem to find the last pasted path?)

(display-fill-column-indicator-mode)

(load! "evil")
(load! "projectile")
(load! "vertico")
(load! "magit")
(load! "lispy")
