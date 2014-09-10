;; Switching to ibuffer puts the cursor on the most recent buffer
(defadvice ibuffer (around ibuffer-point-to-most-recent) ()
   "Open ibuffer with cursor pointed to most recent buffer name"
     (let ((recent-buffer-name (buffer-name)))
          ad-do-it
              (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)

