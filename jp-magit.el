;; Taken from magnars - what a dude
;; https://github.com/magnars/.emacs.d/blob/master/setup-magit.el

;; Magit colouring, starker
(set-face-background 'magit-item-highlight "#121212")
(set-face-background 'diff-file-header "#121212")
(set-face-foreground 'diff-context "#666666")
(set-face-foreground 'diff-added "#00cc33")
(set-face-foreground 'diff-removed "#ff0000")

;; Fullscreen magit status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

;; Exit fullscreen magit status
(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; Git messenger
(require 'git-messenger)
(global-set-key (kbd "C-x v p") #'git-messenger:popup-message)

(global-set-key (kbd "C-x g") 'magit-status)
