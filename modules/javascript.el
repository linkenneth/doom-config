;;; javascript.el -*- lexical-binding: t; -*-

;; TODO: this doesn't quite work yet. Can't infer parser from file name
;; (set-formatter!
;;   'liftoff-prettier
;;   (list (concat (getenv "REPOS") "/liftoff/tools/bin/prettier")
;;         '("--stdin-filepath=%S" buffer-file-name))
;;   :modes
;;   '((js2-mode            (liftoff-project-p (doom-project-root)))
;;     (rjsx-mode           (liftoff-project-p (doom-project-root)))
;;     (typescript-mode     (liftoff-project-p (doom-project-root)))
;;     (typescript-tsx-mode (liftoff-project-p (doom-project-root)))))
