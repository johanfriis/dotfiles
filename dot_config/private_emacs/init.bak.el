;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)):

(require 'init-benchmarking) ;; Measure startup time
(require 'init-elpaca) ;; load package manager
(require 'init-no-littering)
(require 'init-theme) ;; init current theme
(require 'init-helpers) ;; load some helpers
(require 'init-defaults) ;; init default settings
(require 'init-session) ;; load session handling
(require 'init-nano) ;; load some nano modules



(use-package evil :demand t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4d16802de4686030ed8f30b5a844713d68edec9cc07322bef54493d15e68d8cd" "6454421996f0508c38215a633256e36c19a28591542fb0946cfc40f1dceb89cf" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
