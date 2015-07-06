
(helm-mode 1)
(helm-autoresize-mode 1)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ;; make it works in term mode
(define-key helm-map (kbd "C-z") 'helm-select-action)


