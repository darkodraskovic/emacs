;;;;;;;;;
;; VAR ;;
;;;;;;;;;

;; (setq package-check-signature nil)

(blink-cursor-mode 0)
(set-face-attribute 'default nil :height 104)

;; turn off bars
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

(setq auto-save-default nil)
(setq vc-follow-symlinks 2)
(setq comint-move-point-for-output t)
(setq comint-scroll-to-bottom-on-input t)
(setq compilation-scroll-output t)

;; Auto refresh buffers
(global-auto-revert-mode t)
;; Also auto refresh dired
(setq global-auto-revert-non-file-buffers t)
;; be quiet about it
(setq auto-revert-verbose nil)

(setq inhibit-startup-screen t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(transient-mark-mode 1)

(setq bookmark-save-flag 1)

(setq make-backup-files nil)
(tool-bar-mode -1)
(setq fci-rule-column 80)

(setq-default indent-tabs-mode nil)

;; split vertically when visiting new buffer
(setq split-height-threshold nil)
(setq split-width-threshold 0)

(setq scroll-conservatively 10)
(setq scroll-margin 7)

(load "~/Radovi/Linux/.emacs/emacs_abbrev.el")

(setenv "PKG_CONFIG_PATH" "/usr/local/lib/pkgconfig")
(setenv "LD_LIBRARY_PATH" "/usr/local/lib")

(setq-default buffer-file-coding-system 'utf-8-unix)

; TODO
; (global-unset-key (kbd "C-m"))
; (global-set-key (kbd "<return>") 'newline-and-indent)

;; cf. https://www.gnu.org/software/emacs/manual/html_node/elisp/Attribute-Functions.html
(set-face-attribute 'default nil :height 108)

;;;;;;;;;;;;;;;;
;; COMMANDS   ;;
;;;;;;;;;;;;;;;;

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun duplicate-line-or-region (&optional n)
  "Duplicate current line, or region if active.
With argument N, make N copies.
With negative N, comment out original line and use the absolute value."
  (interactive "*p")
  (let ((use-region (use-region-p)))
    (save-excursion
      (let ((text (if use-region        ;Get region if active, otherwise line
                      (buffer-substring (region-beginning) (region-end))
                    (prog1 (thing-at-point 'line)
                      (end-of-line)
                      (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                          (newline))))))
        (dotimes (i (abs (or n 1)))     ;Insert N times, or once if not specified
          (insert text))))
    (if use-region nil                  ;Only if we're working with a line (not a region)
      (let ((pos (- (point) (line-beginning-position)))) ;Save column
        (if (> 0 n)                             ;Comment out original with negative arg
            (comment-region (line-beginning-position) (line-end-position)))
        (forward-line 1)
        (forward-char pos)))))

;; Source: https://www.emacswiki.org/emacs/misc-cmds.el
(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer :ignore-auto :noconfirm))

;;;;;;;;;;;;;;;;;;;;;;;;
;; GLOBAL KEYBINDINGS ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-i") 'imenu)
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key "\C-j" 'newline-and-indent)
(global-set-key "\C-cu" 'comment-or-uncomment-region-or-line)
(global-set-key [?\C-c ?d] 'duplicate-line-or-region)
(global-set-key "\M- " 'hippie-expand)

;;;;;;;;;;;;;;
;; PACKAGE  ;;
;;;;;;;;;;;;;;

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(package-refresh-contents)

(require 'use-package)

;;;;;;;;;;;;;;
;; MODES    ;;
;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;; electric-pair

(setq electric-pair-pairs nil)
(setq electric-pair-text-pairs nil)
(electric-pair-mode 1)

(show-paren-mode 1)

(winner-mode 1)

(global-visual-line-mode 1)

;; (desktop-save-mode 1)

;; It allows you to move the current line using M-up / M-down
;; if a region is marked, it will move the region instead.
(use-package move-text
  :ensure t
  :init (move-text-default-bindings)
)

;;;;;;;;;;;;;;;; HELM

(use-package helm
  :ensure t
  :init
  ;; (require 'helm-config)
  (helm-mode t)
)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; You have to bind helm-M-x to M-x manually. Otherwise, you still get Helm completion,
;; but using the vanilla M-x that does not provides the above features like showing
;; key bindings and TAB to open built-in documentation.
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-s o") 'helm-occur)

;; sudo apt install silversearcher-ag
(setq helm-grep-ag-command "ag --line-numbers -S --hidden --color --color-match '31;43' --nogroup %s %s %s")
;; (setq helm-grep-ag-command "rg --color=always --smart-case --no-heading --line-number %s %s %s")
(setq helm-grep-ag-pipe-cmd-switches '("--color-match '31;43'"))
(global-set-key (kbd "M-g a") 'helm-do-grep-ag)

;; incremental (file) find name search
(global-unset-key (kbd "C-c h /"))
(global-set-key (kbd "M-g f") 'helm-find)

;; ;; ido-mode + helm
;; (add-to-list 'helm-completing-read-handlers-alist '(find-file . ido))
;; (add-to-list 'helm-completing-read-handlers-alist '(switch-to-buffer . ido))
;; (add-to-list 'helm-completing-read-handlers-alist '(kill-buffer . ido))

;; (add-to-list 'helm-completing-read-handlers-alist '(dired-do-copy . ido))
;; (add-to-list 'helm-completing-read-handlers-alist '(dired-do-rename . ido))
;; (add-to-list 'helm-completing-read-handlers-alist '(dired-create-directory . ido))

(setq helm-grep-truncate-lines nil)
(setq helm-moccur-truncate-lines nil)
(setq helm-split-window-default-side 'right)
(setq helm-always-two-windows t
      helm-split-window-inside-p t)

;;;;;;;;;;;;;;;; IDO

;; (setq ido-everywhere t)
(setq ido-enable-flex-matching 1)
(ido-mode t)

(use-package flx-ido
  :ensure t
  :init (flx-ido-mode 1)
  :config (setq ido-use-faces nil) ;; disable ido faces to see flx highlights. OR (setq flx-ido-use-faces nil)
)

;;;;;;;;;;;;;;;; flycheck

(use-package flycheck
  :ensure t
  :init
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  )

;;;;;;;;;;;;;;;; company

(use-package company-quickhelp
  :ensure t
  )

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'after-init-hook 'company-quickhelp-mode)
  :config
  (setq company-idle-delay 0.34)
  (setq company-minimum-prefix-length 1)
  (delete 'company-clang company-backends)
  :bind ("M-/" . company-dabbrev)
  )

(use-package expand-region
  :ensure t
  :init (global-set-key (kbd "C-=") 'er/expand-region)
  )

;; remember cursor position
(save-place-mode 1)

;; turn on highlighting current line
(global-hl-line-mode 1)

;; make typing delete/overwrites selected text
(delete-selection-mode 1)

;; make cursor movement stop in between camelCase words.
(global-subword-mode 1)

;;;;;;;;;;;;;;;; ace-window

(use-package ace-window
  :ensure t
  :commands ace-window
  :init
  (global-set-key (kbd "M-o") 'ace-window)
  ;; (setq aw-background nil)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (defvar aw-dispatch-alist
    '((?x aw-delete-window "Delete Window")
      (?m aw-swap-window "Swap Windows")
      (?M aw-move-window "Move Window")
      (?c aw-copy-window "Copy Window")
      (?j aw-switch-buffer-in-window "Select Buffer")
      (?n aw-flip-window)
      (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
      (?c aw-split-window-fair "Split Fair Window")
      (?v aw-split-window-vert "Split Vert Window")
      (?b aw-split-window-horz "Split Horz Window")
      (?o delete-other-windows "Delete Other Windows")
      (?? aw-show-dispatch-help))
    "List of actions for `aw-dispatch-default'.")
  )

;;;;;;;;;;;;;;;; projectile

(use-package projectile
  :ensure t
  :bind-keymap ("s-p" . projectile-command-map)
  :bind (:map projectile-mode-map
              ("s-r" . projectile-replace)
              ;; ("s-e" . projectile-recentf)

              ("s-g" . projectile-find-file-dwim)
              ("s-f" . projectile-find-file)
              ("s-d" . projectile-find-dir)
              ("s-D" . projectile-dired)
              ("s-s ?s" . projectile-ag)
              ("s-a" . projectile-find-other-file)

              ("s-C" . projectile-configure-project)
              ("s-c" . projectile-compile-project)
              ("s-v" . projectile-vc))
  ;; :config (setq projectile-enable-caching nil)
  )

(projectile-mode 1)
