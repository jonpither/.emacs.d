(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "|" "DONE" "REJECTED" "ONHOLD")))

(require 'org)
(use-package ox-reveal
  :bind (("C-c r" . org-reveal-export-to-html)))
(require 'ox-reveal)

;; Display org todos on start
(setq org-agenda-files '("~/org"))
(add-hook 'after-init-hook 'org-todo-list)

(setq org-lowest-priority ?E)
(setq org-default-priority ?E)
