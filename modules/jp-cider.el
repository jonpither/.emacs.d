(setq cider-repl-history-file "~/.emacs.d/cider-history")

;;(setq cider-popup-stacktraces nil)
;;(setq cider-repl-popup-stacktraces t)

(setq nrepl-host "localhost")

(setq cider-prompt-for-symbol nil)

;; eldoc
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; (define-key cider-repl-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

;; CIDER SPY
;;(setq cider-spy-hub-alias "Bruce")
