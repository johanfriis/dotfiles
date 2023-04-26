(require 'config-elpaca)

;(use-package autothemer :ensure t)

;(elpaca (rose-pine-emacs :host github :repo "thongpv87/rose-pine-emacs")
;  :config
;  (load-theme 'rose-pine-color t))

(elpaca (nano-theme :host github :repo "rougier/nano-theme")
  :defer t
  :config
  (if (my/environment-dark-mode-p)
      (load-theme 'nano-dark t)
      (load-theme 'nano-light t)))

(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'nano-light t))
    ('dark (load-theme 'nano-dark t))))

(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)

(provide 'config-theme)
