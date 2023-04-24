(require 'init-elpaca)

(setq no-littering-etc-directory emacs-data-directory)
(setq no-littering-var-directory emacs-cache-directory)

;; set directory for auto-save files
;(setq auto-save-file-name-transforms
;      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(use-package no-littering :demand t)

(provide 'init-no-littering)
