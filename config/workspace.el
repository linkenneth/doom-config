;;; config/workspace.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one)

;; TODO: find screen resolution and find a reasonable default?
;; (setq doom-font (font-spec :family "Monaco" :size 16)
;;       doom-variable-pitch-font (font-spec :family "Monaco")
;;       doom-unicode-font (font-spec :family "Monaco" :size 16)
;;       doom-big-font (font-spec :family "Monaco" :size 24))

;; TODO: unable to NOT be full screen with this setup?
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-strip-common-suffix t)

(map! :desc "Find file in project" "M-t" #'projectile-find-file)
