(setq git-commit-mode-map (make-sparse-keymap))


(define-key git-commit-mode-map (kbd "C-c C-c") 'git-commit-commit)
(define-key git-commit-mode-map (kbd "C-c C-k") 'git-commit-abort)
(define-key git-commit-mode-map [remap server-edit]          'git-commit-commit)
(define-key git-commit-mode-map [remap kill-buffer]          'git-commit-abort)
(define-key git-commit-mode-map [remap ido-kill-buffer]      'git-commit-abort)
(define-key git-commit-mode-map [remap iswitchb-kill-buffer] 'git-commit-abort)

