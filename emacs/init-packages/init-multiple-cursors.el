(require 'multiple-cursors)
(global-set-key (kbd "C-c c") 'mc/edit-lines) ;; 1 cursor/line d'une region
(global-set-key (kbd "C-%") 'mc/mark-more-like-this-extended)

(setq mc/mark-more-like-this-extended-keymap (make-sparse-keymap))
(define-key mc/mark-more-like-this-extended-keymap (kbd "C-r") 'mc/mmlte--up)
(define-key mc/mark-more-like-this-extended-keymap (kbd "C-s") 'mc/mmlte--down)
(define-key mc/mark-more-like-this-extended-keymap (kbd "C-t") 'mc/mmlte--left)
(define-key mc/mark-more-like-this-extended-keymap (kbd "C-n") 'mc/mmlte--right)
