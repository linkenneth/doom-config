;;; config/windows.el -*- lexical-binding: t; -*-

;; TODO: want try-save-and-switch-bffer
;; (map! "M-w" #'kill-this-buffer)

;; TODO: want some kind of recover last buffer
(map! :map general-override-mode-map
      :g "M-w" #'bury-buffer
      :g "M-T" #'unbury-buffer
      :g [C-tab] #'next-buffer
      :g [C-S-tab] #'previous-buffer)

(map! :g "M-t" #'projectile-find-file)

;; TODO: better inter-workspace buffer management or one workspace to another
