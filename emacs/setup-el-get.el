;; add el-get to load-path
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; download el-get if necessary
(unless (require 'el-get nil t)
  (with-current-buffer
     (url-retrieve-synchronously
      "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
   (goto-char (point-max))
   (eval-print-last-sexp)))

;; directory of code to init el-get packages
(setq el-get-user-package-directory "~/.dotfiles/emacs/init-packages")

;; init package management with elpa (i.e. call init-package.el)
(el-get 'sync 'package)

(require 'el-get-elpa)
;; Build the El-Get copy of the package.el packages if we have not
;; built it before.  Will have to look into updating later ...
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))

(setq el-get-sources
      '((:name slime :type elpa)
	;; overwrite tern recipes in el-get (for npm command)
	(:name tern :build '(("npm" "install" "--production")))
	;; For a better naming of the buffers (that is, not filename.txt<2>!).
	(:name ubiquify :type builtin)
	(:name ibuffer :type builtin)))

(setq my-packages '(color-theme-solarized
		    company
		    anaconda-mode
		    company-anaconda
		    company-tern
		    expand-region
		    multiple-cursors
		    emmet-mode
		    coffee-mode
		    flx-ido
		    hlinum
		    web-beautify
		    flycheck
		    fill-column-indicator
		    mu4e
		    undo-tree
		    smartparens))

(el-get 'sync
	(append (cl-mapcar #'(lambda (recipe) (cl-getf recipe :name))
			   el-get-sources)
		my-packages))

(provide 'setup-el-get)
