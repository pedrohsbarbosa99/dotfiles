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

(setq native-comp-async-report-warnings-errors nil)

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
 '(custom-safe-themes
   '("c9d837f562685309358d8dc7fccb371ed507c0ae19cf3c9ae67875db0c038632" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "088cd6f894494ac3d4ff67b794467c2aa1e3713453805b93a8bcb2d72a0d1b53" "720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" default))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(counsel swiper marginalia exec-path-from-shell elfeed citar markdown-mode vterm-toggle vterm move-text which-key python-isort ruff-format tree-sitter-langs company yasnippet origami flycheck-inline flycheck-eglot flycheck web-mode spaceline projectile neotree magit impatient-mode emojify emmet-mode diff-hl dashboard centaur-tabs catppuccin-theme all-the-icons)))
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
