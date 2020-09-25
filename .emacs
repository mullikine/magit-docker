(add-hook
 'after-init-hook
 (lambda ()
   (require 'helm-config)
   (helm-mode 1)))


(require 'cl-macs)

;; This doesn't work for the terminal version though
;; after copy Ctrl+c in Linux X11, you can paste by `yank' in emacs
(setq x-select-enable-clipboard t)

;; after mouse selection in X11, you can paste by `yank' in emacs
(setq x-select-enable-primary t)

;; this isn't working
;; I just want the clipboard to work
(setq x-select-enable-primary t)
(setq x-select-enable-clipboard t)

(ignore-errors
  (xclip-mode 1)
  )

(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;; This appears to do a much better job that simpleclip

;; CUA OS copypasta even in ncurses mode
(case system-type
  ('darwin (unless window-system
             (setq interprogram-cut-function
                   (lambda (text &optional push)
                     (let* ((process-connection-type nil)
                            (pbproxy (start-process "pbcopy" "pbcopy" "/usr/bin/pbcopy")))
                       (process-send-string pbproxy text)
                       (process-send-eof pbproxy))))))
  ('gnu/linux (progn
                (setq x-select-enable-clipboard t)
                (defun xsel-cut-function (text &optional push)
                  (with-temp-buffer
                    (insert text)
                    (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
                (defun xsel-paste-function()

                  (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
                    (unless (string= (car kill-ring) xsel-output)
                      xsel-output )))
                (setq interprogram-cut-function 'xsel-cut-function)
                (setq interprogram-paste-function 'xsel-paste-function))))



(provide 'my-clipboard)
(menu-bar-mode -1)

(custom-set-faces
 ;; other faces
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-section-highlight ((((type tty)) nil))))

(let ((gd (locate-dominating-file default-directory ".git")))
  (if gd
      (cd gd)))

(load "/theme.el")
(enable-theme (intern "magonyx"))

(use-package magithub
  :after magit
  :config
  (magithub-feature-autoinject t)
  (setq magithub-clone-default-directory default-directory))

;; (progn  (magit-status) (delete-other-windows))