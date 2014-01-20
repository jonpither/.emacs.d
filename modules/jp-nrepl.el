(setq cider-repl-history-file "~/.emacs.d/cider-history")

(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)

;; eldoc
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(setq cider-switch-to-repl-command 'cider-switch-to-relevant-repl-buffer)

(define-key cider-repl-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
