;; Clojure mode for ClojureScript
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\.dtm$" . clojure-mode))

;;http://blog.jayfields.com/2013/05/emacs-lisp-font-lock-for-clojures.html?utm_source=dlvr.it&utm_medium=twitter
;; (eval-after-load 'clojure-mode
;;   '(font-lock-add-keywords
;;     'clojure-mode `(("(\\(partial\\)[[:space:]]"
;;                      (0 (progn (compose-region (match-beginning 1)
;;                                                (match-end 1) "Ƥ")
;;                                nil))))))

;; (eval-after-load 'clojure-mode
;;   '(font-lock-add-keywords
;;     'clojure-mode `(("(\\(comp\\)[[:space:]]"
;;                      (0 (progn (compose-region (match-beginning 1)
;;                                                (match-end 1) "∘")
;;                                nil))))))

;; (eval-after-load 'clojure-mode
;;   '(font-lock-add-keywords
;;     'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
;;                      (0 (progn (compose-region (match-beginning 1)
;;                                                (match-end 1) "λ")
;;                                nil))))))

(require 'clojure-mode)

(put-clojure-indent 'render 1)
(put-clojure-indent 'render-state 1)
(put-clojure-indent 'init-state 1)
(put-clojure-indent 'will-mount 1)
(put-clojure-indent 'given 1)
