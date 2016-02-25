(use-package projectile
  :config
  (progn)
  (projectile-global-mode)
  (setq projectile-mode-line '(:eval (format " Proj[%s]" (projectile-project-name)))))
