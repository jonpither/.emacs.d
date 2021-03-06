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

            '("melpa-stable" . "https://stable.melpa.org/packages/") t
            ;;'("melpa" . "http://melpa.milkbox.net/packages/") t
)
(setq package-user-dir (concat user-emacs-directory "elpa"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t
      use-package-verbose t)

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


;; Not ideal to place this here, but I have issues with company-mode
;; and cider initiating nicely together
(global-company-mode)

;; TODO Put this stuff somewhere else

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "-C cider dev")
 '(cider-inject-dependencies-at-jack-in t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(package-selected-packages
   (quote
    (cider terraform-mode projectile exec-path-from-shell magit color-theme-sanityinc-tomorrow js2-mode web-mode restclient feature-mode elisp-slime-nav company markdown-mode list-register rainbow-delimiters smex idle-highlight-mode hl-sexp expand-region browse-kill-ring avy undo-tree noflet flx-ido better-defaults clj-refactor clojure-mode use-package queue peg)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-type . boot-clj)
     (cider-boot-parameters . "cider dev")
     (eval add-hook
           (quote clojure-mode-hook)
           (function cider-mode))
     (cider-boot-parameters . "dev")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
