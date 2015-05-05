(add-to-list 'load-path "~/.dotfiles/emacs")
(add-to-list 'load-path "~/.emacs.d/specific")


(defun my-load-init-packages (dir-name)
  "list directory `dir-name' and apply `load' on each el file"
  (add-to-list 'load-path dir-name)
  (let ((list-abs-el-file (directory-files dir-name nil "el$")))
    (mapcar 'load
            (mapcar 'file-name-base list-abs-el-file))))


(require 'my-keybindings)
(require 'setup-packages)
(require 'my-settings)
(require 'my-hl-keywords)

(my-load-init-packages "~/.dotfiles/emacs/init-packages")

