(use-package which-key
  :ensure t
  :config (which-key-mode))


(use-package multiple-cursors
  :ensure t)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "C-_"))
(global-unset-key (kbd "M-a"))
(global-unset-key (kbd "C-e"))
(global-unset-key (kbd "C-y"))
(global-unset-key (kbd "C-<up>"))
(global-unset-key (kbd "C-<down>"))

(global-set-key (kbd "C-<dead-grave>") 'vterm-toggle)
(global-set-key (kbd "C-`") 'vterm-toggle)
(global-set-key (kbd "C-'") 'vterm-toggle)
(global-set-key (kbd "C-S-e") 'eval-buffer)
(global-set-key (kbd "C-y") 'yas-describe-tables)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-l") 'select-line)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'write-file)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-n") 'new-empty-buffer)
(global-set-key (kbd "C-k") (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key (kbd "C-c C-v") 'duplicate-line)
(global-set-key (kbd "C-x C-t") 'projectile-run-vterm)
(global-set-key (kbd "C-S-f") 'projectile-grep)
(global-set-key (kbd "C-e") 'flycheck-list-errors)

(global-set-key (kbd "C-+")
                (lambda ()
                  (interactive)
                  (let ((old-face-attribute (face-attribute 'default :height)))
                    (set-face-attribute 'default nil :height (+ old-face-attribute 5)))))

(global-set-key (kbd "C--")
                (lambda ()
                  (interactive)
                  (let ((old-face-attribute (face-attribute 'default :height)))
                    (set-face-attribute 'default nil :height (- old-face-attribute 5)))))

(global-set-key (kbd "C-c v") #'my/project-vterm-bottom)

(global-set-key (kbd "C-c d") 'make-directory)

(global-set-key (kbd "C-c r") 'rgrep)

(global-set-key (kbd "C-c h") 'hs-hide-block)
(global-set-key (kbd "C-c s") 'hs-show-block)
(global-set-key (kbd "C-c C-h") 'hs-hide-all)
(global-set-key (kbd "C-c C-s") 'hs-show-all)

(provide 'keys)
