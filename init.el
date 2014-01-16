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

(dolist (file '("jp-defaults.el"
                "jp-editor.el"
                "jp-js.el"
                "jp-autocomplete.el"
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
