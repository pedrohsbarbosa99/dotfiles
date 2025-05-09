;; Text Folding
(use-package origami
  :ensure t
  :config
  (global-origami-mode))

;; auto format
;; pipx install darker
(use-package reformatter
  :ensure t
  :config
  (reformatter-define darker-reformat
    :program "~/.local/bin/darker"
    :args (list input-file "--isort")
    :stdin nil
    :stdout nil))


(define-key origami-mode-map (kbd "<backtab>") 'origami-toggle-node)
(define-key origami-mode-map (kbd "C-<iso-lefttab>") 'origami-toggle-all-nodes)
(setopt display-fill-column-indicator-column 88)

; snippets from autocomplete
(use-package yasnippet
  :ensure t)

(yas-global-mode 1)

; company: autocomplete library
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0
	company-minimum-prefix-length 1)
  (global-company-mode t))

; Unmapping keys from the Python mode
(add-hook 'python-mode-hook
          (lambda() (local-unset-key (kbd "C-c C-c"))))
(add-hook 'python-mode-hook
          (lambda() (local-unset-key (kbd "C-c C-s"))))

;; ----------- Syntax checker
(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
   (setq flycheck-check-syntax-automatically '(save new-line)
         flycheck-idle-change-delay 5.0
         flycheck-display-errors-delay 0.9
         flycheck-highlighting-mode 'symbols
         flycheck-indication-mode 'left-fringe
         flycheck-standard-error-navigation t
         flycheck-deferred-syntax-check nil)
   :config
   ;; before install pylint (pipx install pylint)
   ;; before install flake8 (pipx install flake8)
   ;; after install, create config file (pylint --generate-rcfile > ~/.pylintrc)
   (setq flycheck-python-flake8-executable "~/.local/bin/flake8"
         flycheck-python-pylint-executable "~/.local/bin/pylint")
   )

;; Spell
(setq
    ispell-program-name "/usr/bin/hunspell"
    ispell-dictionary "en")

(require 'flyspell)
(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(add-hook 'yaml-mode-hook #'flyspell-prog-mode)
(add-hook 'conf-mode-hook #'flyspell-prog-mode)
(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'toml-mode-hook #'flyspell-prog-mode)
(add-hook 'dockerfile-mode #'flyspell-prog-mode)
(add-hook 'docker-compose-mode #'flyspell-prog-mode)


(use-package flycheck-inline
  :ensure t)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;; it sucks!
;; https://github.com/emacs-lsp/lsp-mode/issues/4679
(setq lsp-copilot-applicable-fn (lambda (&rest _) nil))

(use-package lsp-pyright ;; Python LSP
  :ensure t
  :custom (lsp-pyright-langserver-command "~/.local/bin/pyright")
  :hook
  ((python-ts-mode . (lambda ()
                    (require 'lsp-pyright)
                    (lsp-deferred)))))

;; ----- lsp
(setq lsp-auto-guess-root t)

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :after lsp-mode
  :config
  (setq lsp-ui-doc-mode 1)
  (setq lsp-signature-doc-lines 3)
)


(require 'lsp-diagnostics)
(lsp-diagnostics-flycheck-enable)

;; --- ts
(use-package tree-sitter-langs
  :ensure t)

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; iedit
(use-package iedit
  :ensure t
  :bind (("C->" . iedit-mode)))

(defun my/reset-save-key-after-iedit ()
  (define-key (current-global-map) (kbd "C-s") #'save-buffer))

(add-hook 'iedit-mode-end-hook #'my/reset-save-key-after-iedit)


(provide 'code-config)
