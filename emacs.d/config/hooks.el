;; hooks
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)

;; Markdown
(add-hook 'markdown-mode-hook #'nb/markdown-unhighlight)

(add-hook 'after-init-hook #'global-emojify-mode)
;; (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook #'origami-mode)

(add-hook 'text-mode-hook 'display-line-numbers-mode)
; install hunspell-pt-br on aur
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'hl-line-mode)

(add-hook 'python-mode-hook
     '(lambda () (define-key python-mode-map (kbd "C-c C-v") 'duplicate-line)))
(add-hook 'python-mode-hook
	  '(lambda () (define-key python-mode-map (kbd "C-/") 'comment-line)))
(add-hook 'python-mode-hook '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))

(add-hook 'python-mode-hook 'hs-minor-mode)

(add-hook 'pyvenv-post-activate-hooks
          (lambda ()
            (setq lsp-pyright-python-executable-cmd (concat pyvenv-virtual-env "/bin/python"))
            (when (bound-and-true-p lsp-mode)
              (lsp-restart-workspace))))

(add-hook 'python-mode-hook #'darker-reformat-on-save-mode)

;; rust hooks
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(provide 'hooks)
