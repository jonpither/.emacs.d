(require 'diminish)

(require 'helm)
(helm-mode 1)
(diminish 'helm-mode)

(require 'helm-ls-git)

(defun helm-all ()
  (interactive)
  (helm :sources '(helm-source-findutils
                   ;;helm-source-recentf
                   helm-source-ls-git
                   helm-source-bookmarks
                   helm-source-buffers-list
                   ;;helm-source-google-suggest
                   ;;helm-source-locate
                   )
        :buffer "*helm all the things*"))

(global-set-key (kbd "s-t") 'helm-all)

(defun helm-clojure-headlines ()
  "Display headlines for the current Clojure file."
  (interactive)
  (helm :sources '(((name . "Clojure Headlines")
                    (volatile)
                    (headline "^[;(]")))))

(defun helm-markdown-headlines ()
  "Display headlines for the current Clojure file."
  (interactive)
  (helm :sources '(((name . "Clojure Headlines")
                    (volatile)
                    (headline "^#")))))

(add-hook 'clojure-mode-hook
          (lambda () (local-set-key (kbd "C-c n h") 'helm-clojure-headlines)))

(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "s-h") 'helm-org-headlines)))

(add-to-list 'auto-mode-alist '("\.txt$" . doc-mode))

(add-hook 'doc-mode-hook
          (lambda () (local-set-key (kbd "C-c n h") 'helm-markdown-headlines)))
