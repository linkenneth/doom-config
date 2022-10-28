;;; modules/workspace.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one)

(add-to-list 'initial-frame-alist '(fullscreen . fullboth))

;; TODO: buffer search could be improved, should be able to search based on file
;; path of buffer not just name. Either include Marginalia in search or change
;; dedupe-name of buffer to full name?
;; (setq uniquify-buffer-name-style 'post-forward)
;; (setq uniquify-strip-common-suffix t)

(map! :desc "Find file in project" "M-t" #'projectile-find-file)
