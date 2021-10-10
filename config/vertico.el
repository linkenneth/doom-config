;;; config/vertico.el -*- lexical-binding: t; -*-

;; see https://github.com/minad/vertico/blob/main/extensions/vertico-directory.el
(map! :map vertico-map
      "RET" #'vertico-directory-enter
      [s-backspace] #'vertico-directory-delete-word
      [M-backspace] #'vertico-directory-delete-word)
