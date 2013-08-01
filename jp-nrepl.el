;; Pillaged from https://bitbucket.org/DerGuteMoritz/emacs.d

(defun nrepl-connection-namespace ()
  (with-current-buffer (get-buffer (nrepl-current-connection-buffer))
    nrepl-buffer-ns))

(defun nrepl-connection-infos (connection-buffer)
  (with-current-buffer (get-buffer connection-buffer)
    nrepl-endpoint))

(defun nrepl-current-connection-infos ()
  (nrepl-connection-infos (nrepl-current-connection-buffer)))

(defun nrepl-rotate-connection-list (connection-list)
  (append (rest connection-list)
          (list (first connection-list))))

(defun nrepl-connection-msg ()
  (apply #'message
         "Active nrepl connection: Namespace=%s Host=%s Port=%s"
	 (nrepl-connection-namespace)
         (nrepl-current-connection-infos)))

(defun nrepl-switch-to-next-connection ()
  (interactive)
  (setq nrepl-connection-list
        (nrepl-rotate-connection-list nrepl-connection-list))
  (nrepl-connection-msg))

(defun nrepl-show-current-connection ()
  (interactive)
  (nrepl-connection-msg))

(setq nrepl-history-file "~/.emacs.d/nrepl-history")

(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

;; eldoc
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

(global-set-key (kbd "C-c n j") 'nrepl-jack-in)
(global-set-key (kbd "C-c n c") 'nrepl-close)
(global-set-key (kbd "C-c n q") 'nrepl-quit)
(global-set-key (kbd "C-c n d") 'nrepl-show-current-connection)
(global-set-key (kbd "C-c n n") 'nrepl-switch-to-next-connection)
(global-set-key (kbd "C-c n p") 'nrepl-toggle-pretty-printing)
