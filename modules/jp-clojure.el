(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.cljc\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode)
         ("\\.dtm\\'" . clojure-mode))
  :init
  (add-hook 'clojure-mode-hook #'eldoc-mode)
  :config
  (define-clojure-indent
    (render 1)
    (render-state 1)
    (init-state 1)
    (will-mount 1)
    (given 1)))

;; (use-package clj-refactor
;;   :defer t
;;   :ensure t
;;   :diminish clj-refactor-mode
;;   :init (add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1)))
;;   :config
;;   (cljr-add-keybindings-with-prefix "C-c C-o"))

(use-package cider
  :defer 1
  :config
  (setq cider-prompt-for-symbol nil
        cider-repl-history-file "~/.emacs.d/cider-history"
        cider-repl-display-help-banner nil)
  (bind-keys :map cider-repl-mode-map
             ("C-c M-o" . cider-repl-clear-buffer)))
