(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)

(defun install-if-not-installed (package-name)
  (when (not (package-installed-p package-name))
    (package-install package-name)))

(mapcar 'install-if-not-installed
        '(color-theme-solarized
          org-plus-contrib
          git-commit-mode
          systemd
          rust-mode
          stylus-mode
          expand-region
          multiple-cursors
          emmet-mode
          coffee-mode
          flx-ido
          ido-ubiquitous
          hlinum
          web-beautify
          flycheck
          fill-column-indicator
          undo-tree
          smartparens
          ))


(provide 'setup-packages)
