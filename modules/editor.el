;;; modules/editor.el -*- lexical-binding: t; -*-

(after! prog-mode
  (add-hook 'prog-mode-hook #'display-fill-column-indicator-mode))

;; TODO:
;; - add some kind of modifier to perform most navigations into a new buffer,
;; sort of like C-x 4 b. I wonder if this exists already
;; TODO:
;; - (esp. clojure-mode) pretty-print or wrap G R inline evaluation results

(map! :i [s-backspace] #'backward-kill-word
      :nv "M-/" #'comment-line)

(load! "evil")
(load! "search")
(load! "magit")

;; TODO: buffer searching Ctrl x b should also allow searching by file name that
;; leads to buffer, for duplicate file names like handler.clj
;; TODO: https://www.gnu.org/software/emacs/manual/html_node/semantic/Sticky-Func-Mode.html
;; is what I want to always keep the declaration in view. however doesn't work
;; for all languages, and I wonder how much extra junk I add by directly
;; enabling semantic-mode first to enable it. Play around with it though.
;; TODO: investigate eglot
