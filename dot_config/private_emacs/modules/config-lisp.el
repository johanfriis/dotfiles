(use-package
 elisp-autofmt
 :commands (elisp-autofmt-mode elisp-autofmt-buffer)
 :config
 (setq
  elisp-autofmt-on-save-p 'always
  elisp-autofmt-cache-directory (expand-file-name "autofmt/" emacs-cache-directory))
 :hook (emacs-lisp-mode . elisp-autofmt-mode))

(provide 'config-lisp)
