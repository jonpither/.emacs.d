(require 'better-defaults)

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
(require 'flx-ido)
(flx-ido-mode 1)
(setq ido-use-faces nil)
