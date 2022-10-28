;;; modules/go.el -*- lexical-binding: t; -*-

;; TODO: pull from master and make this gofumpt
(set-formatter!
  'liftoff-goimports
  (list
   (concat (getenv "REPOS") "/liftoff/tools/bin/goimports")
   "-local" "liftoff/")
  :modes
  '(go-mode (liftoff-project-p (doom-project-root))))

;; TODO: SPC c f formatting doesn't seem to work?

;; TODO: gopls seems to often give "no package" (unknown error) issues. Possibly
;; poor selection of project root? or what? could have to do with not using go.mod
;; as well as not using GOPATH?
;; https://github.com/golang/go/issues/32667
;; - "add folder containing go.mod as workspace"

;; TODO: flycheck golang ci lint doesn't seem to be working
;; TODO: go guru LSP stuff seems incredibly slow for large projects

;; TODO: something seems wrong a lot of the time with Go LSP. figure out what's
;; wrong
