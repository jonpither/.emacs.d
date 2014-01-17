;; ------------------------------------------------------------
;; Better dead than smeg.
;;
;; Taking some inspiration from bbatsov's prelude for structure
;; ------------------------------------------------------------

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-user-dir (concat user-emacs-directory "elpa"))
(package-initialize)

(defvar modules-dir (expand-file-name  "modules" user-emacs-directory)
  "This directory houses all of the built-in Prelude modules.")

(message "Loading modules in %s..." modules-dir)
(mapc 'load (directory-files modules-dir 't "^[^#].*el$"))
