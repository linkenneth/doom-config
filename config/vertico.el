;;; config/vertico.el -*- lexical-binding: t; -*-

(after! vertico
  ;; See https://github.com/minad/vertico/blob/main/extensions/vertico-directory.el
  (map! :map vertico-map
        :desc "Enter directory / open file" "RET" #'vertico-directory-enter
        :desc "Del directory / word before point"
        [s-backspace] #'vertico-directory-delete-word
        :desc "Del directory / word before point"
        [M-backspace] #'vertico-directory-delete-word))
