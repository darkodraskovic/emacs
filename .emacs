;;;;;;;;;
;; VAR ;;
;;;;;;;;;

(setq package-check-signature nil)

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

(set-frame-font "DejaVu Sans Mono 11" nil t)

(load "~/Radovi/Org/Dict/my_emacs_abbrev.el")

(load-theme 'tsdh-dark t)

(setenv "PKG_CONFIG_PATH" "/usr/local/lib/pkgconfig")
(setenv "LD_LIBRARY_PATH" "/usr/local/lib")
(setenv "PATH" (concat "/opt/amiga/bin" (getenv "PATH")))

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
        ("melpa" . "http://melpa.org/packages/")))
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
  (setq treemacs-width 24)
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
  :ensure t
  )

;;;;;;;;;;;;;;
;; MODES    ;;
;;;;;;;;;;;;;;

;; electric-pair
(setq electric-pair-pairs nil)
(setq electric-pair-text-pairs nil)
(electric-pair-mode 1)

;; show-paren-mode
(show-paren-mode 1)

;; "undo" (and “redo”) changes in the window configuration with the key commands ‘C-c
(winner-mode 1)

;; auto-load minor modes
(global-visual-line-mode 1)

;; (desktop-save-mode 1)

;; It allows you to move the current line using M-up / M-down
;; if a region is marked, it will move the region instead.
(use-package move-text
  :ensure t
  :init (move-text-default-bindings)
)

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
;; (setq helm-grep-ag-command "ag --line-numbers -S --hidden --color --color-match '31;43' --nogroup %s %s %s")
(setq helm-grep-ag-command "rg --color=always --smart-case --no-heading --line-number %s %s %s")
(setq helm-grep-ag-pipe-cmd-switches '("--color-match '31;43'"))
(global-set-key (kbd "M-g a") 'helm-do-grep-ag)

;; incremental (file) find name search
(global-unset-key (kbd "C-c h /"))
(global-set-key (kbd "M-g f") 'helm-find)

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

(use-package flx-ido
  :ensure t
  :init (flx-ido-mode 1)
  :config (setq ido-use-faces nil) ;; disable ido faces to see flx highlights. OR (setq flx-ido-use-faces nil)
)

(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs '("~/Radovi/Linux/.emacs.d/snippets"))
  (yas-global-mode 1)
  :config
  (yas-reload-all)
  )

;; FLYCHECK
(use-package flycheck
  :ensure t
  :init
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  )

;; COMPANY
(use-package company-quickhelp
  :ensure t
  )

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'after-init-hook 'company-quickhelp-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  ;; (setq company-show-numbers t)
  (delete 'company-clang company-backends)
  :bind ("M-/" . company-dabbrev)
  )

;; HIPPIE
(global-set-key "\M- " 'hippie-expand)

;; EXPAND-REGION

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

(use-package which-key
  :ensure t
  :init
  (setq which-key-idle-delay 0.5)
  :config
  (which-key-mode)
  )

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

;;;;;;;;;;;;;;;;
;; PROJECTILE ;;
;;;;;;;;;;;;;;;;

;; Recentf is a minor mode that builds a list of recently opened files
;; (recentf-mode 1)
;; (setq recentf-max-menu-items 25)
;; (setq recentf-max-saved-items 25)
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)

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
  )
(projectile-mode 1)

;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;
;; PROG LANG  ;;
;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;
;; LSP-MODE ;;
;;;;;;;;;;;;;;

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (lsp-mode . display-line-numbers-mode))
  :bind ("M-." . lsp-find-definition)
  :config
  (setq lsp-disabled-clients '(typescript angular-ls))
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-delay 1)
  (setq lsp-ui-doc-position 'at-point)
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

(use-package cmake-mode
  :ensure t
  )

(use-package asm-mode
  :hook ((asm-mode . display-line-numbers-mode))
  :init (add-to-list 'auto-mode-alist '("\\.asm\\'" . asm-mode))
  )

;;;;;;;;;;;;;;;;
;; CMAKE      ;;
;;;;;;;;;;;;;;;;

(use-package cmake-mode
  :hook ((cmake-mode . flycheck-mode)
         (cmake-mode . display-line-numbers-mode)
         (cmake-mode . lsp-deferred)))

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

(use-package python-mode
  :ensure t
  :commands python-mode
  :hook ((python-mode . lsp-deferred) (python-mode . pyvenv-mode))
  )

(use-package pyvenv
  :ensure t
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

(use-package go-mode
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JAVASCRIPT/TYPESCRIPT ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package js
  :ensure t
  :commands js-mode
  :hook (js-mode . lsp-deferred)
  )

(use-package typescript-mode
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

(use-package json
  :ensure t
  :commands json-mode
  :hook (json-mode . lsp-deferred)
  :config (setq js-indent-level 2)
  (setq tab-width 2)
  )


;;;;;;;;;;;;;;
;; WEB-MODE ;;
;;;;;;;;;;;;;;

(use-package web-mode
  :ensure t
  :mode (("\\.gohtml\\'" . web-mode) ("\\.html?\\'" . web-mode))
  :init   (setq web-mode-engines-alist
                '(("go"    . "\\.gohtml\\'")))
  :config ((setq web-mode-markup-indent-offset 2)
           (setq web-mode-enable-current-element-highlight t)
           (setq nxml-child-indent 4 nxml-attribute-indent 4)
           (setq css-indent-offset 2)
           )
  )

(use-package css-mode
  :ensure t
  :mode ("\\.scss\\'" . css-mode)
  )

;;;;;;;;;;;;;;;;;;;;
;; DOCKER-COMPOSE ;;
;;;;;;;;;;;;;;;;;;;;

(use-package docker-compose-mode
  :ensure t
  )

;;;;;;;;;;;;;;
;; LUA-MODE ;;
;;;;;;;;;;;;;;

(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua"
  :hook (lua-mode . lsp-deferred)
  ;; :init (setq lsp-clients-lua-language-server-install-dir "/home/darko/Programs/lua-language-server/")
  ;; (setq lsp-clients-lua-language-server-install-dir "/home/darko/Programs/lua-language-server/bin/Linux/lua-language-server")
  ;; (setq lsp-clients-lua-language-server-main-location "/home/darko/Programs/lua-language-server/main.lua")
  :config
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents t)
  (setq lua-prefix-key nil)
  )

;;;;;;;;;;;;;;
;; ELM-MODE ;;
;;;;;;;;;;;;;;

(use-package elm-mode
  ;; :ensure t
  :commands elm-mode
  :init
   (setq lsp-elm-elm-path "/usr/local/bin/elm")
   (setq lsp-elm-elm-language-server-path "/usr/local/bin/elm-language-server")
  :hook (elm-mode . lsp-deferred)
  )

;;;;;;;;
;; C# ;;
;;;;;;;;

(use-package csharp-mode
  ;; :ensure t
  :commands csharp-mode
  :hook (csharp-mode . lsp-deferred)
  )

;;;;;;;;;;
;; Rust ;;
;;;;;;;;;;

(use-package rust-mode
  ;; :ensure t
  :commands rust-mode
  :hook (rust-mode . lsp-deferred))

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
                            ))
    (company-dict-refresh)
    ))

(use-package wrap-region
  :ensure t
  :config
  (wrap-region-add-wrapper "=" "=" nil 'org-mode) ; select region, hit = then region -> =region= in org-mode
  (wrap-region-add-wrapper "*" "*" nil 'org-mode) ; select region, hit * then region -> *region* in org-mode
  (wrap-region-add-wrapper "/" "/" nil 'org-mode) ; select region, hit / then region -> /region/ in org-mode
  (wrap-region-add-wrapper "_" "_" nil 'org-mode) ; select region, hit _ then region -> _region_ in org-mode
  (wrap-region-add-wrapper "+" "+" nil 'org-mode) ; select region, hit + then region -> +region+ in org-mode
  (wrap-region-add-wrapper "~" "~" nil 'org-mode) ; select region, hit ~ then region -> ~region~ in org-mode
  )

(use-package org-mode
  :after (org-ref)
  :mode (("\\.org$" . org-mode) ("\\.wiki$" . org-mode))
  :init
  (add-hook 'org-mode-hook #'wrap-region-mode)
  (setq org-directory "~/Radovi/Org/Wikith")
  (setq org-html-validation-link nil)
  (setq org-log-done 'time)
  (setq org-src-fontify-natively t)
  (setq org-agenda-files '("~/Radovi/Org/Wikith/Projekti/Organizer.org"
                           "~/Radovi/Org/Wikidev/Projects/Organizer.org"
                           "~/Radovi/Org/Wikidev/Projects/Mainflux/"
                           "~/Radovi/Org/Wikidev/Projects/Mainflux/Ashvin"
                         ))
  (setq org-capture-templates '(
          ("r" "Rezime" entry (file+headline "~/Radovi/Org/Wikith/Rezimei/Rezimei_01.org" "Rezimei") "* %?\n\n%U")
          ("c" "Citat" entry (file+headline "~/Radovi/Org/Wikith/Citati/Citati_01.org" "Citati") "* %?\n\n%U\n%i")
          ("i" "Ideja" entry (file+headline "~/Radovi/Org/Wikith/Ideje/Ideje_03.org" "Ideje") "* IDEJA \n%U\t*%f*\n%i\n\n%?")
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
  ;; :config (electric-indent-local-mode -1)
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
                      "/home/darko/Radovi/Org/Wikith/Projekti/Continuum/Continuum.bib"
                      "/home/darko/Radovi/Org/Wikith/Projekti/Logistika/Logistika.bib"
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

(use-package org-ref
  :ensure t
  )

;;;;;;;;;
;; SML ;;
;;;;;;;;;

(use-package sml-mode
  :ensure t
  :init
  (add-hook 'sml-mode-hook 'display-line-numbers-mode)
  :bind (:map sml-mode-map (" " . sml-electric-space))
  )

;;;;;;;;;
;; WIN ;;
;;;;;;;;;

(when (string-equal system-type "windows-nt")
  (let ((mypaths
         '(
           "C:/Python39/"
           "C:/Python39/Scripts/"
           "C:/Program Files/nodejs/"
           "C:/ProgramData/chocolatey/bin/"
           "C:/msys64/mingw64/bin/"
           "C:/msys64/usr/bin/"
           ))
        )
    (setenv "PATH" (mapconcat 'identity mypaths ";"))
    (setq exec-path (append mypaths (list "." exec-directory))))
  ;; (w32-register-hot-key [s-]) with w32-lwindow-modifier bound to super
  ;; disables all the Windows’ own Windows key based shortcuts.
  (setq w32-lwindow-modifier 'super)
  (w32-register-hot-key [s-])
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(tidal python-mode pyenv-mode restart-emacs pg emacsql-sqlite3 emacsql-sqlite emacsql-psql emacsql-mysql dash-functional yasnippet-snippets wrap-region which-key web-mode use-package typescript-mode treemacs-projectile sml-mode pyvenv protobuf-mode org-ref move-text markdown-mode+ magit lua-mode lsp-ui lsp-treemacs json-mode helm-lsp go-mode gnu-elpa-keyring-update glsl-mode fzf flycheck flx-ido expand-region ebib dockerfile-mode docker-compose-mode csv-mode company-quickhelp company-dict cmake-mode ag)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
