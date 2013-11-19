(eval-after-load "grep"
  '(progn
     ;; Don't recurse into some directories
     (add-to-list 'grep-find-ignored-directories "logs")
     (add-to-list 'grep-find-ignored-directories "target")))
