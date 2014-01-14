(setq cider-repl-history-file "~/.emacs.d/cider-history")

(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)

;; eldoc
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(global-set-key (kbd "C-c n j") 'cider-jack-in)
(global-set-key (kbd "C-c n c") 'nrepl-close)
(global-set-key (kbd "C-c n q") 'cider-quit)
(global-set-key (kbd "C-c n d") 'cider-current-connection-info)
(global-set-key (kbd "C-c n n") 'cider-rotate-connection)
(global-set-key (kbd "C-c n p") 'cider-toggle-pretty-printing)
(global-set-key (kbd "C-c n s") 'cider-switch-to-repl-buffer)
(global-set-key (kbd "C-c n f") 'cider-load-fn-into-repl-buffer)

(setq cider-switch-to-repl-command 'cider-switch-to-relevant-repl-buffer)
