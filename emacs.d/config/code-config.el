(use-package pyenv-mode
  :ensure t)

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))


(use-package reformatter
  :ensure t
  :config
  (reformatter-define darker-reformat
    :program (concat
              (locate-dominating-file default-directory "venv")
              "venv/bin/darker")
    :args (list input-file "--isort")
    :stdin nil
    :stdout nil))

(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp))
  :commands lsp
  :custom
  (lsp-completion-provider :capf)
  :config
  (setq lsp-enable-symbol-highlighting t
        lsp-headerline-breadcrumb-enable t
        lsp-idle-delay 0.3
        lsp-log-io nil))

(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp)))
  :config
  (setq lsp-pyright-python-executable-cmd "python")
  (lsp-register-custom-settings
   '(("python.analysis.typeCheckingMode" "basic")
     ("pyright.reportOptionalMemberAccess" "none"))))


(setenv "PATH" (concat (getenv "PATH") ":/home/pedro/.nvm/versions/node/v20.13.1/bin"))
(add-to-list 'exec-path "/home/pedro/.nvm/versions/node/v20.13.1/bin")


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


(use-package origami
  :ensure t
  :bind
  ("C-c o o" . origami-toggle-node)
  ("C-c o a" . origami-toggle-all-nodes)
  ("C-c o r" . origami-recursively-toggle-node)
  :config
  (global-origami-mode))

(provide 'code-config)
