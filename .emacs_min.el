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

(linum-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)

;;;;;;;;;;;;;;;;;;;;;
;; REQUIRE PACKAGE ;;
;;;;;;;;;;;;;;;;;;;;;
;; (require 'package)
;; (package-initialize) 

;; ;; AUTO-COMPLETE
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (setq ac-auto-start 3)

;; ;; MOVE-TEXT
;; (require 'move-text)
;; (move-text-default-bindings)

;; ;; HELM
;; (require 'helm)
;; (require 'helm-config)
;; (helm-mode t)

;; ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; (global-unset-key (kbd "C-x c"))

;; ;; You have to bind helm-M-x to M-x manually. Otherwise, you still get Helm completion, but using the vanilla M-x that does not provides the above features like showing key bindings and TAB to open built-in documentation.
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; (global-set-key (kbd "M-s o") 'helm-occur)
