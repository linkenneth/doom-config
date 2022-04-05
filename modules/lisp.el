;;; modules/lisp.el -*- lexical-binding: t; -*-

(after! lispy
  (lispy-set-key-theme '())
  (remove-hook! 'lispy-mode-hook #'turn-off-smartparens-mode))

(after! lispyville
  (lispyville-set-key-theme
   '((operators normal)
     c-w
     (atom-movement t)
     slurp/barf-cp
     additional
     additional-insert
     additional-wrap))
  (remove-hook! 'evil-escape-inhibit-functions #'+lispy-inhibit-evil-escape-fn)
  (map! :map lispyville-mode-map
        ;; Unset `transpose-sexps'. It duplicates functionality from
        ;; `lispyville-drag-forward' and `lispyville-drag-backward' and collides
        ;; with other preferred keybindings.
        :n "M-t" nil
        :nv "g/" #'lispyville-comment-or-uncomment
        :nv "M-/" #'lispyville-comment-or-uncomment-line
        :m "(" #'lispyville-backward-up-list
        :m ")" #'lispyville-up-list))

;; TODO: (maybe) map the always-left-parenthesis slurp / barf movements to something
