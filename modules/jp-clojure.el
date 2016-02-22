(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.dtm\\'" . clojure-mode))
  :init
  (add-hook 'clojure-mode-hook #'eldoc-mode)
  :config
  (put-clojure-indent 'render 1)
  (put-clojure-indent 'render-state 1)
  (put-clojure-indent 'init-state 1)
  (put-clojure-indent 'will-mount 1)
  (put-clojure-indent 'given 1))

(use-package cider
  :defer 1
  :config
  (setq cider-prompt-for-symbol nil
        cider-repl-history-file "~/.emacs.d/cider-history")
  (bind-keys :map cider-repl-mode-map
             ("C-c M-o" . cider-repl-clear-buffer)))

(use-package clj-refactor
  :defer t
  :ensure t
  :diminish clj-refactor-mode
  :config (cljr-add-keybindings-with-prefix "C-c C-o"))

