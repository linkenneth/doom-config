;;; config/windows.el -*- lexical-binding: t; -*-

(map! :map general-override-mode-map
      :desc "Bury buffer" "M-w" #'bury-buffer
      :desc "Unbury buffer" "M-T" #'unbury-buffer
      :desc "Next buffer" [C-tab] #'next-buffer
      :desc "Previous buffer" [C-S-tab] #'previous-buffer)
