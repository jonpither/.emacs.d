(defvar jp-mode-map
  (let ((map (make-sparse-keymap)))

    ;; Git Stuff
    (define-key map (kbd "C-x v p") #'git-messenger:popup-message)
    (define-key map (kbd "C-x v f") 'magit-file-log)
    (define-key map (kbd "C-x g") 'magit-status)

    ;; Cider Stuff:
    (define-key map (kbd "C-c n p") 'cider-toggle-pretty-printing)
    (define-key map (kbd "C-c s") 'cider-spy-summary)

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

;;    (define-key map (kbd "RET") 'newline-and-indent)

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
