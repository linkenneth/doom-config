;;; config/clojure.el -*- lexical-binding: t; -*-

(after! clojure-mode
  ;; TODO: try this out
  ;; (add-hook 'clojure-mode-hook #'format-all-mode)
  (setq clojure-indent-style 'align-arguments))

(after! cider-mode
  (setq cider-auto-select-test-report-buffer nil)
  (setq cider-auto-select-error-buffer nil))

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
;; like in Go. Would be REALLY useful actually

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

;; TODO: extra, but f6 "view instrumented functions" can be part of cider local
;; leader, and also can use vertico if exists
;;
;; TODO: SPC m i r (inspect) never works in debug mode
;; TODO: ideally I can move around more easily in debug mode. ability to eval in
;; context with locals is amazing, but a bit awkward to use without standard vim
;; movement

;; TODO: better evil-mode integration with cider spec browse
