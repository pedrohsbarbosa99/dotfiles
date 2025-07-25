(defun select-line ()
  (interactive)
  (if (region-active-p)
      (progn
        (forward-line 1)
        (end-of-line))
    (progn
      (end-of-line)
      (set-mark (line-beginning-position)))))


(defun duplicate-line (arg)
  (interactive "*p")
  (setq buffer-undo-list (cons (point) buffer-undo-list))
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion
      (end-of-line)
      (setq eol (point))
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        (while (> count 0)
          (newline)
          (insert line)
          (setq count (1- count)))
        )

      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    )
  (next-line arg))

(defun new-empty-buffer ()
  (interactive)
  (let ((-buf (generate-new-buffer "untitled")))
    (switch-to-buffer -buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))

;; Frontend
(defun my/run-prettier ()
  (when (and (buffer-file-name)
             (executable-find "prettier")
             (member major-mode '(js-mode
                                  js-ts-mode
                                  typescript-mode
                                  typescript-tsx-mode
                                  tsx-ts-mode)))
    (let ((cmd (format "prettier --write %s"
                       (shell-quote-argument (buffer-file-name)))))
      (shell-command cmd)
      (revert-buffer t t t))))

(defun my/setup-prettier-on-save ()
  (add-hook 'before-save-hook #'my/run-prettier nil t))

(defun my-go-format-before-save ()
  (when (derived-mode-p 'go-mode 'go-ts-mode)
    (lsp-format-buffer)))



(provide 'functions)
