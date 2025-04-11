;; load my configuration path
(add-to-list 'load-path "~/.emacs.d/config/")

;; Load my splited configuration
(require 'melpa-config)
(require 'gui-config)
(require 'git-config)
(require 'dashboard-config)
(require 'markdown-config)
(require 'html-config)
(require 'code-config)
(require 'languages)
(require 'functions)
(require 'keys)
(require 'hooks)
(require 'term-config)



(defun my/python-auto-venv ()
  "Auto-activate .venv in project root."
  (let ((venv-path (locate-dominating-file default-directory "venv")))
    (when venv-path
      (pyvenv-activate (expand-file-name "venv" venv-path)))))

(add-hook 'python-mode-hook #'my/python-auto-venv)

(use-package move-text
  :ensure t
  :config
  (progn
    (global-set-key (kbd "C-<up>") 'move-text-up)
    (global-set-key (kbd "C-<down>") 'move-text-down)))

;; Ivy
(use-package swiper
  :ensure t
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t
           enable-recursive-minibuffers t)
    (global-set-key "\C-f" 'swiper)))


(use-package counsel
  :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(pyvenv ergoemacs-mode counsel swiper move-text vterm-toggle vterm which-key toml-mode lsp-ui lsp-pyright flycheck-inline flycheck company yasnippet origami impatient-mode simple-httpd emmet-mode web-mode markdown-mode dashboard projectile diff-hl magit emojify centaur-tabs neotree spaceline catppuccin-theme all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.8 :foreground "#A3BE8C" :weight extra-bold))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4 :foreground "#EBCB8B" :weight extra-bold))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.2 :foreground "#D08770" :weight extra-bold))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.15 :foreground "#BF616A" :weight extra-bold))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.11 :foreground "#b48ead" :weight extra-bold))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.06 :foreground "#5e81ac" :weight extra-bold)))))
