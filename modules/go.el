;;; modules/go.el -*- lexical-binding: t; -*-

(set-formatter!
  'liftoff-gofumpt
  (list
   (concat (getenv "REPOS") "/liftoff/tools/bin/gofumpt"))
  :modes
  '(go-mode (liftoff-project-p (doom-project-root))))

;; TODO: go guru LSP stuff seems incredibly slow for large projects

;; TODO: all the hot keys should use govbuild instead of go build for Liftoff
;; projects? I'm actually not sure though
