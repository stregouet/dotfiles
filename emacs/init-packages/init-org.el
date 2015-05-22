(require 'org)

;; (defvar my-org-keymap (make-sparse-keymap))
;; (define-prefix-command 'my-org-keymap)
;; (define-key my-org-keymap "\C-e" 'org-end-of-line)
;; (define-key org-mode-map "\C-e" 'my-org-keymap)

(define-key org-mode-map "\C-e" 'my-keymap)

(setq org-directory "~/Org")
;; If an entry is a directory, all files in that directory that are matched by
;; `org-agenda-file-regexp' will be part of the file list.
(setq org-agenda-files '("~/Org"))
;; ignore org file starting with . or _
(setq org-agenda-file-regexp "\\`[^._].*\\.org\\'")
(define-key my-keymap  "\C-c" 'org-capture)

(require 'org-contacts)
(setq org-contacts-files '("~/Org/contacts.org"))

(add-to-list 'org-capture-templates
             '("c" "Contacts" entry (file (concat org-directory "/contacts.org"))
              "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:PHONE:
:ALIAS:
:NICKNAME:
:IGNORE:
:ICON:
:NOTE:
:ADDRESS:
:BIRTHDAY:
:END:"))


(add-to-list 'org-capture-templates
             '("t" "Todo" entry (file+headline (concat org-directory "/gtd.org") "Tasks")
               "* TODO %?\n  %i\n  %a"))
(add-to-list 'org-capture-templates
             '("j" "Journal" entry (file+datetree (concat org-directory "/journal.org"))
               "* %?\nEntered on %U\n  %i\n  %a"))

