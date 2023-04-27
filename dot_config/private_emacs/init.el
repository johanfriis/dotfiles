;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

(require 'config-benchmarking) ;; Measure startup time
(require 'config-elpaca) ;; load package manager
(require 'config-no-littering)
(require 'config-theme) ;; load current theme
(require 'config-nano-modeline)
(require 'config-defaults) ;; load default settings
(require 'config-session) ;; load session handling
(require 'config-evil)
(require 'config-org)
;(require 'config-nano)            ;; load some nano modules


;(defun emacs-lisp-goto-definition ()
;  (interactive)
;  (find-function (function-called-at-point)))
;
;(defun replace-last-sexp ()
;  (interactive)
;  (let ((value (eval (elisp--preceding-sexp))))
;    (kill-sexp -1)
;    (insert (format "%S" value))))
;
;(use-package auto-compile
;  :init
;  (my/onetime-setup auto-compile
;    :hook 'before-save-hook
;    (auto-compile-on-save-mode +1))
;
;  :config
;  (setq auto-compile-display-buffer nil
;        auto-compile-mode-line-counter t))
;
;(use-package lisp-mode
;  :ensure nil
;  :config
;  (use-package smartparens
;    :config
;    (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;    (sp-local-pair 'emacs-lisp-mode "`" nil :when '(sp-in-string-p)))
;
;  (add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
;  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
;  (add-hook
;   'emacs-lisp-mode-hook
;   (my/defun-as-value my/diminish-elisp-mode ()
;     (setq mode-name (if (display-graphic-p) "λ" "EL"))))
;
;  (define-key emacs-lisp-mode-map (kbd "C-c e") #'replace-last-sexp)
;  (define-key emacs-lisp-mode-map (kbd "M-.") #'emacs-lisp-goto-definition)
;  (define-key emacs-lisp-mode-map (kbd "M-,") #'evil-jump-backward)
;
;  (with-eval-after-load 'evil
;    (eval-when-compile
;      (with-demoted-errors "Load error: %s"
;        (require 'evil)))
;    (evil-define-key 'normal emacs-lisp-mode-map "gd"
;      #'emacs-lisp-goto-definition)))
