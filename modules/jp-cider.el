(setq cider-repl-history-file "~/.emacs.d/cider-history")

(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)
(setq nrepl-host "localhost")

;; eldoc
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(define-key cider-repl-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

;; CIDER SPY
(setq cider-spy-auto-refresh t)
(setq cider-spy-hub-endpoint '("localhost" 7771))
(setq cider-spy-hub-alias "Awesomedude")
