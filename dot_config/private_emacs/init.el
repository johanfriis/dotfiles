;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

(require 'config-benchmarking)
(require 'config-elpaca)
(require 'config-no-littering)
(require 'config-theme)
(require 'config-nano-modeline)
(require 'config-defaults)
(require 'config-session)
(require 'config-evil)
(require 'config-org)
(require 'config-lisp)

;; Ignore case in completion
(setq completion-ignore-case t)

;; Sort directories before files
(defun sort-directories-first (files)
  (setq files (vertico-sort-history-length-alpha files))
  (nconc
   (seq-filter (lambda (x) (string-suffix-p "/" x)) files)
   (seq-remove (lambda (x) (string-suffix-p "/" x)) files)))

;; completion UI (vertical list in minibuffer)
(use-package
 vertico
 :elpaca
 (vertico
  :type git
  :host github
  :repo "minad/vertico"
  :files (:defaults "extensions/*"))
 :init (vertico-mode) (setq vertico-resize t))

;; allows different completion UI configuration
(use-package
 vertico-multiform
 :elpaca nil
 :after vertico
 :init (vertico-multiform-mode)
 (setq
  vertico-multiform-commands '((execute-extended-command flat))
  vertico-multiform-categories '((file (vertico-sort-function . sort-directories-first)))))

;; `completion STYLE` with flexible candidate filtering
;; filter with space-separated components and match components in any order
;; filter means how a input string is matched against candidates
(use-package
 orderless
 :demand
 :config
 ;; partial completion for files to allows path expansion
 (setq
  completion-styles '(orderless)
  completion-category-defaults nil
  completion-ignore-case t ; ignore case (useful in c++ for instance)
  read-file-name-completion-ignore-case t
  completion-category-overrides
  '((file (styles . (partial-completion)))
    ;; navigate files with initials
    (minibuffer (initials)))))

;; Enable rich annotations using the Marginalia package
(use-package marginalia :init (marginalia-mode))
