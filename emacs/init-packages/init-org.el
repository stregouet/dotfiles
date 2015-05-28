(require 'org)

(defun my-copy-keymap (a-keymap)
  "`a-keymap' is a variable built with a call to `make-sparse-keymap'"
  (loop for key-cmd in (cdr a-keymap)
        for key = (car key-cmd)
        for cmd = (cdr key-cmd)
        collect `(,key . ,cmd)))

(defvar my-org-keymap (make-sparse-keymap))
(setf (cdr my-org-keymap) (my-copy-keymap my-keymap))
(define-prefix-command 'my-org-keymap)
(define-key my-org-keymap "\C-e" 'org-end-of-line)
(define-key org-mode-map "\C-e" 'my-org-keymap)

(setq org-special-ctrl-a/e t)

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

