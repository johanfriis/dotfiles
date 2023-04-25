(defun load-config()
  "Load literate mode configuration"
  (interactive)
  (org-babel-load-file (expand-file-name "configuration.org" user-emacs-directory)))

(load-config)
