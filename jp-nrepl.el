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
(global-set-key (kbd "C-c n d") 'nrepl-current-connection-info)
(global-set-key (kbd "C-c n n") 'nrepl-rotate-connection)
(global-set-key (kbd "C-c n p") 'nrepl-toggle-pretty-printing)
(global-set-key (kbd "C-c n s") 'nrepl-switch-to-repl-buffer)
