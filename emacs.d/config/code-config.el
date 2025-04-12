(use-package pyvenv
  :ensure t
  :config
  (setenv "WORKON_HOME" "~/.pyenv/versions")
  (pyvenv-mode 1))

(use-package python
  :hook (python-mode . pyvenv-tracking-mode))

(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp))
  :commands lsp
  :custom
  (lsp-completition-provider :capf)
  :config
  (setq lsp-enable-symbol-highlighting t
        lsp-headerline-breadcrumb-enable t
        lsp-idle-delay 0.3
        lsp-log-io nil))

(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :hook (python-mode . (lambda () (require 'lsp-pyright)))
  :config
  (setq lsp-pyright-venv-directory "venv"))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse t
        lsp-ui-sideline-enable nil))

(setq lsp-ui-doc-position 'at-point)
(setq byte-compile-warnings '(not docstrings))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))



(provide 'code-config)
