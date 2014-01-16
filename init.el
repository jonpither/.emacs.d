;; ----------------------
;; Better dead than smeg.
;; ----------------------

(add-to-list 'load-path user-emacs-directory)

;; Add every subdirectory of ~/.emacs.d/site-lisp to the load path
(dolist
    (project (directory-files (concat user-emacs-directory "site-lisp") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; ELPA
(setq package-user-dir (concat user-emacs-directory "elpa"))
(require 'package)
(dolist (source '(("melpa" . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives source t))

(package-initialize)

(require 'better-defaults)

(setq default-directory "~/")

(savehist-mode t)

;; http://castyour.net/keep-emacs-pooping-files-about
(setq backup-inhibited 'anyvaluebutnil)

;; Refresh buffers when files change
(global-auto-revert-mode t)

;; C-c l/r to restore windows
(winner-mode 1)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; Shows the kill ring
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-'") 'er/expand-region)

;; hl-sexp
(require 'hl-sexp)
(add-hook 'clojure-mode-hook 'hl-sexp-mode)
(add-hook 'lisp-mode-hook 'hl-sexp-mode)
(add-hook 'emacs-lisp-mode-hook 'hl-sexp-mode)

;; highlight symbols
(add-hook 'clojure-mode-hook 'idle-highlight-mode)
(add-hook 'emacs-lisp-mode 'idle-highlight-mode)


;; Js2 mode for JS
(require 'js2-mode)
(setq auto-mode-alist (cons '("\\.js" . js2-mode) auto-mode-alist))

;; Dont like trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(dolist (file '("jp-autocomplete.el"
		"jp-ace-jump-mode.el"
		"jp-erc.el"
		"jp-multiple-cursors.el"
		"jp-html"
		"jp-lnf.el"
                "jp-snippets.el"
		"jp-clojure.el"
		"jp-nrepl.el"
                "jp-magit.el"
                "jp-osx.el"
                "jp-projectile.el"
                "jp-paredit.el"
                "jp-helm.el"
                "jp-text.el"
                "jp-defuns.el"))
  (load (concat user-emacs-directory file)))

;; todo, do what preludes with a modules dir and auto loading
