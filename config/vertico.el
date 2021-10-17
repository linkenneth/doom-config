;;; config/vertico.el -*- lexical-binding: t; -*-

(after! vertico
  ;; See https://github.com/minad/vertico/blob/main/extensions/vertico-directory.el
  (map! :map vertico-map
        :desc "Enter directory / open file" "RET" #'vertico-directory-enter
        :desc "Delete directory / word before point"
        [s-backspace] #'vertico-directory-delete-word
        :desc "Delete directory / word before point"
        [M-backspace] #'vertico-directory-delete-word))

;; TODO: vertico-repeat is nice, but ideally I could search backwards a number
;; of vertico sessions ago. Ideally this would be using the digit prefix system.
