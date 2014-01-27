(setq cider-repl-history-file "~/.emacs.d/cider-history")

(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)
(setq nrepl-host "localhost")

;; eldoc
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(define-key cider-repl-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

(setq cider-known-endpoints '(("localhost" "127.0.0.1:60611")))

(defun foo ()
  (interactive)
  (let* ((endpoint
          (ido-completing-read "Destination: "
                               (mapcar (lambda (label-endpoint)
                                         (concat (car label-endpoint) " " (cadr label-endpoint)))
                                       cider-known-endpoints)))
         (ip-port (split-string (cadr (split-string endpoint " ")) "\\:")))
    (cider (car ip-port) (string-to-number (cadr ip-port)))))
