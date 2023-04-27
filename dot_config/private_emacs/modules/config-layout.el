;; Inspired by https://github.com/rougier/nano-emacs/blob/master/nano-layout.el
;; and https://git.sr.ht/~protesilaos/dotfiles/tree/master/item/emacs/.emacs.d/early-init.el

;; No menu bar
(if (display-graphic-p)
    (menu-bar-mode t) ;; When nil, focus problem on OSX
  (menu-bar-mode -1))

;; Mac specific
(when (eq system-type 'darwin)
  (setq
   ns-use-native-fullscreen t
   mac-use-title-bar nil))

;; allow any frame size and don't resize when changing font size
(setq
 frame-resize-pixelwise t
 frame-inhibit-implied-resize t)

;; No scroll bars
(if (fboundp 'scroll-bar-mode)
    (set-scroll-bar-mode nil))

;; No toolbar
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

;; No startup screen or message and use scratch buffer
(setq
 inhibit-startup-screen t
 inhibit-startup-message t
 inhibit-startup-echo-area-message t
 initial-scratch-message nil
 initial-buffer-choice nil)

;; No frame title, dialogs, popups
(setq
 frame-title-format nil
 use-file-dialog nil
 use-dialog-box nil
 pop-up-windows nil)

;; Minimum window height
(setq window-min-height 1)

;; Add a 2 char margin to the left and right side of the window
;(add-hook 'window-configuration-change-hook
;          (lambda ()
;            (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 1 1)))

;; Set frame appearance
(setq default-frame-alist
      (append
       (list
        '(undecorated-round . t) ;; No menubar, rounded corners
        '(internal-border-width . 18)
        '(min-height . 1)
        '(height . 66)
        '(min-width . 1)
        '(width . 216)
        '(vertical-scroll-bars . nil)
        '(left-fringe . 1)
        '(right-fringe . 1)
        '(tool-bar-lines . 0)
        '(menu-bar-lines . 0))))

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
