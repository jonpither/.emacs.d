(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Sort out the $PATH for OSX
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(setq mac-option-modifier 'super)

(global-set-key (kbd "s-3") '(lambda () (interactive) (insert "#")))

;; See http://stackoverflow.com/questions/18856047/emacs-magit-commit-opens-new-emacs-client

(when (eq 'darwin system-type)
      (set-variable 'magit-emacsclient-executable "/usr/local/Cellar/emacs/24.4/bin/emacsclient"))
