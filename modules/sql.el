;;; sql.el -*- lexical-binding: t; -*-

(set-formatter!
  'sqlfluff-postgres
  (concat (getenv "HOME") "/.doom.d/bin/sqlfluff-postgres")
  :modes
  'sql-mode)
