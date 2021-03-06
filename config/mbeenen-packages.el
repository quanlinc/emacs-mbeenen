(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(defvar mbeenen-packages
  '(
    auto-complete
    color-theme
    ctags
    dash
    dired-single
    etags-select
    etags-table
    ido-ubiquitous
    javadoc-help
    js-comint
    js2-mode
    paredit
    rvm
    s
    scss-mode
    smex
    yasnippet
    zenburn-theme
    )
  "A list of packages to ensure are installed at launch.")

(defun mbeenen-packages-installed-p ()
  (loop for p in mbeenen-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (mbeenen-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p mbeenen-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'mbeenen-packages)
