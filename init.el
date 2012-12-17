(let* ((my-lisp-dir "~/.emacs.d/")
        (default-directory my-lisp-dir))
  (setq load-path (cons my-lisp-dir load-path))
  (normal-top-level-add-subdirs-to-load-path))

;; OSX Path issue - todo find another way
;;(add-to-list 'exec-path "/usr/local/git/bin/")

(setq frame-title-format "%b")
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq inhibit-splash-screen t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/packages/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Coloring
(require 'color-theme)
(require 'color-theme-zenburn)
(color-theme-zenburn)

;; solarized if you wish..
;;(require 'color-theme-sanityinc-solarized)
;;(color-theme-sanityinc-solarized-light)
;;(color-theme-sanityinc-solarized-dark)

;; Package manager (ELPA compatible)
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Key Bindings
(global-set-key (kbd "<C-f11>") 'nrepl-jack-in)
(global-set-key (kbd "<f11>") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-c C-s") 'magit-status)
(global-set-key "\C-x\C-b" 'buffer-menu)

;; rgrep key binding
(global-set-key (kbd "C-c C-f") 'rgrep)

;; C-c l/r to restore windows
(winner-mode 1)

;; Copy and paste:
(cua-mode)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-'") 'er/expand-region)

;; Minibuffer completion
(ido-mode)
(setq ido-enable-flex-matching t)

;; ace jump mode major function
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; ace jump mode - jump back
(autoload 'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; Auto complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-auto-show-menu t) ;; Always show menu
(setq ac-dwim t) ;; Makes tab behave as you'd expect
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 60)

;; ac-slime
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

;; Parenthesis
(show-paren-mode)
(global-rainbow-delimiters-mode)

;; hl-sexp
(require 'hl-sexp)

(add-hook 'clojure-mode-hook 'hl-sexp-mode)
(add-hook 'lisp-mode-hook 'hl-sexp-mode)
(add-hook 'emacs-lisp-mode-hook 'hl-sexp-mode)

;; highlight symbols
(add-hook 'clojure-mode-hook 'idle-highlight-mode)
(add-hook 'emacs-lisp-mode 'idle-highlight-mode)

;; Paredit
(require 'paredit)
(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'enable-paredit-mode)
(add-hook 'slime-mode-hook 'set-up-slime-ac)

;; Markdown mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; Clojure mode for ClojureScript
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;; show time
(setq display-time-24hr-format t)
(setq display-time-load-average t)
(display-time)

;; y/n hassle
(fset 'yes-or-no-p 'y-or-n-p)

;; Dont like trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'slime-connected-hook 'init-klondike-repl)
