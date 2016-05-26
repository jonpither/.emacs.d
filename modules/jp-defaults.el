(use-package better-defaults)

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

;; y/n hassle
(fset 'yes-or-no-p 'y-or-n-p)

;; No to weird flickering
(set 'visible-bell nil)
