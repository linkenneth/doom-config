;;; config/clojure.el -*- lexical-binding: t; -*-

;; TODO: see if I can get it working... known issue that no one has figured
;; out for 4 years...
;; squiggly-clojure -- eastwood, core.typed, and kibit linters that work
;; through cider
;; (use-package! flycheck-clojure
;;   :hook (cider-connected-hook flycheck-clojure-setup)
;;   :when (featurep! :checkers syntax)
;;   :after flycheck
;;   :config (add-hook! 'cider-connected-hook #'flycheck-clojure-setup))

;; TODO: custom liftoff cljfmt on save. exp/emacs has a file for this (may be outdated)
;; - SPC c f does format region / buffer. see if there's a way to integrate with
;; that correctly
;; TODO: try out running LSP server when first opening clojure file?

;; (add-hook! 'clojure-mode-hook #'format-all-mode)
;; TODO: emacs quite laggy and slow for large codebases... maybe figure out why

;; TODO:
;; - SPC s i (jump to symbol) could use some Marginalia annotations, like
;; docstring if available etc., in clojure mode. or just add the defun line to it
;; like in Go

;; TODO:
;; - cider toggle trace var and ns bindings

;; TODO:
;; - next line function indent seems to be 2 spaces, not 1

;; TODO:
;; - commands do dash-case, underscorize, camel-case, and pascal case
