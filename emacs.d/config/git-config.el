(require 'package)

;; Git extention
(use-package magit
  :ensure t)

;; Find todos
;(use-package magit-todos
;  :after magit
;  :config (magit-todos-mode 1))

(use-package blamer
  :ensure t
  :custom
  (blamer-idle-time 0.1)                        ;; Show blame after 0.3s idle
  (blamer-min-offset 45)                        ;; Minimum space before blame text
  (blamer-view 'overlay-right)                 ;; Inline blame at end of line
  (blamer-author-formatter "👤 %s ")
  (blamer-datetime-formatter "[%s]")
  (blamer-commit-formatter " ● %s")
  (blamer-pretty-time-p t)
  (blamer-max-commit-message-length 50)
  (blamer-type 'visual)
  :config
  (global-blamer-mode 1))                       ;; Automatically enable everywhere


(provide 'git-config)
