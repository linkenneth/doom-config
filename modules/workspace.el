;;; config/workspace.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one)

;; TODO: find screen resolution and find a reasonable default?
;; (setq doom-font (font-spec :family "Monaco" :size 16)
;;       doom-variable-pitch-font (font-spec :family "Monaco")
;;       doom-unicode-font (font-spec :family "Monaco" :size 16)
;;       doom-big-font (font-spec :family "Monaco" :size 24))

(add-to-list 'initial-frame-alist '(fullscreen . fullboth))

;; TODO: buffer search could be improved, should be able to search based on file
;; path of buffer not just name. Either include Marginalia in search or change
;; dedupe-name of buffer to full name?
;; (setq uniquify-buffer-name-style 'post-forward)
;; (setq uniquify-strip-common-suffix t)

(map! :desc "Find file in project" "M-t" #'projectile-find-file)
