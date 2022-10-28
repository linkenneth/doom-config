;;; modules/search.el -*- lexical-binding: t; -*-

(after! vertico
  ;; see https://github.com/minad/vertico/blob/main/extensions/vertico-directory.el
  (map! :map vertico-map
        :desc "Enter directory / open file" "RET" #'vertico-directory-enter
        :desc "Delete directory / word before point"
        [s-backspace] #'vertico-directory-delete-word
        :desc "Delete directory / word before point"
        [M-backspace] #'vertico-directory-delete-word))

;; TODO: sometimes SPC s b triggers "Invalid regex, regex too big" or something
;; strange. Unsure why.
