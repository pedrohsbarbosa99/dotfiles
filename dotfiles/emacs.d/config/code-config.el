;; Text Folding
;; (use-package origami :ensure t)

;; (define-key origami-mode-map (kbd "<backtab>") 'origami-toggle-node)
;; (define-key
 ;; origami-mode-map (kbd "C-<iso-lefttab>") 'origami-toggle-all-nodes)

; snippets from autocomplete
(use-package yasnippet :ensure t :init (yas-global-mode 1))

; company: autocomplete library
(use-package
 company
 :ensure t
 :config
 (setq
  company-idle-delay 0
  company-minimum-prefix-length 1)
 (global-company-mode t))



; Unmapping keys from the Python mode
(add-hook
 'python-mode-hook (lambda () (local-unset-key (kbd "C-c C-c"))))
(add-hook
 'python-mode-hook (lambda () (local-unset-key (kbd "C-c C-s"))))



;; --- ts
(use-package tree-sitter-langs :ensure t)

(use-package treesit-auto
  :config
  (global-treesit-auto-mode)
  :ensure t)






;; ------- code format
(use-package ruff-format
  :ensure t
  :hook (python-mode . ruff-format-on-save-mode)
)

(use-package python-isort
  :ensure t
  :hook (python-mode . python-isort-on-save-mode)
)


(provide 'code-config)
