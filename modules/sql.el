;;; sql.el -*- lexical-binding: t; -*-

;; TODO: sqlfluff is very slow. be on the lookout for either speed improvements
;; or something better
;; TODO: also, sqlfluff has an open issue to support trino dialect. keep an eye
;; out for this and use when available
(set-formatter!
  'sqlfluff-postgres
  (list (concat (getenv "HOME") "/.doom.d/bin/sqlfluff-postgres"))
  :modes
  '(sql-mode))
