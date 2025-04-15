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


(defun my/project-vterm-bottom ()
  "Abre vterm na raiz do projeto atual na parte inferior."
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (split-window-below)  ;; Divide a janela para abrir o terminal abaixo
    (other-window 1)      ;; Muda o foco para a nova janela
    (vterm)))

(defcustom pyenv-mode-mode-line-format nil
  "Format string for displaying pyenv version in mode-line."
  :type '(choice (const :tag "Disabled" nil)
                 (string :tag "Custom Format")))

(defun my/auto-activate-venv ()
  "Ativa automaticamente a venv local se a pasta 'venv' existir em algum diretório ascendente."
  (let* ((root (locate-dominating-file default-directory "venv"))
         (venv-path (when root (expand-file-name "venv" root))))
    (when (and venv-path (file-directory-p venv-path))
      (pyvenv-activate venv-path))))

(defun my/format-on-save ()
  "Formata o código com black e isort ao salvar."
  (add-hook 'before-save-hook #'black-reformat nil t)
  (add-hook 'before-save-hook #'isort-reformat nil t))


(provide 'functions)
