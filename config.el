;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Kenneth Lin"
      user-mail-address "klin@liftoff.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

;;;;;;;;;;;;;;;
;; Workspace ;;
;;;;;;;;;;;;;;;

(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-strip-common-suffix t)

;;;;;;;;;;;;;;;;;;;;;;;
;; Window Management ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: want try-save-and-switch-bffer
;; (map! "M-w" #'kill-this-buffer)

;; TODO: want some kind of recover last buffer
(map! :map general-override-mode-map
      :g "M-w" #'bury-buffer
      :g "M-T" #'unbury-buffer
      :g [C-tab] #'next-buffer
      :g [C-S-tab] #'previous-buffer)

(map! :g "M-t" #'projectile-find-file)

;; TODO: better inter-workspace buffer management or one workspace to another
;;;;;;;;;;;;;
;; Vertico ;;
;;;;;;;;;;;;;

;; see https://github.com/minad/vertico/blob/main/extensions/vertico-directory.el
(map! :map vertico-map
      "RET" #'vertico-directory-enter
      [s-backspace] #'vertico-directory-delete-word
      [M-backspace] #'vertico-directory-delete-word)

;;;;;;;;;;
;; OS X ;;
;;;;;;;;;;

;; command is M, option is S
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;;;;;;;;;;;;
;; Editor ;;
;;;;;;;;;;;;

;; TODO: split these into files (assuming it doesn't affect load time, which I
;; guess I don't care too much about) and add :desc to keymappings

;; TODO: better way to search for full path in project
;; - better way to click-open file path in emacs (from terminal, for example)
;; - open unknown files by default in emacs

;; open in full-screen by default
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; font settings
(setq doom-font (font-spec :family "Monaco" :size 16)
      doom-variable-pitch-font (font-spec :family "Monaco")
      doom-unicode-font (font-spec :family "Monaco" :size 16)
      doom-big-font (font-spec :family "Monaco" :size 24))

;; TODO: search online seems broken, depends on ivy / counsel

;; TODO: /clj root dir seems to have a bunch of symlinks. see if I can not
;; follow symlinks in projectile and other search to speed things up
;; TODO: no need to search .go code from clj. Find ways to limit files
;; TODO: search up projectile search backend and see what settings they use.
;; - could ignore git files

(map! :gi [s-backspace] #'backward-kill-word)

;; TODO:
;; - M-RET, C-RET

;; TODO:
;; - better support for pasting filepath and going to it (C-y does yank
;; from kill ring, and also it doesn't seem to find the last pasted path?)

;; TODO:
;; - better way to read files > 80 chars, and also maybe put a 80 char line?

;;;;;;;;;;
;; Evil ;;
;;;;;;;;;;

;; maps evil-surround from S -> s and gS -> S. This overrides evil-snipe in
;; visual mode, which uses s.
(use-package! evil-escape
  :init
  ;; also allows "kj" to escape
  (setq evil-escape-unordered-key-sequence t))

(map! :map evil-surround-mode-map
      :v "s" #'evil-surround-region
      :v "S" #'evil-Surround-region)

;; unmaps `aya-expand' and `aya-create' which I'll never use
(map! :i [C-tab] nil
      :nv [C-tab] nil
      :g "M-/" #'comment-dwim)

;; TODO: comment-dwim on line isn't what I want. remap comment operator or
;; something to this?

;; TODO: evil-mode visual mode is quite slow for some reason.
;; multi-cursor is even slower. the only thing that's usable is ex-mode replace.
;; - find way to speed this up?
;;
;; TODO: an exercise: how can I run macros through ex mode? Tried it and didn't
;; seem to work.
;;
;; TODO: exercise: try to evaluate either elisp or clojure easily inline
;; TODO: exercise: try to run M-x commands with g/ matches

;;;;;;;;;;;
;; Magit ;;
;;;;;;;;;;;

;; removes binding that conflicts with `bury-buffer'
(map! :map magit-mode-map
      :g "M-w" nil)

;; TODO: add +vc/browse-line-at-remote / +vc/browse-line-at-remote-kill
;; for easier linking of code

;; TODO: [ g or something to find next merge conflict?

;;;;;;;;;;;;;;;;;;;;;;;;
;; Lispy / Lispyville ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! lispy
  :config
  ;; TODO: for now, completely disable lispy keybindings until I get used to
  ;; this environment first. Also "y" doesn't seem to work with the default
  ;; bindings...
  (lispy-set-key-theme '())
  ;; since we're not using lispy keybindings, don't disable smartparens mode
  (remove-hook! 'lispy-mode-hook #'turn-off-smartparens-mode))

(use-package! lispyville
  :init
  (setq lispyville-key-theme
        '((operators normal)
          c-w
          (atom-movement t)
          slurp/barf-cp
          additional
          additional-insert
          additional-wrap))
  :config
  ;; allow "jk" as ESC again
  (remove-hook! 'evil-escape-inhibit-functions #'+lispy-inhibit-evil-escape-fn)
  ;; unset `transpose-sexps' because it's not useful compared to
  ;; `lispyville-drag-forward' and `lispyville-drag-backward', and collides with
  ;; Atom shortcuts to find file in project
  (map! :map lispyville-mode-map
        :n "M-t" nil))

;; TODO: use lispyville to safe comment lines (lispyville-comment-or-uncomment)
;; TODO: remap ( and ) to parenthesis in lisp modes (and maybe consider in
;; non-lisp modes)
;; TODO: map the always-left-parenthesis slurp / barf movements to something
;; TODO: learn better regexps for working with lisp atoms (see lispyville atom
;; text object def)

;;;;;;;;;;;;;
;; Clojure ;;
;;;;;;;;;;;;;

;; TODO: see if I can get it working... known issue that no one has figured
;; out for 4 years...
;; squiggly-clojure -- eastwood, core.typed, and kibit linters that work
;; through cider
;; (use-package! flycheck-clojure
;;   :hook (cider-connected-hook flycheck-clojure-setup)
;;   :when (featurep! :checkers syntax)
;;   :after flycheck
;;   :config (add-hook! 'cider-connected-hook #'flycheck-clojure-setup))

;; TODO: custom liftoff cljfmt on save. exp/emacs has a file for this (may be outdated)
;; - SPC c f does format region / buffer. see if there's a way to integrate with
;; that correctly
;; TODO: try out running LSP server when first opening clojure file?

;; (add-hook! 'clojure-mode-hook #'format-all-mode)
;; TODO: emacs quite laggy and slow for large codebases... maybe figure out why

;; TODO:
;; - SPC s i (jump to symbol) could use some Marginalia annotations, like
;; docstring if available etc., in clojure mode. or just add the defun line to it
;; like in Go

;; TODO:
;; - cider toggle trace var and ns bindings

;; TODO:
;; - next line function indent seems to be 2 spaces, not 1

;; TODO:
;; - commands do dash-case, underscorize, camel-case, and pascal case

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language Server Protocol ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: try it out but maybe disable lsp-imenu-mode
;; TODO: go linting, goimports building etc.
