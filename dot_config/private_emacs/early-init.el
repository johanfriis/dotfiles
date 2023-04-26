(require 'xdg)

;; add modules directory to load path
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory)):

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
;; Eventually, Disable the damn thing by making it disposable.
;;(setq custom-file (make-temp-file "emacs-custom-"))

(require 'config-layout) ;; load layout

;; Avoid the initial flash of light in dark mode
;; Borrowed and adapted from the following sources:
;; https://github.com/LionyxML/auto-dark-emacs/blob/master/auto-dark.el#L87
;; https://git.sr.ht/~protesilaos/dotfiles/tree/master/item/emacs/.emacs.d/early-init.el#L146

(defun my/environment-dark-mode-p ()
  "Invoke applescript using Emacs using external shell command;
this is less efficient, but works for non-GUI Emacs."
  (string-equal "true" (string-trim (shell-command-to-string "osascript -e 'tell application \"System Events\" to tell appearance preferences to return dark mode'"))))

(defun my/emacs-re-enable-frame-theme (_frame)
  "Re-enable active theme, if any, upon FRAME creation.
Add this to `after-make-frame-functions' so that new frames do
not retain the generic background set by the function
`my/emacs-avoid-initial-flash-of-light'."
  (when-let ((theme (car custom-enabled-themes)))
    (enable-theme theme)))

;; NOTE 2023-02-05: The reason the following works is because (i) the
;; `mode-line-format' is specified again and (ii) the
;; `prot-emacs-theme-gesttings-dark-p' will load a dark theme.
(defun my/emacs-avoid-initial-flash-of-light ()
  "Avoid flash of light when starting Emacs, if needed.
New frames are instructed to call `prot-emacs-re-enable-frame-theme'."
  (when (my/environment-dark-mode-p)
    (setq mode-line-format nil)
    (set-face-attribute 'default nil :background "#000000")
    (add-hook 'after-make-frame-functions #'my/emacs-re-enable-frame-theme)))

(my/emacs-avoid-initial-flash-of-light)

;; So we can detect this having been loaded
(provide 'early-init)


