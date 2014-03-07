(defvar mode-line-symbols
  '((clojure-mode . "λ")
    (emacs-lisp-mode . "EL")
    (paredit-mode . " (P)")
    (undo-tree-mode . " U-T")))

(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-symbols
        do (let* ((mode (car cleaner))
                  (mode-str (cdr cleaner))
                  (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
               (setcar old-mode-str mode-str))
             ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

(add-hook 'projectile-mode-hook
          (lambda () (setq projectile-mode-line-lighter " Proj")))
