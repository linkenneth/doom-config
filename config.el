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
(map! :g "M-T" #'winner-undo)

;; TODO: something to easily move buffers from one window to another, or one
;; workspace to another

;;;;;;;;;;;;;
;; Vertico ;;
;;;;;;;;;;;;;

;; see https://github.com/minad/vertico/blob/main/extensions/vertico-directory.el

;; RET enters the directory or extends
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

;; zoom in once
(doom/increase-font-size 1)

;; TODO: search online seems broken, depends on ivy / counsel
;; TODO: see if I can improve tab / enter situation with Vertico

(map! :gi [s-backspace] #'backward-kill-word)

;;;;;;;;;;
;; Evil ;;
;;;;;;;;;;

;; maps evil-surround from S -> s and gS -> S. This overrides evil-snipe in
;; visual mode, which uses s.
(map! :map evil-surround-mode-map
      :v "s" #'evil-surround-region
      :v "S" #'evil-Surround-region)

;; TODO: ex commands not working?

;;;;;;;;;;;
;; Magit ;;
;;;;;;;;;;;

;; TODO: forge doesn't seem to work for most things

;;;;;;;;;;;;;;;;;;;;;;;;
;; Lispy / Lispyville ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! lispy
  :config
  ;; TODO: for now, completely disable lispy keybindings until I get used to
  ;; this environment first. Also "y" doesn't seem to work with the default
  ;; bindings...
  (lispy-set-key-theme '())
  )

(use-package! lispyville
  :init
  (setq lispyville-key-theme
        '((operators normal)
          c-w
          (prettify insert)
          (atom-movement t)
          slurp/barf-lispy
          additional
          additional-insert
          additional-wrap))
  :config
  ;; allow j-k as ESC again
  (remove-hook! 'evil-escape-inhibit-functions
    #'+lispy-inhibit-evil-escape-fn))

;; TODO: running code sometimes breaks? (map-into) bug
;; TODO: install eastwood / kibit
;; TODO: custom liftoff cljfmt on save

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language Server Protocol ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: try it out but maybe disable lsp-imenu-mode
