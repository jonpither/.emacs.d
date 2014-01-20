(setq frame-title-format "%b")
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq inhibit-splash-screen t)

(custom-set-variables
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))

(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow-night)

;; Font size
(set-face-attribute 'default nil :height 150)

;; Scrolling
(setq scroll-step 1)

;; show time
(setq display-time-24hr-format t)
(display-time)

;; y/n hassle
(fset 'yes-or-no-p 'y-or-n-p)
