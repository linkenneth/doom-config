;;; config/evil.el -*- lexical-binding: t; -*-

(after! evil-escape
  (setq evil-escape-unordered-key-sequence t))

(after! evil
  (map! (:map evil-surround-mode-map
         :v "s" #'evil-surround-region
         :v "S" #'evil-Surround-region)

        ;; unmaps `aya-expand' and `aya-create' which I'll never use
        :nvi [C-tab] nil
        :nv "g/" #'evilnc-comment-operator))

;; TODO: exercise: try to evaluate either elisp or clojure easily inline
;; TODO: exercise: try to run M-x commands with g/ matches
