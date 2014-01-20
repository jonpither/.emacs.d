;; ------------------------------------------------------------
;; Better dead than smeg.
;;
;; Taking some inspiration from bbatsov's prelude for structure
;; ------------------------------------------------------------

(defvar modules-dir (expand-file-name  "modules" user-emacs-directory))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-user-dir (concat user-emacs-directory "elpa"))
(package-initialize)

(message "Loading modules in %s..." modules-dir)
(mapc 'load (directory-files modules-dir 't "^[^#]*el$"))

(require 'jp-mode)
(jp-global-mode 1)
