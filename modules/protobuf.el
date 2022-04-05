;;; modules/protobuf.el -*- lexical-binding: t; -*-

(after! protobuf-mode
  (add-hook 'protobuf-mode-hook #'display-line-numbers-mode))
