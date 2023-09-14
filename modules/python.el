;;; python.el -*- lexical-binding: t; -*-

(after! python
  ;; make def block continuations indent as expected
  ;; https://github.com/hlissner/doom-emacs/issues/3028
  (setq python-indent-def-block-scale 1)

  ;; use 88 characters line length when using Black
  (add-hook 'python-mode-hook
            (lambda () (when (liftoff-project-p (doom-project-root))
                         (set-fill-column 88)))))

;; HACK: if Doom supports multi-formatters better, change this to use
;; a single set-formatter! call
(set-formatter!
  'liftoff-black-isort
  (list
   (concat (getenv "HOME") "/bin/black-isort"))
  :modes
  '(python-mode (liftoff-project-p (doom-project-root))))

;; TODO: add mypi (and liftoff mypi) support (we already have some?)
;; TODO: g a ' text object for triple quotes doesn't copy the whole triple
;; quote, only the first inner quote
;; TODO: triple quote with formatted string doesn't display proper syntax
;; un-highlighting for the formatted variables
