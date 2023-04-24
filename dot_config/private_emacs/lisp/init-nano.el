(require 'init-elpaca)


;(elpaca (nano-theme :host github :repo "rougier/nano-theme")
;  :defer t
;  :config
;  (load-theme 'nano-light t)
;  (nano-mode))

(elpaca (nano-modeline :host github :repo "rougier/nano-modeline")
  :config
  (require 'nano-modeline)
  (nano-modeline-mode))

;(elpaca (mini-frame) :demand t)
;(elpaca (nano-minibuffer :host github :repo "rougier/nano-minibuffer")
;  :config
;  (require 'nano-minibuffer)
;  (nano-minibuffer-mode))

;(elpaca (nano-splash :host github :repo "rougier/nano-splash")
;  :config
;  (require 'nano-splash)
;  (nano-splash))

;(use-package
;  :elpaca (nano-emacs :host github :repo "rougier/nano-emacs")
;  )
;(elpaca (nano-emacs :host github :repo "rougier/nano-emacs") :init
;	(require 'nano-layout)
;	(require 'nano-colors)
;	(require 'nano-faces)	
;	(require 'nano-theme)
;	(require 'nano-theme-light)
;	(require 'nano-theme-dark)
;	(nano-theme-set-light)
;	(call-interactively 'nano-refresh-theme)
;	(require 'nano-defaults)
;	(require 'nano-session)
;	(require 'nano-modeline)
;	(require 'nano-bindings)
;	
;	
;	(require 'nano-minibuffer)
; 	(require 'nano-splash)




					;(require 'nano-base-colors)



;	(nano-faces)
;	(nano-theme)
;	(require 'nano-colors)
;	(require 'nano-help)
;	(require 'nano-splash)
;	(require 'nano-modeline)
;	(require 'nano-layout)
;	(require 'nano-defaults)
;	(require 'nano-session)
;	(require 'nano-bindings)
	;(require 'nano-counsel)
	;(require 'nano-mu4e)

;	(require 'nano-command)
	;(require 'nano-agenda))
;)

;(require 'nano)
;(require 'nano-base-colors)
;(require 'nano-faces)
;(require 'nano-theme-light)
;(require 'nano-theme)
;(require 'nano-help)
;(require 'nano-splash)
;(require 'nano-modeline)
;(require 'nano-layout)
;(require 'nano-defaults)
;(require 'nano-session)
;(require 'nano-bindings)
;(require 'nano-counsel)
;(require 'nano-colors)
;;(require 'nano-mu4e)
;(require 'nano-minibuffer)
;(require 'nano-command)
;(require 'nano-agenda)

;(elpaca-wait)
(provide 'init-nano)
