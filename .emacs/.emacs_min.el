;; VARIABLES
(setq make-backup-files nil)

;; KEY BINDINGS
(global-set-key (kbd "C-z") 'undo)
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key "\M- " 'hippie-expand)

;; IDO-MODE
(setq ido-everywhere t)
(setq ido-enable-flex-matching 1)
(ido-mode t)

(electric-pair-mode 1)
(show-paren-mode 1)
