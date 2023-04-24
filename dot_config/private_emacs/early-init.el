(require 'xdg)

;; dont enable default package handling
(setq package-enable-at-startup nil)

;; set base directories
(defvar emacs-config-directory (expand-file-name "emacs/" (xdg-config-home)))
(defvar emacs-cache-directory (expand-file-name "emacs/" (xdg-cache-home)))
(defvar emacs-data-directory (expand-file-name "emacs/" (xdg-data-home)))
(defvar emacs-state-directory (expand-file-name "emacs/" (xdg-state-home)))

;; Set eln-cache dir
(when (boundp 'native-comp-eln-load-path)
  (startup-redirect-eln-cache (expand-file-name "eln-cache/" emacs-cache-directory)))

;; hide warnings when natively compiling packages
(setq native-comp-async-report-warnings-errors nil)

;; set a custom file for customize settings
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; So we can detect this having been loaded
(provide 'early-init)


