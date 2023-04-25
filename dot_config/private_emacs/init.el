;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory)):

(require 'config-benchmarking)    ;; Measure startup time
(require 'config-elpaca)          ;; load package manager
(require 'config-no-littering)
(require 'config-theme)           ;; load current theme
(require 'config-defaults)        ;; load default settings
(require 'config-layout)          ;; load layout
(require 'config-session)         ;; load session handling
(require 'config-nano)            ;; load some nano modules

(use-package evil
  :demand t
  :init
  (evil-mode t))
