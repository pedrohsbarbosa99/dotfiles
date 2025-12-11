;; Project organization
(use-package projectile
  :ensure t
  :config
  ;; Keybindings
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

  ;; Enable projectile
  (projectile-mode +1)

  ;; Configurações do projectile
  (setq projectile-project-search-path
        (list (expand-file-name "~/git/")
              (expand-file-name "~/")))

  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq projectile-indexing-method 'alien)
  (setq projectile-use-git-grep t))

;; Register python project w/ pyproject.toml
(projectile-register-project-type 'python-toml '("pyproject.toml")
                                  :project-file "pyproject.toml"
                                  :compile "poetry build"
                                  :test "task test"
                                  :test-prefix "test_"
                                  :test-suffix "_test")

;; Dashboard
(use-package dashboard
  :ensure t
  :init
  (setq dashboard-items '((recents . 5)
                          (projects . 10))
        dashboard-banner-logo-title ""
        dashboard-startup-banner 'logo
        dashboard-set-file-icons t
        dashboard-icon-type 'all-the-icons
        dashboard-heading-icons t
        dashboard-projects-backend 'projectile
        dashboard-set-init-info nil
        dashboard-org-agenda-categories '("Tasks"))
  :config
  (dashboard-setup-startup-hook))

(provide 'dashboard-config)
