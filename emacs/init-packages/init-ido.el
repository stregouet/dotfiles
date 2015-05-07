(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; use ido for help function (C-h f, C-h v... )
(ido-ubiquitous-mode)

(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
;; Display ido results vertically, rather than horizontally
(setq ido-decorations
      (quote ("\n-> "
	      ""
	      "\n   "
	      "\n   ..."
	      "["
	      "]"
	      " [No match]"
	      " [Matched]"
	      " [Not readable]"
	      " [Too big]"
	      " [Confirm]")))

(global-set-key
     "\M-x"
     (lambda ()
       (interactive)
       (call-interactively
        (intern
         (ido-completing-read
          "M-x "
          (all-completions "" obarray 'commandp))))))

; do not change directory automatically with C-x C-f
(setq ido-auto-merge-work-directories-length -1)
