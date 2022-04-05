;;; config/magit.el -*- lexical-binding: t; -*-

(after! magit
  ;; Remove binding that conflicts with `bury-buffer'
  (map! :map magit-mode-map "M-w" nil))

(after! browse-at-remote
  (setq browse-at-remote-add-line-number-if-no-region-selected t))

;; TODO: [ g or something to find next merge conflict?
;; TODO: SPC g o h or similar to open commit history in browser

;; TODO: git time machine SPC g t is really cool, but not well-supported
;; keybindings wise. could add support for this
