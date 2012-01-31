(defvar root-dir (file-name-directory load-file-name)
  "The root dir of the Emacs Prelude distribution.")
(defvar emacs-config-dir (concat root-dir "config/")
  "This directory houses all of the main configuration.")
(defvar emacs-vendor-dir (concat root-dir "vendor/")
  "(DEPRECATED IN FAVOR OF SITE-LISP) This directory houses elisp libs/extensions that are
not available from el-get")
(defvar emacs-home-dir (concat emacs-config-dir "home/")
  "This directory houses all the home specific configuration")
(defvar emacs-site-lisp-dir (concat root-dir "site-lisp/")
  "This directory houses other extensions and git submodules")

(add-to-list 'load-path emacs-config-dir)
(add-to-list 'load-path emacs-vendor-dir)
(add-to-list 'load-path emacs-home-dir)
(add-to-list 'load-path emacs-site-lisp-dir)

;; Add external projects to load path
(dolist (project (directory-files emacs-site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "mbeenen-custom.el" emacs-config-dir))
(load custom-file)

;; Set any home specific variables for setup
(require 'mbeenen-home-env)

;; Set some basic defaults
(require 'mbeenen-defaults)

;; Load the main modules
(require 'mbeenen-ui)
(require 'mbeenen-editor)
(require 'mbeenen-ido)
(require 'mbeenen-grep)
(require 'mbeenen-hippie)
(require 'mbeenen-midnight)
(require 'mbeenen-magit)
(require 'mbeenen-shell)
(require 'mbeenen-dired)
(require 'mbeenen-tags)
(require 'mbeenen-erc)
;; (require 'mbeenen-yasnippet)

;; Configuration for various programming (or other major) modes
(require 'mbeenen-org)
(require 'mbeenen-java)
(require 'mbeenen-javascript)
(require 'mbeenen-perl)

(require 'mbeenen-keybindings)

;; Any home specific initialization code to run after loading
;; everything else
(require 'mbeenen-home-startup)

;; Desktop loading goes last
(require 'mbeenen-desktop)
