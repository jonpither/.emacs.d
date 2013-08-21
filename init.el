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
(dolist (source '(("melpa" . "http://melpa.milkbox.net/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))

(package-initialize)

(require 'better-defaults)

;; Key Bindings
(global-set-key (kbd "<f11>") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-c C-f") 'rgrep)

(savehist-mode t)

;; http://castyour.net/keep-emacs-pooping-files-about
(setq backup-inhibited 'anyvaluebutnil )

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

;; Paredit
(require 'paredit)
(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'enable-paredit-mode)

;; Markdown mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

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
		"jp-clojure.el"
		"jp-nrepl.el"
                "jp-magit.el"
                "jp-osx.el"))
  (load (concat user-emacs-directory file)))

(setq ispell-program-name "aspell")

(setq ispell-dictionary-alist
      '((nil
	 "[A-Za-z]" "[^A-Za-z]" "[']" nil
	 ("-B" "-d" "english" "--dict-dir"
	  "/Library/Application Support/cocoAspell/aspell6-en-6.0-0")
	 nil iso-8859-1)))

(setq-default markdown-command "pandoc -S -s --self-contained -f markdown -t html5 ")

(add-hook 'markdown-mode-hook 'flyspell-mode)

;; Visual line mode
(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))
