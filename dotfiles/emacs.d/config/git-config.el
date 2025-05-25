(require 'package)

;; Git extention
(use-package magit
  :ensure t)

;; Find todos
;(use-package magit-todos
;  :after magit
;  :config (magit-todos-mode 1))


;; Show diff inline
(use-package diff-hl
  :ensure t)

;; blamer
(use-package blamer
  :ensure t
  :custom
  (blamer-idle-time 0.5)
  (blamer-min-offset 70)
  (blamer-view 'overlay-right)
  (blamer-max-commit-message-length 50)
  (blamer-author-formatter "🧑‍💻 %s ")
  (blamer-datetime-formatter " ⏳ [%s]")
  (blamer-commit-formatter " 💡 %s")
  :config
  (global-blamer-mode 1))


(provide 'git-config)
