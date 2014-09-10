(require 'color-theme)
(require 'color-theme-solarized)
(load-theme 'solarized-dark 1)

(defun setup-frame-theme (&rest frame)
  (let  ((color-theme-is-global nil)
	 (f (if (car frame) (car frame) (selected-frame))))
    (when (eq (framep f) 'x)
      (select-frame f)
      (set-frame-font "Inconsolata 14")
      (color-theme-solarized-dark))))

;; setup color
(defun setup-window-system-frame-colours (&rest frame)
  (let ((color-theme-is-global nil)
	(f (if (car frame) (car frame) (selected-frame))))
    (when (eq (framep f) 'x)
      (select-frame f)
      (message "create frame in x mode")
      (set-frame-font "Inconsolata 14")
      (loop for face in (first (solarized-color-definitions 'dark))
	    ;; face is like this
	    ;; (cursor ((t (:foreground "#002b36" :background "#839496"))))
	    do (let* ((face-name (car face))
		      (face-prop (cadaar (cdr face)))
		      (face-back (getf face-prop :background))
		      (face-fore (getf face-prop :foreground))
		      (frame (selected-frame)))
		 (when face-back
		   (set-face-background face-name face-back f))
		 (when face-fore
		   (set-face-foreground face-name face-fore f)))))
    (setup-company-color)))

;; cette partie ne semble pas indispensable
;; (require 'server)
;; (defadvice server-create-window-system-frame
;;     (after set-window-system-frame-colours ())
;;   "Set custom frame colours when creating the first frame on a display"
;;   (message "Running after frame-initialize")
;;   (setup-window-system-frame-colours))
;; (ad-activate 'server-create-window-system-frame)

;; pour chaque création de frame la fonction `setup-window-system-fram-colours' sera appelée
(add-hook 'after-make-frame-functions 'setup-window-system-frame-colours t)
;; (add-hook 'after-make-frame-functions 'setup-frame-theme t)

