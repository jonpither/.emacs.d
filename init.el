;; ----------------------
;; Better dead than smeg.
;; ----------------------


;; Add .emacs.d to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;; Add every subdirectory of ~/.emacs.d/site-lisp to the load path
(dolist
    (project (directory-files (concat dotfiles-dir "site-lisp") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; ELPA
(setq package-user-dir (concat dotfiles-dir "elpa"))
(require 'package)
(dolist (source '(("melpa" . "http://melpa.milkbox.net/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

;; Sort out the $PATH for OSX
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Key Bindings
(global-set-key (kbd "<f11>") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key "\C-x\C-b" 'buffer-menu)
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

;; Minibuffer completion
(ido-mode)
(setq ido-enable-flex-matching t)

;; Parenthesis
(show-paren-mode)
;;(global-rainbow-delimiters-mode)

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

;; Clojure mode for ClojureScript
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\.dtm$" . clojure-mode))

;;http://blog.jayfields.com/2013/05/emacs-lisp-font-lock-for-clojures.html?utm_source=dlvr.it&utm_medium=twitter
(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(partial\\)[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "Ƥ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(comp\\)[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∘")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

;; Dont like trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(dolist (file '("jp-autocomplete.el"
		"jp-ace-jump-mode.el"
		"jp-erc.el"
		"jp-multiple-cursors.el"
		"jp-html"
		"jp-lnf.el"
		"jp-nrepl.el"))
  (load (concat dotfiles-dir file)))

 (setq ispell-program-name "aspell")

(setq ispell-dictionary-alist
      '((nil
	 "[A-Za-z]" "[^A-Za-z]" "[']" nil
	 ("-B" "-d" "english" "--dict-dir"
	  "/Library/Application Support/cocoAspell/aspell6-en-6.0-0")
	 nil iso-8859-1)))

;; Project specific hack for now (REMOVE IF YOU'RE PILLAGING THIS CONFIG)
(setenv "CLJ_FE_ZK_ROOT" "clj-fe-jon")

(visual-line-mode)
