;;; config/clojure.el -*- lexical-binding: t; -*-

(after! clojure-mode
  ;; TODO: try this out
  ;; (add-hook 'clojure-mode-hook #'format-all-mode)
  (setq clojure-indent-style 'align-arguments))

;; TODO: see if I can get it working... known issue that no one has figured
;; out for 4 years...
;; squiggly-clojure -- eastwood, core.typed, and kibit linters that work
;; through cider
;; (use-package! flycheck-clojure
;;   :hook (cider-connected-hook flycheck-clojure-setup)
;;   :when (featurep! :checkers syntax)
;;   :after flycheck
;;   :config (add-hook 'cider-connected-hook #'flycheck-clojure-setup))

;; TODO:
;; - SPC s i (jump to symbol) could use some Marginalia annotations, like
;; docstring if available etc., in clojure mode. or just add the defun line to it
;; like in Go

;; TODO:
;; - cider toggle trace var and ns bindings, and learn how to do them
;; https://docs.cider.mx/cider/debugging/tracing.html

;; TODO:
;; - commands do dash-case, underscorize, camel-case, and pascal case

(set-formatter!
  'liftoff-cljfmt
  (concat (getenv "REPOS") "/liftoff/tools/bin/cljfmt")
  :modes
  '(clojure-mode (liftoff-project-p (doom-project-root))))
