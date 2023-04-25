
(use-package evil
  :demand t
  :ensure t
  :init (setq evil-want-keybinding nil
              evil-want-integration t
              ;evil-want-minibuffer t
              ;evil-mode-line-format 'after
              ;evil-want-C-u-scroll t
              ;evil-want-C-d-scroll t
              ;evil-want-C-i-jump nil
              evil-want-Y-yank-to-eol t
              evil-backspace-join-lines nil
              ;evil-undo-system 'undo-redo
              evil-want-fine-undo t
              ;evil-move-cursor-back nil ; like vis
              ;evil-show-paren-range 1
              ;evil-echo-state nil
              ;evil-respect-visual-line-mode t
              ;evil-disable-insert-state-bindings t
              ;evil-want-abbrev-expand-on-insert-exit nil
              )
  :config (evil-mode 1))

;; tons of evil configuration for emacs packages
;; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init '(buff-menu custom elpaca help)))

(provide 'config-evil)

  ;(define-key evil-normal-state-map (kbd "x") 'elpaca-ui-execute-marks)
