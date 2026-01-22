(use-package eglot
  :ensure t
  :defer t
  :hook ((python-mode . eglot-ensure)
         (python-ts-mode . eglot-ensure)
         (markdown-mode . eglot-ensure)
         (python-mode . (lambda () (set-fill-column 88)))
         (python-ts-mode . (lambda () (set-fill-column 88))))
  :config
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode) . ("rass" "python")))
  (add-to-list 'eglot-server-programs
               '(markdown-mode . ("rass" "markdown")))
  (setq-default
   eglot-workspace-configuration
   '(:ltex
     (:language "pt-BR"
      :additionalRules (:enablePickyRules t
                        :motherTongue "pt-BR")
      :disabledRules (:pt-BR ["PT_SMART_QUOTES" "ELLIPSIS"])
      :completionEnabled t))))


(use-package
 flycheck
 :ensure t
 :diminish flycheck-mode
 :init
 (setq
  flycheck-check-syntax-automatically '(save new-line)
  flycheck-idle-change-delay 5.0
  flycheck-display-errors-delay 0.9
  flycheck-highlighting-mode 'symbols
  flycheck-indication-mode 'left-fringe
  flycheck-standard-error-navigation t
  flycheck-deferred-syntax-check nil)
)

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

(use-package flycheck-inline :ensure t)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

(provide 'lsp-config)
