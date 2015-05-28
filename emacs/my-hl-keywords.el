;; Use to highligt some keywords in these modes.
(setq code-tag-mode-list '(
                          python-mode
                          js-mode
                          c++-mode
                          c-mode
                          cmake-mode
                          conf-mode
                          makefile-mode
                          lisp-mode
                          coffee-mode
                          emacs-lisp-mode))

(defun highlight-warning-keyword (mode)
    "Use font-lock-add-keywords to highlight with a 'warning' way
    some specific keywords based on a regexp and a specific mode"
    (font-lock-add-keywords
      mode
      '(("\\<\\(fixme\\|FIXME\\|HACK\\|XXX\\|TODO\\)" 1 font-lock-warning-face prepend)))
    )

;; Highlight as 'warning' some keywords for a list of modes.
(cl-map 'list (lambda (mode)
             (highlight-warning-keyword mode))
     code-tag-mode-list)

(provide 'my-hl-keywords)
