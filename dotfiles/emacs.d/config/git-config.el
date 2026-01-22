(require 'package)

(use-package with-editor
  :ensure t)

(use-package magit
  :ensure t)

;; Show diff inline
(use-package diff-hl
  :ensure t)

;; dont put blame on me
(use-package blamer
  :ensure t
  :custom
  (blamer-idle-time 0.5)
  (blamer-min-offset 60)
  (blamer-view 'overlay-right)
  (blamer-max-commit-message-length 30)
  (blamer-author-formatter "🧑‍💻 %s ")
  (blamer-datetime-formatter " ⏳ [%s]")
  (blamer-commit-formatter " 💡 %s")
  :config
  (global-blamer-mode 1))


(provide 'git-config)
