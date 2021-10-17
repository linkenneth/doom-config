;;; go.el -*- lexical-binding: t; -*-

(set-formatter!
  'liftoff-goimports
  (list
   (concat (getenv "REPOS") "/liftoff/tools/bin/goimports")
   "-local" "liftoff/")
  :modes
  '(go-mode (liftoff-project-p (doom-project-root))))
