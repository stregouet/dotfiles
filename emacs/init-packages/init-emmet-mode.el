(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(setq emmet-move-cursor-between-quotes t) ;; default nil
(setq emmet-indentation 2)

;; special func to navigate in emmet
(defun min2 (a b)
  "return min of a and b, but if one of them is nil return the other one"
  (if (not a) b
    (if (not b) a
      (min a b))))
(defun max2 (a b)
  "return max of a and b, but if one of them is nil return the other one"
  (if (not a) b
    (if (not b) a
      (max a b))))

(defun next-edit-point ()
  (interactive)
  (let (result
	(possible-points ())
	(pos3 (save-excursion (re-search-forward "^\\s-*$" nil t)))
	(pos1 (save-excursion (re-search-forward "><\\/" nil t)))
	(pos2 (save-excursion (re-search-forward "\"\"" nil t))))
    (if pos1
	(push (- pos1 2) possible-points)
      (push pos1 possible-points))
    (if pos2
	(push (- pos2 1) possible-points)
      (push pos2 possible-points))
    (if pos3
	(if (not (= (point) pos3))
	    (push pos3 possible-points)))
    (setq result (cl-reduce 'min2 possible-points))
    (if result
	(goto-char result))))

(defun previous-edit-point ()
  (interactive)
  (let (result
	(possible-points ())
	(pos3 (save-excursion (re-search-backward "^\\s-*$" nil t)))
	(pos1 (save-excursion (re-search-backward "><\\/" nil t)))
	(pos2 (save-excursion (re-search-backward "\"\"" nil t))))
    (if pos1
	(push (+ pos1 1) possible-points)
      (push pos1 possible-points))
    (if pos2
	(push (+ pos2 1) possible-points)
      (push pos2 possible-points))
    (if pos3
	(if (not (= (point) pos3))
	    (push pos3 possible-points)))
    (setq result (cl-reduce 'max2 possible-points))
    (if result
 	(goto-char result))))

;; XXX not sure eval-after-load is necessary with el-get
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil))
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-<return>") nil))
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-x RET") 'emmet-expand-line))
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-»") 'next-edit-point))
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-«") 'previous-edit-point))
