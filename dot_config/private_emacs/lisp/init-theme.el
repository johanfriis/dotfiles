(require 'init-elpaca)

(use-package autothemer :ensure t)

(elpaca (rose-pine-emacs :host github :repo "thongpv87/rose-pine-emacs")
  :config
  (load-theme 'rose-pine-color t))


(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'rose-pine-dawn t))
    ('dark (load-theme 'rose-pine-color t))))

(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)

(provide 'init-theme)
