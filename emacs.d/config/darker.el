;; Darker formatter


;; implement code format
(defun darker-format ()
  "Formata o arquivo atual com darker e mostra a saída para debug."
  (interactive)
  (when buffer-file-name
    (save-buffer)
    (let* ((cmd (format "darker %s --isort"
                        (shell-quote-argument buffer-file-name)))
           (output-buffer "*darker Output*")
           (exit-code (call-process-shell-command cmd nil output-buffer t)))
      (with-current-buffer output-buffer
        (let ((output (buffer-string)))
          (if (eq exit-code 0)
              (progn
                (message "darker executado com sucesso: %s" output)
                ;; Verifica se darker realmente alterou algo
                (if (not (string-empty-p output))
                    (revert-buffer :ignore-auto :noconfirm)
                  (message "darker não fez alterações no arquivo.")))
            (error "Erro ao rodar darker:\n%s" output)))))))


(defun my-python-darker-hook ()
  (when (and buffer-file-name
             (eq major-mode 'python-mode))
    (darker-format)))

(provide 'darker)
