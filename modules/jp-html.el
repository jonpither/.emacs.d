
;; would like to learn nxml-mode but it's a bit of a pain
;;(fset 'html-mode 'nxml-mode)

;; web-mode, see http://web-mode.org
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (local-set-key (kbd "RET") 'newline-and-indent)
)
(add-hook 'web-mode-hook  'web-mode-hook)
