(defun extract-project-name-from-dir (project-dir)
  (if (string-match "/[^/]*?/$" project-dir)
      (format "%s"
	      (replace-regexp-in-string
	       "/$" "" (substring project-dir (+ 1 (string-match "/[^/]*?/$" project-dir)))))
    project-dir))

(defun nrepl-connection-namespace ()
  (with-current-buffer (get-buffer (nrepl-current-connection-buffer))
    (format "%s:%s"
	    (extract-project-name-from-dir nrepl-project-dir)
	    nrepl-buffer-ns)))

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
         "Active nrepl connection: %s, %s:%s"
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

(defun nrepl-create-repl-buffer (process)
  "Create a repl buffer for PROCESS."
  (nrepl-init-repl-buffer
   process
   (let ((buf (generate-new-buffer-name
	       (format "*nrepl-%s*"
		       (with-current-buffer
			   (get-buffer (nrepl-current-connection-buffer))
			 (extract-project-name-from-dir nrepl-project-dir))))))
     (pop-to-buffer buf)
     buf)))

(setq nrepl-history-file "~/.emacs.d/nrepl-history")

(nrepl-project-directory-for (nrepl-current-dir))

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
(global-set-key (kbd "C-c n s") 'nrepl-switch-to-relevant-buffer)
