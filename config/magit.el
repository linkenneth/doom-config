;;; config/magit.el -*- lexical-binding: t; -*-

;; removes binding that conflicts with `bury-buffer'
(map! :map magit-mode-map
      :g "M-w" nil)

;; TODO: add +vc/browse-line-at-remote / +vc/browse-line-at-remote-kill
;; for easier linking of code

;; TODO: [ g or something to find next merge conflict?
