
;; would like to learn nxml-mode but it's a bit of a pain
;;(fset 'html-mode 'nxml-mode)

;; web-mode, see http://web-mode.org
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
