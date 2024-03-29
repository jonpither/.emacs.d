(setq frame-title-format "%b")
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq inhibit-splash-screen t)

(custom-set-variables
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))

(use-package color-theme-sanityinc-tomorrow
  :config
  (progn
    (color-theme-sanityinc-tomorrow-night)))

;; Font size
(set-face-attribute 'default nil :height 190)

;; Scrolling
(setq scroll-step 1)

;; show time
(setq display-time-24hr-format t)
(display-time)

(setq scroll-conservatively 10000)

(set-face-attribute 'fringe nil :background (face-attribute 'default :background))
(fringe-mode '(4 . 0))

;; Remove mode-line box
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; (set-face-attribute 'hl-sexp-face nil :background "#2b2b2b")
