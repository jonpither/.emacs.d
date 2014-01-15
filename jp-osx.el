(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Sort out the $PATH for OSX
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq mac-option-modifier 'super)
