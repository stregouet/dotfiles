;; no splash screen
(setq inhibit-splash-screen t
      initial-scratch-message nil)
;; show matching parenthese
(show-paren-mode 1)
;; bar cursor instead of rectangle
(bar-cursor-mode 1)
;; no ~ file
(setq make-backup-files nil)
;; enable narrow-to-region
(put 'narrow-to-region 'disabled nil)
(setq scroll-step            1
      scroll-conservatively  10000); 0 means always recenter point if it moves off screen
(set-frame-font "Inconsolata 13")
;; replace active region by typing text
(delete-selection-mode 1)
;; hilight current line
(global-hl-line-mode 1)
;; column number in mode line (status bar)
(column-number-mode 1)
;; disable toolbar
(tool-bar-mode -1)
;; a line is 80 char
(setq-default fill-column 80)
;; disable menu bar
(menu-bar-mode -1)
;; disable vcs mode
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; .md is a markdown file
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)
;; do not remove extra highlighting after a search
(setq lazy-highlight-cleanup nil)

(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

;; add line number in specific mode
(cl-map 'list (lambda (mode-hook)
		(add-hook mode-hook 'linum-mode))
	'(js-mode-hook
	  coffee-mode-hook
	  sh-mode-hook
	  python-mode-hook
	  lisp-mode-hook
	  emacs-lisp-mode-hook))

(provide 'my-settings)
