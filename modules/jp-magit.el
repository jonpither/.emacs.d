;; Taken from magnars - what a dude
;; https://github.com/magnars/.emacs.d/blob/master/setup-magit.el

(use-package magit
  :bind (("C-x g" . magit-status)))

;; ;; Fullscreen magit status
;; (defadvice magit-status (around magit-fullscreen activate)
;;   (window-configuration-to-register :magit-fullscreen)
;;   ad-do-it
;;   (delete-other-windows))

;; ;; Exit fullscreen magit status
;; (defun magit-quit-session ()
;;   "Restores the previous window configuration and kills the magit buffer"
;;   (interactive)
;;   (kill-buffer)
;;   (jump-to-register :magit-fullscreen))

;; (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; ;; Add an extra newline to separate commit message from git commentary

;; (defun magit-commit-mode-init ()
;;   (when (looking-at "\n")
;;     (open-line 1)))

;; (add-hook 'git-commit-mode-hook 'magit-commit-mode-init)

;; ;; close popup when commiting

;; (defadvice git-commit-commit (after delete-window activate)
;;   (delete-window))
