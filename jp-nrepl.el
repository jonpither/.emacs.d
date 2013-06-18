(defun nrepl-connection-infos (connection-buffer)
  (with-current-buffer (get-buffer connection-buffer)
    nrepl-endpoint))

(defun nrepl-current-connection-infos ()
  (nrepl-connection-infos (nrepl-current-connection-buffer)))

(defun nrepl-rotate-connection-list (connection-list)
  (append (rest connection-list)
          (list (first connection-list))))

(defun nrepl-show-current-connection ()
  (apply #'message
         "Active nrepl connection: Host=%s Port=%s"
         (nrepl-current-connection-infos)))

(defun nrepl-switch-to-next-connection ()
  (interactive)
  (setq nrepl-connection-list
        (nrepl-rotate-connection-list nrepl-connection-list))
  (nrepl-show-current-connection))

(setq nrepl-history-file "~/.emacs.d/nrepl-history")

(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

;; eldoc
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

(global-set-key (kbd "<C-f11>") 'nrepl-jack-in)
(global-set-key (kbd "<C-f10>") 'nrepl-switch-to-next-connection)
(global-set-key (kbd "C-c C-x n") 'nrepl-switch-to-next-connection)
