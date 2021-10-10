;;; config/editor.el -*- lexical-binding: t; -*-

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; TODO: add :desc to keymappings

;; TODO: better way to search for full path in project
;; - better way to click-open file path in emacs (from terminal, for example)
;; - open unknown files by default in emacs

;; TODO: search online seems broken, depends on ivy / counsel

;; TODO: /clj root dir seems to have a bunch of symlinks. see if I can not
;; follow symlinks in projectile and other search to speed things up
;; TODO: no need to search .go code from clj. Find ways to limit files
;; TODO: search up projectile search backend and see what settings they use.
;; - could ignore git files

(map! :gi [s-backspace] #'backward-kill-word)

;; TODO:
;; - M-RET, C-RET

;; TODO:
;; - better support for pasting filepath and going to it (C-y does yank
;; from kill ring, and also it doesn't seem to find the last pasted path?)

;; TODO:
;; - better way to read files > 80 chars, and also maybe put a 80 char line?

(load! "evil")
(load! "vertico")
(load! "magit")
(load! "lispy")
