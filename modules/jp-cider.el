(setq cider-repl-history-file "~/.emacs.d/cider-history")

(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)
(setq nrepl-host "localhost")

;; eldoc
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(define-key cider-repl-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

(defcustom cider-known-endpoints nil
  "Specify a custom endpoint."
  :type 'alist
  :group 'cider)

(defun cider-connect-to-known-endpoint ()
  (interactive)
  (let* ((endpoint (split-string
                    (ido-completing-read "Destination: " cider-known-endpoints)))
         (ip-port (split-string (if (= (length endpoint) 1)
                                    (car endpoint) (cadr endpoint)) "\\:")))
    (cider (car ip-port) (string-to-number (cadr ip-port)))))
