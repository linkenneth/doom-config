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
(map! :g
      "M-w" #'bury-buffer
      "M-t" #'projectile-find-file
      "M-T" #'unbury-buffer)

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

;; open in full-screen by default
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; zoom in a bit
(doom/increase-font-size 1)

;; TODO: search online seems broken, depends on ivy / counsel

(map! :gi [s-backspace] #'backward-kill-word)

;;;;;;;;;;
;; Evil ;;
;;;;;;;;;;

;; maps evil-surround from S -> s and gS -> S. This overrides evil-snipe in
;; visual mode, which uses s.
(map! :map evil-surround-mode-map
      :v "s" #'evil-surround-region
      :v "S" #'evil-Surround-region)

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
  (remove-hook! 'lispy-mode-hook #'turn-off-smartparens-mode)
  ;; unset `transpose-sexps' because it's not useful compared to
  ;; `lispyville-drag-forward' and `lispyville-drag-backward', and collides with
  ;; Atom shortcuts to find file in project
  (map! :map lispyville-mode-map
        :n "M-t" nil)
  )

(use-package! lispyville
  (setq lispyville-key-theme
        '((operators normal)
          c-w
          (prettify insert)
          (atom-movement t)
          slurp/barf-lispy
          additional
          additional-insert
          additional-wrap))
  :init
  :config
  ;; allow j-k as ESC again
  (remove-hook! 'evil-escape-inhibit-functions
    #'+lispy-inhibit-evil-escape-fn))

;;;;;;;;;;;;;
;; Clojure ;;
;;;;;;;;;;;;;

;; TODO: see if I can get it working... known issue that no one has figured
;; out for 4 years...
;; squiggly-clojure -- eastwood, core.typed, and kibit linters that work
;; through cider
;; (use-package! flycheck-clojure
;;   :when (featurep! :checkers syntax)
;;   :after flycheck
;;   :config (add-hook! 'cider-connected-hook #'flycheck-clojure-setup))

;; TODO: custom liftoff cljfmt on save
;; TODO: try out running LSP server when first opening clojure file?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language Server Protocol ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: try it out but maybe disable lsp-imenu-mode
;; TODO: go linting, goimports building etc.
