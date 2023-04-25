;; Inspired by https://github.com/rougier/nano-emacs/blob/master/nano-layout.el

(setq default-frame-alist
      (append (list
               '(undecorated-round      . t)        ;; No menubar, rounded corners
               '(internal-border-width  . 18)
               '(min-height             . 1)
               '(height                 . 66)
               '(min-width              . 1)
               '(width                  . 216)
               '(vertical-scroll-bars   . nil)
               '(left-fringe            . 1)
               '(right-fringe           . 1)
               '(tool-bar-lines         . 0)
               '(menu-bar-lines         . 0))))

(defun my/frame-recenter (&optional frame)
  "Center FRAME on the screen.
FRAME can be a frame name, a terminal name, or a frame.
If FRAME is omitted or nil, use currently selected frame."
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.5) (left . 0.5)))))

(add-to-list 'after-make-frame-functions #'my/frame-recenter)

(provide 'config-layout)
