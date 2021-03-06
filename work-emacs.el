(require 'common-init)

(defvar emacs-work-dir (concat emacs-config-dir "work/")
  "This directory houses all the work specific configuration")

(add-to-list 'load-path emacs-work-dir)

;; Any work specific initialization code to run after loading
;; everything else
(require 'mbeenen-work-amazon)
(require 'mbeenen-work-init)
(require 'mbeenen-work-java)
(require 'mbeenen-work-logs)
(require 'mbeenen-work-org)
(require 'mbeenen-work-keybindings)

;; Load desktop last
(require 'mbeenen-desktop)
