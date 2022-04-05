;;; javascript.el -*- lexical-binding: t; -*-

;; TODO: flycheck is a bit wonky. a variety of linters exist but different files
;; (.js, .jsx, .ts, .tsx) run different linters by default. Try to standardize
;; and always run javascript-eslint as well if it makes sense

;; TODO: M-/ and M-; commenting by itself without selection in JSX doesn't seem
;; to generate a comment and put me in it. Slightly annoying

;; TODO: there's a bug in web-mode where regex character classes containing
;; literal / is not properly highlighted

;; TODO: if % could match closing tag in JSX, and if % could match closing
;; angle brackets on tags, that would be great

;; TODO: tsx mode seems to have 4 space indent for some reason. this below
;; doesn't seem to fix it
(setq-default typescript-indent-level 2)

;; TODO: json-mode, SPC c f should do same thing as SPC m f. need to set a
;; default formatter
