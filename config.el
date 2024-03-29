;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;;;;;;;;;;;;
;; General ;;
;;;;;;;;;;;;;

(load! "modules/user")
(load! "modules/os")
(load! "modules/workspace")
(load! "modules/windows")
(load! "modules/editor")

;;;;;;;;;;;;;;;;;;
;; Environments ;;
;;;;;;;;;;;;;;;;;;

(load! "modules/liftoff")

;;;;;;;;;;;;;;;
;; Languages ;;
;;;;;;;;;;;;;;;

(load! "modules/markdown")
(load! "modules/protobuf")
(load! "modules/sql")
(load! "modules/lisp")
(load! "modules/clojure")
(load! "modules/go")
;; TODO: consolidate or split?
(load! "modules/web")
(load! "modules/javascript")
(load! "modules/python")
