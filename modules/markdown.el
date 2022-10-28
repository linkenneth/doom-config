;;; modules/markdown.el -*- lexical-binding: t; -*-

;; TODO: folding by section isn't really doing well for markdown. What I'd like
;; is to fold by headers, not fold a few parentheses. tab does allow for this,
;; it's just evil-mode's integration is not great
;;
;; options:
;; - markdown-cycle
;; - outline-hide-sublevel / outline-show-subtree etc.
;; - (see org mode keybindings)

;; TODO: clear trailing whitespace on save

;; TODO: mouse click URLs that end with "." in READMEs adds it to the URL. g f
;; does not have this behavior. Example:
;; https://app.liftoff.io/admin/creatives/edit?creative_id=167030.
