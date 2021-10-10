;;; config/lispy.el -*- lexical-binding: t; -*-

(use-package! lispy
  :config
  (lispy-set-key-theme '())
  (remove-hook! 'lispy-mode-hook #'turn-off-smartparens-mode))

(use-package! lispyville
  :init
  (setq lispyville-key-theme
        '((operators normal)
          c-w
          (atom-movement t)
          slurp/barf-cp
          additional
          additional-insert
          additional-wrap))
  :config
  (remove-hook! 'evil-escape-inhibit-functions #'+lispy-inhibit-evil-escape-fn)
  ;; unset `transpose-sexps' because it's not useful compared to
  ;; `lispyville-drag-forward' and `lispyville-drag-backward', and collides with
  ;; Atom shortcuts to find file in project
  (map! :map lispyville-mode-map :n "M-t" nil))

;; TODO: use lispyville to safe comment lines (lispyville-comment-or-uncomment)
;; TODO: remap ( and ) to parenthesis in lisp modes (and maybe consider in
;; non-lisp modes)
;; TODO: map the always-left-parenthesis slurp / barf movements to something
;; TODO: learn better regexps for working with lisp atoms (see lispyville atom
;; text object def)
