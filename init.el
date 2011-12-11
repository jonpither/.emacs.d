(let* ((my-lisp-dir "~/.emacs.d/")
        (default-directory my-lisp-dir))
  (setq load-path (cons my-lisp-dir load-path))
  (normal-top-level-add-subdirs-to-load-path))

(setq frame-title-format "%b")
(setq mac-option-modifier 'none) 
(setq mac-command-modifier 'meta)
(setq inhibit-splash-screen t)

(menu-bar-mode -1)

; SETS UP PERFECT SIZE ON MY MAC (breaks portability of this file, could use a if switch)
(progn
      (set-frame-height (selected-frame) 53)
      (set-frame-width (selected-frame) 200))

(add-to-list 'load-path "~/.emacs.d/packages/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Coloring
(load-theme 'zenburn)

;; Package manager (ELPA compatible)
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Key Bindings
(global-set-key (kbd "<M-C-left>") 'previous-buffer)
(global-set-key (kbd "<M-C-right>") 'next-buffer)
(windmove-default-keybindings 'meta) ; meta L/R move between windows
;; Copy and paste:
(cua-mode)

;; Minibuffer completion
(ido-mode)
(setq ido-enable-flex-matching t)

;; Autom complete (standard) 
;;(require 'auto-complete)  
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;; Parenthesis
(show-paren-mode)
;;(add-hook 'clojure-mode-hook 'highlight-parentheses-mode)
;;(add-hook 'slime-repl-mode-hook 'highlight-parentheses-mode)
;;(add-hook 'emacs-lisp-mode-hook  'highlight-parentheses-mode)
;;(setq hl-paren-colors
;;      '("orange1" "yellow1" "greenyellow" "green1"
;;        "springgreen1" "cyan1" "slateblue1" "magenta1" "purple"))

;; hook AC into completion-at-point NOT WORKING, need SLIME AC I THINK
;;(defun set-auto-complete-as-completion-at-point-function ()
;;  (setq completion-at-point-functions '(auto-complete)))
;;(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; SHIT ADDED BY COCOA:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("cf4dda59b259ca9c6214a8e9acf84bf5909c6e59" "1f392dc4316da3e648c6dc0f4aad1a87d4be556c" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
