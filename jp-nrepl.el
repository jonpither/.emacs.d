(setq nrepl-history-file "~/.emacs.d/nrepl-history")

(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

;; eldoc
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

(defun write-fn-into-buffer (m)
  (interactive)
  (with-current-buffer (nrepl-current-repl-buffer)
    (nrepl-replace-input (format "(%s)" m))))

(defun nrepl-ido-fns-form (ns)
  "Construct a Clojure form for reading fns using supplied NS."
  (format "(let [fn-pred (fn [[k v]] (and (fn? (.get v)) (not (re-find #\"clojure.\" (str v)))))]
              (sort
                (map (comp name key)
                     (filter fn-pred
                         (concat
                           (ns-interns '%s)
                           (ns-refers '%s))))))" ns ns))

(defun nrepl-ido-read-fns (ns ido-callback)
  "Perform ido read fns in NS using supplied IDO-CALLBACK."
  ;; Have to be stateful =(
  (setq nrepl-ido-ns ns)
  (interactive)
  (nrepl-send-string (nrepl-ido-fns-form nrepl-ido-ns)
                     (nrepl-ido-read-var-handler ido-callback (current-buffer))
                     nrepl-buffer-ns
                     (nrepl-current-tooling-session)))

(defun nrepl-load-fn-into-repl-buffer ()
  "Browse functions available in current nREPL buffer using ido.
Once selected, the name of the fn will appear in the repl buffer in parens
ready to call."
  (interactive)
  (nrepl-ido-read-fns (nrepl-current-ns) 'write-fn-into-buffer))

(global-set-key (kbd "C-c n j") 'nrepl-jack-in)
(global-set-key (kbd "C-c n c") 'nrepl-close)
(global-set-key (kbd "C-c n q") 'nrepl-quit)
(global-set-key (kbd "C-c n d") 'nrepl-current-connection-info)
(global-set-key (kbd "C-c n n") 'nrepl-rotate-connection)
(global-set-key (kbd "C-c n p") 'nrepl-toggle-pretty-printing)
(global-set-key (kbd "C-c n s") 'nrepl-switch-to-repl-buffer)
(global-set-key (kbd "C-c n f") 'nrepl-load-fn-into-repl-buffer)
