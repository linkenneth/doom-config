(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval progn
           (add-to-list 'cider-test-defining-forms "defdbtest")
           (add-to-list 'cider-test-defining-forms "defapptest"))
     (eval set
           (make-local-variable 'flycheck-protoc-import-path)
           (add-to-list 'flycheck-protoc-import-path
                        (projectile-project-root)))
     (eval set
           (make-local-variable 'flycheck-protoc-import-path)
           (push
            (projectile-project-root)
            flycheck-protoc-import-path)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
