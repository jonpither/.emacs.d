;; ------------------------------------------------------------
;; Better dead than smeg.
;;
;; Taking some inspiration from bbatsov's prelude for structure
;; ------------------------------------------------------------

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

(defvar modules-dir (expand-file-name  "modules" user-emacs-directory)
  "This directory houses all of the built-in Prelude modules.")

(message "Loading modules in %s..." modules-dir)
(mapc 'load (directory-files modules-dir 't "^[^#].*el$"))
