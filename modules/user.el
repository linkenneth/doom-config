;;; modules/user.el -*- lexical-binding: t; -*-

(setq user-full-name
      (or (string-trim
           (shell-command-to-string "git config --get user.name"))
          "Kenneth Lin")
      user-mail-address
      (or (string-trim
           (shell-command-to-string "git config --get user.email"))
          "linkenneth@live.com"))
