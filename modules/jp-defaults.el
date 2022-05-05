;; broken since emacs 28, and probably I don't want a magic, do lots of stuff:
;; (use-package better-defaults)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq default-directory "~/")

;; Save stuff like minibuffer history
(savehist-mode t)

;; http://castyour.net/keep-emacs-pooping-files-about
(setq backup-inhibited 'anyvaluebutnil)

;; Refresh buffers when files change
(global-auto-revert-mode t)

;; C-c l/r to restore windows
(winner-mode 1)

;; flx-ido is a nicer ido interface
(use-package flx-ido
  :init (flx-ido-mode 1)
  :config (setq ido-use-faces nil))

(ido-mode 1)
(ido-everywhere 1)

;; y/n hassle
(fset 'yes-or-no-p 'y-or-n-p)

;; No to weird flickering
(set 'visible-bell nil)
