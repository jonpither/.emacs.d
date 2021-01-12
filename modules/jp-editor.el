;; ----------------------
;; Handy stuff for editing text
;; ----------------------

;; undo-tree
(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

(use-package avy
  :bind
  (("M-g M-g" . avy-goto-line)
   ("C-c SPC" . avy-goto-char)
   ("C-." . avy-goto-char-2)))

;; Shows the kill ring
(use-package browse-kill-ring
  :bind ("M-y" . browse-kill-ring))

;; expand region
(use-package expand-region
  :ensure t
  :bind ("C-'" . er/expand-region))

(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C->" . mc/mark-all-like-this)))

;; (use-package highlight-sexp
;;   :config
;;   (global-hl-sexp-mode))

(use-package idle-highlight-mode
  :config
  (progn
    (add-hook 'clojure-mode-hook 'idle-highlight-mode)
    (add-hook 'emacs-lisp-mode 'idle-highlight-mode)))

;; Dont like trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; save recent files
(use-package recentf
  :config
  (progn
    (setq recentf-max-menu-items 25)
    (global-set-key "\C-x\ \C-r" 'ido-recentf-open)
    (recentf-mode 1)))

(use-package smex
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command)))

;; Paredit
(use-package paredit
  :init
  (add-hook 'lisp-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook 'enable-paredit-mode))

;; They are pretty after all
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; (use-package list-register)

(use-package markdown-mode)

(use-package company
  :ensure t
  :defer t
  :config (global-company-mode))
