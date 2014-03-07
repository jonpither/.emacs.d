(defvar jp-mode-map
  (let ((map (make-sparse-keymap)))

    ;; Git Stuff
    (define-key map (kbd "C-x v p") #'git-messenger:popup-message)
    (define-key map (kbd "C-x v f") 'magit-file-log)
    (define-key map (kbd "C-x g") 'magit-status)

    ;; Ace Jump Mode:
    (define-key map (kbd "C-c SPC") 'ace-jump-mode)
    (define-key map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

    ;; Multiple Cursors
    (define-key map (kbd "C->") 'mc/mark-next-like-this)
    (define-key map (kbd "C-<") 'mc/mark-previous-like-this)
    (define-key map (kbd "C-c C-<") 'mc/mark-all-like-this)

    ;; Cider Stuff:
    (define-key map (kbd "C-c n c") 'nrepl-close)
    (define-key map (kbd "C-c n q") 'cider-quit)
    (define-key map (kbd "C-c n n") 'cider-rotate-connection)
    (define-key map (kbd "C-c n p") 'cider-toggle-pretty-printing)
    (define-key map (kbd "C-c n s") 'cider-switch-to-repl-buffer)
    (define-key map (kbd "C-c n f") 'cider-load-fn-into-repl-buffer)
    (define-key map (kbd "C-c n r") 'cider-connect-to-known-endpoint)

    ;; Projectile:
    (define-key map [?\s-p] 'projectile-switch-project)
    (define-key map [?\s-f] 'projectile-find-file)
    (define-key map [?\s-g] 'projectile-grep)

    ;; Funkage
    (define-key map (kbd "s-r") 'prelude-recentf-ido-find-file)
    (define-key map (kbd "s-b") 'clone-indirect-buffer)
    (define-key map (kbd "M-j") (lambda ()
                                  (interactive)
                                  (join-line -1)))

    (define-key map (kbd "C-x r v") 'list-register)

    map)
  "Keymap for JP mode.")

;; define minor mode
(define-minor-mode jp-mode
  "Minor mode to consolidate Emacs JP extensions.

\\{jp-mode-map}"
  :lighter " JP"
  :keymap jp-mode-map)

(define-globalized-minor-mode jp-global-mode jp-mode jp-on)

(defun jp-on ()
  "Turn on `jp-mode'."
  (jp-mode +1))

(defun jp-off ()
  "Turn off `jp-mode'."
  (jp-mode -1))

(provide 'jp-mode)
