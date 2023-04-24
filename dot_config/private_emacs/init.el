;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)):
(require 'init-benchmarking) ;; Measure startup time
(require 'init-elpaca) ;; load package manager





(use-package evil :demand t)
