(setq nrepl-history-file "~/.emacs.d/cider-history")

(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)

;; eldoc
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(defun write-fn-into-buffer (m)
  (interactive)
  (with-current-buffer (cider-current-repl-buffer)
    (cider-repl--replace-input (format "(%s)" m))))

(defun cider-ido-fns-form (ns)
  "Construct a Clojure form for reading fns using supplied NS."
  (format "(let [fn-pred (fn [[k v]] (and (fn? (.get v)) (not (re-find #\"clojure.\" (str v)))))]
              (sort
                (map (comp name key)
                     (filter fn-pred
                         (concat
                           (ns-interns '%s)
                           (ns-refers '%s))))))" ns ns))

(defun cider-ido-read-fns (ns ido-callback)
  "Perform ido read fns in NS using supplied IDO-CALLBACK."
  ;; Have to be stateful =(
  (setq cider-ido-ns ns)
  (interactive)
  (cider-tooling-eval (cider-ido-fns-form cider-ido-ns)
                      (cider-ido-read-var-handler ido-callback (current-buffer))
                      nrepl-buffer-ns))

(defun cider-load-fn-into-repl-buffer ()
  "Browse functions available in current repl buffer using ido.
Once selected, the name of the fn will appear in the repl buffer in parens
ready to call."
  (interactive)
  (cider-ido-read-fns (cider-current-ns) 'write-fn-into-buffer))

(global-set-key (kbd "C-c n j") 'cider-jack-in)
(global-set-key (kbd "C-c n c") 'cider-close)
(global-set-key (kbd "C-c n q") 'cider-quit)
(global-set-key (kbd "C-c n d") 'cider-current-connection-info)
(global-set-key (kbd "C-c n n") 'cider-rotate-connection)
(global-set-key (kbd "C-c n p") 'cider-toggle-pretty-printing)
(global-set-key (kbd "C-c n s") 'cider-switch-to-repl-buffer)
(global-set-key (kbd "C-c n f") 'cider-load-fn-into-repl-buffer)
