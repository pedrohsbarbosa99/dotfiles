; -------------------------------
;; JavaScript / React / TypeScript Setup
;; -------------------------------

;; Web-mode para arquivos .js, .jsx, .ts, .tsx
(use-package web-mode
  :ensure t
)

(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))

(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 4))

(add-hook 'web-mode-hook  'web-mode-init-hook)

(provide 'js-config)
