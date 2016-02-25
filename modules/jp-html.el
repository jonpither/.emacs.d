;; would like to learn nxml-mode but it's a bit of a pain
;;(fset 'html-mode 'nxml-mode)

(use-package restclient)

;; web-mode, see http://web-mode.org
(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
         ("\\.mustache\\'" . web-mode))
  :config
  (progn
    (setq web-mode-markup-indent-offset 2)
    (local-set-key (kbd "RET") 'newline-and-indent)))
