;;; config/liftoff.el -*- lexical-binding: t; -*-

;; TODO: /clj root dir seems to have a bunch of symlinks. see if I can not
;; follow symlinks in projectile and other search to speed things up

(defun liftoff-project-p (path)
  (let ((home (getenv "HOME")))
    (member (directory-file-name path)
            (list (concat home "/code/liftoff")
                  (concat home "/src/liftoff")))))
