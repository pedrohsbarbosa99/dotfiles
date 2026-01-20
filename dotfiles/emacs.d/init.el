;; load my configuration path
(add-to-list 'load-path "~/.emacs.d/config/")

;; Load my splited configuration
(require 'melpa-config)
(require 'gui-config)
(require 'git-config)
(require 'dashboard-config)
(require 'html-config)
(require 'lsp-config)
(require 'code-config)
(require 'languages)
(require 'functions)
(require 'keys)
(require 'hooks)
(require 'term-config)
(require 'write-config)
(require 'feed-config)

; Pacotes que estou testando
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode 1))
; fim: Pacotes que estou testando

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

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
 '(org-agenda-files nil)
 '(package-selected-packages nil))
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
