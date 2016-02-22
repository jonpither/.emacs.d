;; ----------------------
;; Handy stuff for editing text
;; ----------------------

;; undo-tree
(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

;; Shows the kill ring
(use-package browse-kill-ring
  :bind ("M-y" . browse-kill-ring))

;; expand region
(use-package expand-region
  :ensure t
  :bind ("C-'" . er/expand-region))

;; hl-sexp
(require 'hl-sexp)
(add-hook 'clojure-mode-hook 'hl-sexp-mode)
(add-hook 'lisp-mode-hook 'hl-sexp-mode)
(add-hook 'emacs-lisp-mode-hook 'hl-sexp-mode)

;; highlight symbols
(add-hook 'clojure-mode-hook 'idle-highlight-mode)
(add-hook 'emacs-lisp-mode 'idle-highlight-mode)

;; Dont like trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; save recent files
(require 'recentf)
(setq recentf-max-menu-items 25)
(recentf-mode 1)

;; They are pretty after all
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(require 'list-register)
