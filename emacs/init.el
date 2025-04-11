;; Remover boas vindas
(setq inhibit-startup-message t)


;; Remover menus
(tool-bar-mode -1)
(menu-bar-mode -1)


;; Remover barra de rolagem
(scroll-bar-mode -1)

;; Numeros nas linhas
(global-display-line-numbers-mode 1)

;; Tamanho da fonte
(set-face-attribute  'default nil :height 150)

;; Pacotes
(require 'package)
(setq package-enable-at-startup nil) ; desabilita inicio de pacote

;; MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)



(package-initialize) ; inicia pacotes

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode)
  (progn
    (which-key-setup-side-window-right-bottom)
    (which-key-mode)
  )

)

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
  )
)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  :bind (("C-\\" . 'neotree-toggle)))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))


(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package ergoemacs-mode
  :ensure t
  :config
  (progn
    (setq ergoemacs-theme nil)
    (setq ergoemacs-keyboard-layout "us")
    (ergoemacs-mode 1)
    ))


(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))


(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)


;; Tema
(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t)) ;; esse nome tá errado ainda


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/vscode-dark-plus-emacs-theme")
(load-theme 'vscode-dark-plus t)


;; melpa stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7bcbee7c5eaef0eca0dad6c5ec0ee8f665efd857be421a67be1ce84003d71417" default))
 '(package-selected-packages '(rebecca-theme auto-complete try)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
