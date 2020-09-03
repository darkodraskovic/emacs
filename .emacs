;;;;;;;;;;;
;; THEME ;;
;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes
   (quote
    ("76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (typescript company-dict company-quickhelp go helm-lsp which-key treemacs-icons-dired lsp-treemacs treemacs-projectile treemacs lsp-ui lsp-mode sml-mode yasnippet-snippets yasnippet-classic-snippets xref-js2 wrap-region web-mode projectile org-ref move-text markdown-mode+ json-mode js2-highlight-vars indium helm-gtags gnu-elpa-keyring-update fzf flx-ido expand-region elm-mode ebib dockerfile-mode docker-compose-mode csv-mode company-rtags company-lua company-cmake cmake-mode ag)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;
;; VAR ;;
;;;;;;;;;

(setq custom-theme-directory "~/.emacs.d/themes")
(blink-cursor-mode 0)

(setq auto-save-default nil)
(setq vc-follow-symlinks 2)
(setq comint-move-point-for-output t)
(setq comint-scroll-to-bottom-on-input t)
(setq compilation-scroll-output t)

(global-auto-revert-mode t)
(setq inhibit-startup-screen t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(transient-mark-mode 1)

(setq default-directory "~/Radovi/Org/" )
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

(set-frame-font "DejaVu Sans Mono 12" nil t)

(load "~/Radovi/Org/Dict/my_emacs_abbrev.el")

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

;;;;;;;;;;;;;;;;;;;;;;;;
;; GLOBAL KEYBINDINGS ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-i") 'imenu)
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key "\C-j" 'newline-and-indent)
(global-set-key "\C-cu" 'comment-or-uncomment-region-or-line)
(global-set-key [?\C-c ?d] 'duplicate-line-or-region)

;;;;;;;;;;;;;;
;; PACKAGE  ;;
;;;;;;;;;;;;;;

(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ))
(package-initialize)

(require 'use-package)

;;;;;;;;;;;;;;
;; TREEMACS ;;
;;;;;;;;;;;;;;

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  (setq treemacs--icon-size 14)
  (setq treemacs-width 28)  
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)
  (pcase (cons (not (null (executable-find "git")))
               (not (null treemacs-python-executable)))
    (`(t . t)
     (treemacs-git-mode 'deferred))
    (`(t . _)
     (treemacs-git-mode 'simple)))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  )

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

;;;;;;;;;;;;;;
;; MODES    ;;
;;;;;;;;;;;;;;

;; electric-pair
(setq electric-pair-pairs nil)
(setq electric-pair-text-pairs nil)
(electric-pair-mode 1)

;; yas-mode
(yas-minor-mode 1)

;; show-paren-mode
(show-paren-mode 1)

;; switch windows with your shift key by pressing S-<left>, S-<right>, S-<up>, S-<down>
(windmove-default-keybindings)
;; "undo" (and “redo”) changes in the window configuration with the key commands ‘C-c
(winner-mode 1)

;; auto-load major mods
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

;; auto-load minor modes
(global-visual-line-mode 1)

;; (desktop-save-mode 1)

;; It allows you to move the current line using M-up / M-down
;; if a region is marked, it will move the region instead.
(require 'move-text)
(move-text-default-bindings)

;; HELM
(require 'helm)
(require 'helm-config)
(helm-mode t)

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
(setq helm-grep-ag-pipe-cmd-switches '("--color-match '31;43'"))
(global-set-key (kbd "M-g a") 'helm-do-grep-ag)

;; ido-mode + helm
(add-to-list 'helm-completing-read-handlers-alist '(find-file . ido))
(add-to-list 'helm-completing-read-handlers-alist '(switch-to-buffer . ido))
(add-to-list 'helm-completing-read-handlers-alist '(kill-buffer . ido))

(add-to-list 'helm-completing-read-handlers-alist '(dired-do-copy . ido))
(add-to-list 'helm-completing-read-handlers-alist '(dired-do-rename . ido))
(add-to-list 'helm-completing-read-handlers-alist '(dired-create-directory . ido))

(setq helm-grep-truncate-lines nil)
(setq helm-moccur-truncate-lines nil)
(setq helm-split-window-default-side (quote right))

;; IDO
;; (setq ido-everywhere t)
(setq ido-enable-flex-matching 1)
(ido-mode t)

(require 'flx-ido)
(flx-ido-mode 1)
(setq ido-use-faces nil) ;; disable ido faces to see flx highlights.
;; OR (setq flx-ido-use-faces nil)

;; YASNIPPET
;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all)
;; (setq yas-snippet-dirs (append yas-snippet-dirs '("~/emacs.d/snippets")))

;; FLYCHECK
(use-package flycheck
  :ensure t
  :init
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  )

;; COMPANY
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  ;; (setq company-show-numbers t)
  (delete 'company-clang company-backends)
  )

(company-quickhelp-mode)

;; HIPPIE
(global-set-key "\M- " 'hippie-expand)

;; EXPAND-REGION
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; remember cursor position
(save-place-mode 1)

;; turn on highlighting current line
(global-hl-line-mode 1)

;; make typing delete/overwrites selected text
(delete-selection-mode 1)

;; make cursor movement stop in between camelCase words.
(global-subword-mode 1)

(use-package which-key
  :ensure t
  :init
  (setq which-key-idle-delay 0.5)
  :config
  (which-key-mode)
  )

;;;;;;;;;;;;;;;;
;; PROJECTILE ;;
;;;;;;;;;;;;;;;;

;; Recentf is a minor mode that builds a list of recently opened files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

(add-to-list 'package-pinned-packages '(projectile . "melpa-stable") t)

(define-key projectile-mode-map [?\s-r] 'projectile-replace)
(define-key projectile-mode-map [?\s-e] 'projectile-recentf)

(define-key projectile-mode-map [?\s-g] 'projectile-find-file-dwim)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
(define-key projectile-mode-map [?\s-D] 'projectile-dired)
(define-key projectile-mode-map [?\s-s ?s] 'projectile-ag)
(define-key projectile-mode-map [?\s-a] 'projectile-find-other-file)

(define-key projectile-mode-map [?\s-C] 'projectile-configure-project)
(define-key projectile-mode-map [?\s-c] 'projectile-compile-project)
(define-key projectile-mode-map [?\s-v] 'projectile-vc)

;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;
;; PROG LANG  ;;
;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;

;; helm-gtags
(setq helm-gtags-suggested-key-mapping t)
(setq helm-gtags-prefix-key "\C-c t")
(require 'helm-gtags)

;;;;;;;;;;;;;;
;; LSP-MODE ;;
;;;;;;;;;;;;;;

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (lsp-mode . display-line-numbers-mode))
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-delay 1)
  )

(use-package lsp-treemacs
  :after treemacs
  :ensure t
  :commands lsp-treemacs-errors-list
  :config
  (lsp-treemacs-sync-mode 1) ; bidirectional synchronization of lsp workspace folders and treemacs projects
  )

(use-package helm-lsp
  :ensure t
  :config
  (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
  )

;;;;;;;;;;;;;;;;
;; CPP        ;;
;;;;;;;;;;;;;;;;

;; cf. https://clangd.llvm.org/installation.html for project setup
(use-package c++
  :mode (("\\.h\\'" . c++-mode) ("\\.cpp\\'" . c++-mode))
  :commands c++-mode
  :init
  ;; (setq-default c-basic-offset 4)
  (setq c-default-style "stroustrup")
  :hook
  ((c-mode . lsp-deferred)
   (c++-mode . lsp-deferred))
  )

;;;;;;;;;;;;;;;;
;; CMAKE      ;;
;;;;;;;;;;;;;;;;

(require 'cmake-mode)
(add-hook 'cmake-mode-hook 'flycheck-mode)
(add-hook 'cmake-mode-hook 'display-line-numbers-mode)

;;;;;;;;;;;;;;;
;; GLSL mode ;;
;;;;;;;;;;;;;;;

(use-package glsl
  :mode (("\\.vs\\'" . glsl-mode) ("\\.fs\\'" . glsl-mode) ("\\.shader\\'" . glsl-mode))
  :init
  (add-hook 'glsl-mode-hook 'display-line-numbers-mode)
  )

;;;;;;;;;;;;;;;;
;; PYTHON     ;;
;;;;;;;;;;;;;;;;

(use-package python
  :commands python-mode
  :hook ((python-mode . lsp-deferred) (python-mode . pyvenv-mode))
  )

;;;;;;;;;;;;
;; GOLANG ;;
;;;;;;;;;;;;

;; ~/.emacs gets the PATH environment via
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

(use-package go
  :ensure t
  :commands go-mode
  :init
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  :hook
  ((go-mode . lsp-deferred)
   (go-mode . lsp-go-install-save-hooks))
  )

;;;;;;;;;;;;;;;;
;; TYPESCRIPT ;;
;;;;;;;;;;;;;;;;

(use-package typescript
  :ensure t
  :commands typescript-mode
  :init
  (defun typescript-mode-hooks ()
    (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
    (setq typescript-indent-level 2)
    (local-set-key (kbd "M-.") 'lsp-find-definition)
    )
  :hook
  ((typescript-mode . lsp-deferred)
   (typescript-mode . typescript-mode-hooks)))

;;;;;;;;;;;;;;;;
;; JAVASCRIPT ;;
;;;;;;;;;;;;;;;;

(setq-default js-indent-level 2)
(add-hook 'js-mode-hook 'js2-minor-mode)

(add-hook 'js2-mode-hook #'setup-tide-mode)

;; JS2-MODE
(setq-default js2-highlight-level 3)
(setq-default js2-strict-missing-semi-warning nil)
;; M-n or C-<down> — move to the next occurrence ;; M-p or C-<up> — move to the previous occurrence ;; M-r — rename the variable
(add-hook 'js2-mode-hook 'js2-highlight-vars-mode)
(setq-default js2-basic-offset 4)

;; JS2-REFACTOR
;; This is a collection of small refactoring functions to further the idea of a JavaScript IDE in Emacs that started with js2-mode.
(require 'js2-refactor)
(add-hook 'js2-mode-hook 'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; INDIUM
(require 'indium)
(setq indium-chrome-executable "google-chrome")
;; (add-hook 'js2-mode-hook #'indium-interaction-mode)
(define-key indium-interaction-mode-map (kbd "C-c d") nil)

;; ;; ESLINT & flycheck
;; (add-hook 'js-mode-hook 'flycheck-mode)
;; ;; disable jshint since we prefer eslint checking
;; (setq-default flycheck-disabled-checkers
;;               (append flycheck-disabled-checkers
;;                       '(javascript-jshint json-jsonlist)))
;; ;; use eslint with js2-mode
;; (flycheck-add-mode 'javascript-eslint 'js2-mode)

;; XREF-JS2
;; (require 'xref-js2)
;; ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)
;; (add-hook 'js2-mode-hook (lambda ()
;;                            (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
;; ;; Disable completion keybindings, as we use xref-js2 instead
;; (define-key tern-mode-keymap (kbd "M-.") nil)
;; (define-key tern-mode-keymap (kbd "M-,") nil)

;; AC-JS2-MODE
;; (add-hook 'js2-mode-hook 'ac-js2-mode) ;; An attempt at context sensitive auto-completion for Javascript in Emacs using js2-mode's parser and Skewer-mode
;; (add-to-list 'company-backends 'ac-js2-company)

(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

;;;;;;;;;;;;;;
;; WEB-MODE ;;
;;;;;;;;;;;;;;

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gohtml\\'" . web-mode))

(setq web-mode-engines-alist
      '(("go"    . "\\.gohtml\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)

(setq css-indent-offset 2)

;;;;;;;;;;;;;;;;;;;;
;; DOCKER-COMPOSE ;;
;;;;;;;;;;;;;;;;;;;;

(require 'docker-compose-mode)

;;;;;;;;;;;;;;
;; LUA-MODE ;;
;;;;;;;;;;;;;;

(use-package lua-mode
  :init
  (setq lua-indent-level 4)
  (add-hook 'lua-mode-hook 'hs-minor-mode)
  (add-hook 'lua-mode-hook 'imenu-add-menubar-index)
  (add-hook 'lua-mode-hook 'flycheck-mode)
  (defun my-lua-mode-hook ()
    (setq-local company-backends '((company-lua company-etags company-dabbrev-code company-yasnippet))))
  (add-hook 'lua-mode-hook 'my-lua-mode-hook)
  :bind (:map lua-mode-map
              ("C-x C-e" . lua-send-defun)
              ("C-c C-l" . lua-send-current-line)
              ("C-c C-r" . lua-send-region)
              ("C-c C-b" . lua-send-buffer))
  )

;;;;;;;;;;;;;;
;; ELM-MODE ;;
;;;;;;;;;;;;;;

(flycheck-elm-setup)
(add-hook 'elm-mode-hook 'flycheck-mode)

;; company
(add-to-list 'company-backends 'company-elm)
;; (with-eval-after-load 'company
;;   (add-to-list 'company-backends 'company-elm))
(add-hook 'elm-mode-hook #'elm-oracle-setup-completion)

(setq elm-tags-on-save t)
(setq elm-tags-exclude-elm-stuff nil)

(setq elm-format-on-save t)

;;;;;;;;;;;;;;
;; ORG-MODE ;;
;;;;;;;;;;;;;;

(defun add-tag-to-org-mode-dict ()
  "Append tag to 'org-mode' 'auto-complete' dict."
  (interactive)
  (let ((dict-file "~/Radovi/Org/Dict/org-mode" ))
    (write-region (region-beginning) (region-end) dict-file t)
    (write-region "\n" nil dict-file t)
    (if current-prefix-arg
        (let ((buffer-name "org-mode"))
                            (find-file dict-file)
                            (set-buffer buffer-name)
                            (sort-lines nil (point-min) (point-max))
                            (delete-duplicate-lines (point-min) (point-max) nil t)
                            (save-buffer buffer-name)
                            (kill-buffer buffer-name)
                            ))))

(use-package wrap-region
  :config
  (wrap-region-add-wrapper "=" "=" nil 'org-mode) ; select region, hit = then region -> =region= in org-mode
  (wrap-region-add-wrapper "*" "*" nil 'org-mode) ; select region, hit * then region -> *region* in org-mode
  (wrap-region-add-wrapper "/" "/" nil 'org-mode) ; select region, hit / then region -> /region/ in org-mode
  (wrap-region-add-wrapper "_" "_" nil 'org-mode) ; select region, hit _ then region -> _region_ in org-mode
  (wrap-region-add-wrapper "+" "+" nil 'org-mode) ; select region, hit + then region -> +region+ in org-mode
  (wrap-region-add-wrapper "~" "~" nil 'org-mode) ; select region, hit ~ then region -> ~region~ in org-mode  
  )

(use-package org-mode
  :commands wrap-region-mode
  :mode (("\\.org$" . org-mode) ("\\.wiki$" . org-mode))
  :init
  (add-hook 'org-mode-hook #'wrap-region-mode)
  (setq org-directory "~/Radovi/Org/Wikith")
  (setq org-html-validation-link nil)
  (setq org-log-done 'time)
  (setq org-src-fontify-natively t)
  (setq org-agenda-files '("~/Radovi/Org/Wikidev/Projects/Mainflux/"
                         "~/Radovi/Org/Wikith/Projekti/Organizer.org"
                         "~/Radovi/Org/Wikidev/Projects/CG.org"))
  (setq org-capture-templates '(
          ("i" "Ideja" entry (file+headline "~/Radovi/Org/Wikith/Ideje/Ideje_03.org" "Ideje") "* IDEJA \n%U\t*%f*\n%i\n\n%?")
          ("r" "Rezime" entry (file+headline "~/Radovi/Org/Wikith/Rezimei/Rezimei_01.org" "Rezimei") "* %?\n\n%U")
          ("e" "Resurs" entry (file+headline "~/Radovi/Org/Wikith/Resursi/Resursi_01.org" "Resursi") "* %?\n\n%U")
          ("c" "Citat" entry (file+headline "~/Radovi/Org/Wikith/Citati/Citati_01.org" "Citati") "* %?\n\n%U\n%i")
          ("j" "Journal" entry (file+headline "~/Radovi/Org/Wikith/Projekti/Journal.org" "Entries") "* %?\n\n%U")
          ("t" "Todo" entry (file+headline "~/Radovi/Org/Wikith/Projekti/Organizer.org" "Todo") "* TODO %?\n\n%U")))
  (setq org-refile-targets (quote ((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9)))) ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
  (setq org-latex-prefer-user-labels t)
  (setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))
  (add-hook 'org-mode-hook (lambda ()
                             (setq-local company-idle-delay nil)
                             (local-set-key (kbd "M-/") 'company-dict)
                             ))
  :bind
  (("C-c c" . org-capture)
   ("C-c a" . org-agenda)
   ("C-c [" . helm-bibtex)
   ("C-c l" . org-store-link)
   ("s-t" . add-tag-to-org-mode-dict)
   )
  :config
  )

(use-package company-dict
  :init
  (setq company-dict-dir (concat "/home/darko/Radovi/Org/Dict/"))
  :hook (org . company-dict))


;;;;;;;;;;;;;;;;;;
;; BIBLIOGRAPHY ;;
;;;;;;;;;;;;;;;;;;

(setq bibliographies (list
                      "/home/darko/Radovi/Org/Wikith/Resursi/Reference.bib"
                      "/home/darko/Radovi/Org/Wikith/Rezimei/Lektira.bib"
                      "/home/darko/Radovi/Org/Wikith/Projekti/LogMathPhy/LogMathPhy.bib"
                      "/home/darko/Radovi/Org/Wikith/Projekti/Continuum/Continuum.bib"
                      "/home/darko/Radovi/Org/Wikith/Projekti/Logistika/Logistika.bib"
                      "/home/darko/Radovi/Org/Wikith/Projekti/Complexity/Complexity.bib"
                      "/home/darko/Radovi/Org/Wikith/Projekti/HegelDiaLog/HegelDiaLog.bib"
                      ))

(use-package bibtex
  :init
  (setq bibtex-completion-additional-search-fields '(keywords))
  (setq bibtex-completion-bibliography bibliographies)
  )

(use-package ebib
  :init
  (setq ebib-index-window-size 26)
  (setq ebib-keywords-field-keep-sorted t)
  (setq ebib-keywords-file "~/Radovi/Org/Dict/org-mode")
  (setq ebib-keywords-file-save-on-exit (quote always))
  (setq ebib-preload-bib-files bibliographies)
  :bind
  (("C-c e" . ebib)
   :map ebib-multiline-mode-map
   ("C-c C-c" . ebib-quit-multiline-buffer-and-save)
   ("C-c C-q" . ebib-cancel-multiline-buffer)
   ("C-c C-s" . ebib-save-from-multiline-buffer)
   )
  )

(use-package org-ref)

;;;;;;;;;
;; SML ;;
;;;;;;;;;

(use-package sml-mode
  :init
  (add-hook 'sml-mode-hook 'display-line-numbers-mode)
  :bind (:map sml-mode-map (" " . sml-electric-space))
  )
