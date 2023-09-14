;;; modules/magit.el -*- lexical-binding: t; -*-

(after! magit
  ;; Remove binding that conflicts with `bury-buffer'
  (map! :map magit-mode-map "M-w" nil)

  (map! :leader
        (:prefix "g"
         ;; see buffer changes; equivalent to `git diff HEAD <file>'
         :desc "Magit diff buffer / file" "d" #'magit-diff-buffer-file
         ;; see all changes; equivalent to `git diff HEAD'
         ;; (overrides "Magit file delete")
         :desc "Magit diff unstaged" "D" #'magit-diff-unstaged)))

(after! browse-at-remote
  (setq browse-at-remote-add-line-number-if-no-region-selected t))

;; TODO: [ g or something to find next merge conflict?
;; TODO: SPC g o h or similar to open commit history in browser
;; - > SPC g L accomplishes something similar, but still would like show history
;; -   in browser

;; TODO: git time machine SPC g t is really cool, but not well-supported
;; keybindings wise. could add support for this
