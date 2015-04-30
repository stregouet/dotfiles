;; define my own keymap on C-e
(defvar my-keymap (make-sparse-keymap))
(define-prefix-command 'my-keymap)
(global-set-key "\C-e" 'my-keymap)
(define-key my-keymap "\C-e" 'end-of-line)


;; mimic vim to insert line below and above
(defun newline-down ()
  (interactive)
  (end-of-line 1)
  (newline-and-indent))
(defun newline-up ()
  (interactive)
  (beginning-of-line 1)
  (newline)
  (previous-line 1)
  (indent-for-tab-command))
(define-key my-keymap "\C-o" 'newline-down)
(define-key my-keymap "o" 'newline-up)



;; backward kill line
(defun backward-kill-line ()
  (interactive)
  (save-excursion
    (set-mark-command nil)
    (beginning-of-line 1)
    (kill-region (point-marker) (mark-marker))))
(global-set-key (kbd "C-c k") 'backward-kill-line)

;; like vim J : join line
(defun kill-and-join-forward (&optional arg)
  (interactive)
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1)
             (kill-line arg))
      (kill-line arg)))
(global-set-key "\C-k" 'kill-and-join-forward)



;; more or less like vim *
(defun search-symbol ()
  (interactive)
  (highlight-regexp (format "\\b%s\\b" (thing-at-point 'symbol))))


;; narrow current region in a new window
(defun clone-and-narrow-region ()
  (interactive)
  (let 	((start (mark))
	 (end (point)))
    (deactivate-mark)
    (let ((buf (clone-indirect-buffer-other-window
		(generate-new-buffer-name (concat (buffer-name) "[indirect]")) 1)))
      (with-current-buffer buf
	(narrow-to-region start end)))))
(global-set-key (kbd "C-x c") 'clone-and-narrow-region)

;; back to indent or beginning of line
(defun back-to-indent-or-beginning ()
  "call back-to-indentation or if point already there call beginning-of-line"
  (interactive)
  (let ((current-point (point)))
      (back-to-indentation)
      (if (= current-point (point))
	  (beginning-of-line))))
(global-set-key "\C-a" 'back-to-indent-or-beginning)

;; select current line
(defun select-current-line ()
  (interactive)
  (beginning-of-line 1)
  (set-mark (point))
  (end-of-line 1))
(global-set-key (kbd "M-,") 'select-current-line)

(defun duplicate-current-region ()
  (interactive)
  (let ((insert-str
         (if (use-region-p)
             (buffer-substring-no-properties (region-beginning) (region-end))
           (buffer-substring-no-properties
             (save-excursion (beginning-of-line 1) (point))
             (save-excursion (end-of-line 1) (point))))))
    (deactivate-mark)
    (end-of-line 1)
    (newline)
    (insert insert-str)))
(define-key my-keymap "d" 'duplicate-current-region)
(define-key my-keymap "\C-d" 'duplicate-current-region)

;; yank current line
(defun yank-current-line ()
  (interactive)
  (kill-ring-save
   (save-excursion (back-to-indentation) (point))
   (save-excursion (end-of-line 1) (point))))
(global-set-key (kbd "C-S-w") 'yank-current-line)

(defun comment-my-dwim ()
  "comment or uncomment region OR current line if there is no active region"
  (interactive)
  (if (use-region-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (progn
      (comment-or-uncomment-region
       (save-excursion (beginning-of-line 1) (point))
       (save-excursion (end-of-line 1) (point)))
      (next-line))))
(global-set-key (kbd "M-m") 'comment-my-dwim)


;; return key
(global-set-key (kbd "RET") 'newline-and-indent)

;; set mark
(define-key my-keymap "\C-t" 'set-mark-command)

;; use ibuffer instead of basic buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; deactivate default shortcut to suspend-frame
(global-set-key (kbd "C-z") nil)


(defun isearch-yank-region ()
  "yank the active region in minibuffer for search"
  (interactive)
  (when (region-active-p)
    (isearch-yank-string
     (buffer-substring-no-properties (region-beginning) (region-end)))
    (deactivate-mark)))
(define-key isearch-mode-map (kbd "C-o") 'isearch-yank-region)


;; ergo mapping
(defun my-mapping-bepo ()
  "define global key mapping for bépo layout"
  (interactive)
  (global-set-key (kbd "C-t") 'backward-char)
  (global-set-key (kbd "M-t") 'backward-word)
  (global-set-key (kbd "C-M-t") 'backward-sexp)  
  (global-set-key (kbd "C-r") 'previous-line)
  (global-set-key (kbd "C-s") 'next-line)
  (global-set-key (kbd "C-n") 'forward-char)
  (global-set-key (kbd "M-n") 'forward-word)
  (global-set-key (kbd "C-M-n") 'forward-sexp)  
  (global-set-key (kbd "C-b") 'transpose-chars)
  (global-set-key (kbd "M-b") 'transpose-words)
  (global-set-key (kbd "C-M-b") 'transpose-sexp)  
  (global-set-key (kbd "C-f") 'isearch-forward)
  (global-set-key (kbd "C-S-f") 'isearch-backward)
  (global-set-key (kbd "C-M-s") 'forward-paragraph)
  (global-set-key (kbd "C-M-r") 'backward-paragraph))


(defun my-mapping-azerty ()
  "define global key mapping for azerty layout"
  (interactive)
  (global-set-key (kbd "C-b") 'backward-char)
  (global-set-key (kbd "M-b") 'backward-word)
  (global-set-key (kbd "C-M-b") 'backward-sexp)  
  (global-set-key (kbd "C-p") 'previous-line)
  (global-set-key (kbd "C-n") 'next-line)
  (global-set-key (kbd "C-f") 'forward-char)
  (global-set-key (kbd "M-f") 'forward-word)
  (global-set-key (kbd "C-M-f") 'forward-sexp)  
  (global-set-key (kbd "C-t") 'transpose-chars)
  (global-set-key (kbd "M-t") 'transpose-words)
  (global-set-key (kbd "C-M-t") 'transpose-sexp)  
  (global-set-key (kbd "C-s") 'isearch-forward)
  (global-set-key (kbd "C-r") 'isearch-backward)
  (global-set-key (kbd "C-M-p") 'forward-paragraph)
  (global-set-key (kbd "C-M-n") 'backward-paragraph))

;; default to bépo mapping
(my-mapping-bepo)

(provide 'my-keybindings)
