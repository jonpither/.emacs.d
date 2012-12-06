(let* ((my-lisp-dir "~/.emacs.d/")
        (default-directory my-lisp-dir))
  (setq load-path (cons my-lisp-dir load-path))
  (normal-top-level-add-subdirs-to-load-path))

;; OSX Path issue - todo find another way
(add-to-list 'exec-path "/usr/local/git/bin/")

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
(load-theme 'zenburn t)

;; Package manager (ELPA compatible)
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Key Bindings
(global-set-key (kbd "<M-C-left>") 'previous-buffer)
(global-set-key (kbd "<M-C-right>") 'next-buffer)
(global-set-key (kbd "<C-f11>") 'clojure-jack-in)
(global-set-key (kbd "<f11>") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-c C-p") 'paredit-mode)
(global-set-key (kbd "C-c C-s") 'magit-status)
(global-set-key "\C-x\C-b" 'buffer-menu)

;; C-c l/r to restore windows
(winner-mode 1)

;; Copy and paste:
(cua-mode)

;; Minibuffer completion
(ido-mode)
(setq ido-enable-flex-matching t)

;; Autom complete (standard)   
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;; Parenthesis
(show-paren-mode)

(global-rainbow-delimiters-mode)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("cf4dda59b259ca9c6214a8e9acf84bf5909c6e59" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
