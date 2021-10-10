;;; config/evil.el -*- lexical-binding: t; -*-

;; maps evil-surround from S -> s and gS -> S. This overrides evil-snipe in
;; visual mode, which uses s.
(use-package! evil-escape
  :init
  ;; also allows "kj" to escape
  (setq evil-escape-unordered-key-sequence t))

(map! :map evil-surround-mode-map
      :v "s" #'evil-surround-region
      :v "S" #'evil-Surround-region)

;; unmaps `aya-expand' and `aya-create' which I'll never use
(map! :i [C-tab] nil
      :nv [C-tab] nil
      :g "M-/" #'comment-dwim)

;; TODO: comment-dwim on line isn't what I want. remap comment operator or
;; something to this?

;; TODO: evil-mode visual mode is quite slow for some reason.
;; multi-cursor is even slower. the only thing that's usable is ex-mode replace.
;; - find way to speed this up?
;;
;; TODO: an exercise: how can I run macros through ex mode? Tried it and didn't
;; seem to work.
;;
;; TODO: exercise: try to evaluate either elisp or clojure easily inline
;; TODO: exercise: try to run M-x commands with g/ matches
