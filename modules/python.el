;;; python.el -*- lexical-binding: t; -*-

(after! python
  ;; make def block continuations indent as expected
  ;; https://github.com/hlissner/doom-emacs/issues/3028
  (setq python-indent-def-block-scale 1))

(set-formatter!
  'liftoff-black
  (list
   (concat (getenv "LIFTOFF_VENV_ROOT") "/pytool-pydev/bin/black")
   "-q" ;; quiet
   "-")
  :modes
  '(python-mode (liftoff-project-p (doom-project-root))))

;; TODO: isort and black on save

;; TODO: add mypi (and liftoff mypi) support
