;; ------------------------------------------------------------
;; Better dead than smeg.
;;
;; Taking some inspiration from bbatsov's prelude for structure
;; ------------------------------------------------------------

(defvar modules-dir (expand-file-name  "modules" user-emacs-directory))
(defvar personal-dir (expand-file-name  "personal" user-emacs-directory))
(defvar vendor-dir (expand-file-name "vendor" user-emacs-directory))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-user-dir (concat user-emacs-directory "elpa"))

(package-initialize)

(message "Loading modules in %s..." modules-dir)
(mapc 'load (directory-files modules-dir 't "^[^#]*el$"))

(when (file-exists-p personal-dir)
  (message "Loading personal configuration files in %s..." personal-dir)
  (mapc 'load (directory-files personal-dir 't "^[^#]*el$")))

;; TODO make work like prelude, my vendor stuff isn't proper yet
;; Load vendor packages
(when (file-exists-p vendor-dir)
  (dolist (f (directory-files vendor-dir))
    (let ((name (expand-file-name f vendor-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (message "Loading vendor package %s" name)
        (mapc 'load (directory-files name 't "^[^#]*el$"))))))

(require 'jp-mode)
(jp-global-mode 1)

(add-hook 'after-init-hook 'global-company-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-prompt-for-symbol nil)
 '(clojure-defun-indents (quote (do-at testp)))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(org-agenda-files
   (quote
    ("~/dev/rideon/platform/doc/status.org" "~/dev/juxt/contracts/clients/bettercities/frontiercities.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
