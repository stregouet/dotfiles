(require 'notmuch)

(define-key notmuch-tree-mode-map "S"
  (lambda ()
    "mark message as spam"
    (interactive)
    (notmuch-tree-tag (list "+spam" "-unread" "-inbox"))
    (next-line)))

(define-key notmuch-tree-mode-map "D"
  (lambda ()
    "mark message as deleted"
    (interactive)
    (notmuch-tree-tag (list "+deleted" "-unread" "-inbox"))
    (next-line)))

;; use notmuch-tree in notmuch-hello
;; customize saved search
(defun notmuch-hello-widget-search (widget &rest ignore)
  (notmuch-tree (widget-get widget :notmuch-search-terms)))


;; SMTP (credential in ~/.authinfo)
(setq user-full-name "Samuel TRÉGOUËT")
(setq send-mail-function 'smtpmail-send-it)
