;; Inspired by https://github.com/rougier/nano-emacs/blob/master/nano-layout.el

(setq default-frame-alist
      (append (list
               '(undecorated-round      . t)        ;; No menubar, rounded corners
               '(internal-border-width  . 18)
               '(min-height             . 1)
               '(height                 . 45)
               '(min-width              . 1)
               '(width                  . 81)
               '(vertical-scroll-bars   . nil)
               '(left-fringe            . 1)
               '(right-fringe           . 1)
               '(tool-bar-lines         . 0)
               '(menu-bar-lines         . 0))))

(provide 'config-layout)
