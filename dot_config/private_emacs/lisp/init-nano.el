(require 'init-elpaca)

(elpaca (mini-frame) :demand t)
;(use-package
;  :elpaca (nano-emacs :host github :repo "rougier/nano-emacs")
;  )
(elpaca (nano-emacs :host github :repo "rougier/nano-emacs") :init
	(require 'nano-layout)
	(require 'nano-colors)
	(require 'nano-faces)	
	(require 'nano-theme)
	(require 'nano-theme-light)
	(require 'nano-theme-dark)
	(nano-theme-set-light)
	(call-interactively 'nano-refresh-theme)
	(require 'nano-defaults)
	(require 'nano-session)
	(require 'nano-modeline)
	(require 'nano-bindings)
	
	
	(require 'nano-minibuffer)
	(require 'nano-splash)




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
)

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
