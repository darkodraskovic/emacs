(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(c-default-style
   (quote
    ((c++-mode . "stroustrup")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(comint-move-point-for-output t)
 '(comint-scroll-to-bottom-on-input t)
 '(compilation-message-face (quote default))
 '(compilation-scroll-output t)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "04232a0bfc50eac64c12471607090ecac9d7fd2d79e388f8543d1c5439ed81f5" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "fe20c1ea61a2836a5cea69963865b5b8df8c480ccaf3f11ad7f2e1f543f6c274" "7c4aebe99e804e7b41f34e8e2366cadd61c07977e72e4a0ee9498000a95c5d86" default)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(desktop-path (quote ("~/.emacs.d/" "~" "~/.emacs.d/desktop")))
 '(dired-dwim-target t)
 '(dired-find-subdir nil)
 '(ess-R-font-lock-keywords
   (quote
    ((ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:constants . t)
     (ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:assign-ops . t)
     (ess-R-fl-keyword:%op% . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers . t)
     (ess-fl-keyword:operators . t)
     (ess-fl-keyword:delimiters)
     (ess-fl-keyword:=)
     (ess-R-fl-keyword:F&T))))
 '(fci-rule-color "#073642")
 '(flycheck-highlighting-mode (quote symbols))
 '(global-auto-revert-mode t)
 '(grep-command "grep -nHir -e ")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(irony-supported-major-modes (quote (c++-mode c-mode objc-mode glsl-mode)))
 '(jdee-run-working-directory "/home/darko/Documents/java/")
 '(jdee-server-dir "/home/darko/Programs/jdee-bundle")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(nxml-child-indent 4)
 '(org-link-frame-setup
   (quote
    ((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file)
     (wl . wl-other-frame))))
 '(org-refile-use-outline-path (quote file))
 '(org-src-fontify-natively t)
 '(org-tag-faces nil)
 '(package-selected-packages
   (quote
    (flycheck-mode smartparens rainbow-delimiters highlight-indent-guides flycheck-pyflakes conda company-anaconda anaconda-mode company-go company-rtags auto-complete-clang cmake-ide clang-format all-the-icons-dired all-the-icons neotree helm-gtags flx-ido projectile markdown-preview-mode csharp-mode csv-mode json-mode indium gnu-elpa-keyring-update company-emacs-eclim eclim ag go-rename ess-R-data-view ess-smart-equals ess-smart-underscore ess-view buffer-move helm-esa company-glsl fzf angular-snippets angular-mode js2-highlight-vars company-quickhelp monokai-theme yasnippet-classic-snippets flymake-lua company-lua docker-compose-mode dockerfile-mode markdown-mode+ flycheck-irony irony-eldoc company-irony-c-headers company-irony company-jedi expand-region wrap-region sml-mode bongo processing-snippets processing-mode pyenv-mode virtualenv tabbar moz inform-mode fuzzy flymake column-marker color-theme-sanityinc-solarized cl-generic ac-js2 ac-anaconda)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values (quote ((require-final-newline))))
 '(sentence-end-double-space nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(tab-width 4)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"])
 '(yas-indent-line (quote auto)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;
;; FONTS ;;
;;;;;;;;;;;

(set-frame-font "DejaVu Sans Mono 13" nil t)

;;;;;;;;;;;
;; LOADS ;;
;;;;;;;;;;;

(load "~/Radovi/Org/Dict/my_emacs_abbrev.el")

;;;;;;;;;;;;;;;
;; VARIABLES ;;
;;;;;;;;;;;;;;;

(setq default-directory "~/Radovi/Org/" )
(setq bookmark-save-flag 1)
(setq make-backup-files nil)
(tool-bar-mode -1)
(setq fci-rule-column 80)
(setq global-auto-revert-mode t)

;; tabs&indents
(setq-default indent-tabs-mode nil)

;; split vertically when vising new buffer
(setq split-height-threshold nil)
(setq split-width-threshold 0)

(setq buffer-move-stay-after-swap t)

(setq scroll-conservatively 10)
(setq scroll-margin 7)

;;;;;;;;;;;;;;;;;;;;;;;;
;; GLOBAL KEYBINDINGS ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-i") 'imenu)
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key "\C-j" 'newline-and-indent)

(global-set-key "\C-c\C-k" 'copy-line)

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

(eval-when-compile
  (require 'use-package))

;;;;;;;;;;;;;;;;
;; COMMANDS   ;;
;;;;;;;;;;;;;;;;

(transient-mark-mode 1)
(defun select-current-line ()
  "Select the current line."
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

(global-set-key "\C-c\C-k" 'select-current-line)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

;; (global-set-key "\C-c\C-u" 'comment-or-uncomment-region-or-line)
(global-set-key "\C-cu" 'comment-or-uncomment-region-or-line)

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

(global-set-key [?\C-c ?d] 'duplicate-line-or-region)

(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun region-remove-whitespace ()
  "Remove all newlines and double spaces in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match " " nil t))
    (goto-char (point-min))
    (while (search-forward "  " nil t) (replace-match " " nil t))
    (goto-char (point-min))
    (while (search-forward "- " nil t) (replace-match "" nil t))
    ;; (insert "\n")
    ))

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

;; (setq google-this-keybind (kbd "s-/"))
;; (google-this-mode 1)

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

;; DIRED
;; (require 'dired+)
;; (setq dired-listing-switches "-aBhl  --group-directories-first")

;; NEOTREE
(require 'all-the-icons)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-window-fixed-size nil)

;; YASNIPPET
;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all)
;; (setq yas-snippet-dirs (append yas-snippet-dirs '("~/emacs.d/snippets")))


;; AUTO-COMPLETE
;; (require 'auto-complete-config)
;; (ac-config-default)

;; (setq ac-dictionary-files nil)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict" )
;; (add-to-list 'ac-dictionary-directories "~/Radovi/Org/Dict" )

;; (global-display-line-numbers-mode 1)

;; FLYMAKE
;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;; FLYCHECK
(require 'flycheck)
;;OR
;; (req-package flycheck
;;   :config
;;   (progn
;;     (global-flycheck-mode)))

(setq flycheck-display-errors-function
      #'flycheck-display-error-messages-unless-error-list)

;; COMPANY
(require 'company)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 0)
;; (setq company-show-numbers t)
(company-quickhelp-mode)

;; HIPPIE
(global-set-key "\M- " 'hippie-expand)
;; completing the name of the file in the buffer. 
;; (fset 'my-complete-file-name
;;       (make-hippie-expand-function '(try-complete-file-name-partially
;; 				     try-complete-file-name)))
;; (global-set-key "\M-\\" 'my-complete-file-name)

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

;; helm-gtags
(setq helm-gtags-suggested-key-mapping t)
(setq helm-gtags-prefix-key "\C-c t")
(require 'helm-gtags)

;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;
;; PROG LANG  ;;
;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;

(defun my-ac-auto-t-hook ()
  (auto-complete-mode)
  (setq-local ac-auto-start 3))

(defun my-ac-auto-nil-hook ()
  (auto-complete-mode)
  (setq-local ac-auto-start nil))
  ;; (define-key ac-mode-map (kbd "M-/") 'auto-complete)

(defun my-f5-compile-hook () (local-set-key [f5] 'compile))

;;;;;;;;;;;;;;;;
;; LISP       ;;
;;;;;;;;;;;;;;;;

(add-hook 'emacs-lisp-mode-hook 'my-ac-auto-t-hook)

;;;;;;;;;;;;;;;;;;
;; SHELL-SCRIPT ;;
;;;;;;;;;;;;;;;;;;

(add-hook 'sh-mode-hook 'my-ac-auto-t-hook)

;;;;;;;;;;;;;;;;
;; C++        ;;
;;;;;;;;;;;;;;;;

(setq-default c-basic-offset 4)

;; IRONY-MODE
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; Like RTags, Irony requires a compilation database. To create one run the following:
;; $ cd /path/to/project/root
;; $ cmake . -DCMAKE_EXPORT_COMPILE_COMMANDS=1
;; cf. https://clang.llvm.org/docs/HowToSetupToolingForLLVM.html

;; (setq-default irony-cdb-compilation-databases '(irony-cdb-json
;;                                                 irony-cdb-libclang
;;                                                 irony-cdb-clang-complete
;;                                                 ))
;; COMPANY-IRONY
;; (require 'company-irony)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async)
  ;; (define-key irony-mode-map [remap completion-at-point]
  ;;   'counsel-irony)
  ;; (define-key irony-mode-map [remap complete-symbol]
  ;;   'counsel-irony)
  )
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(setq company-backends (delete 'company-semantic company-backends))

(require 'cc-mode)
(define-key c-mode-map (kbd "M-/") 'company-complete)
(define-key c++-mode-map (kbd "M-/") 'company-complete)

;; COMPANY-IRONY-C-HEADERS
(require 'company-irony-c-headers)

(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

;; IRONY-ELDOC
(add-hook 'irony-mode-hook #'irony-eldoc)

;; FLYCHECK-IRONY
(eval-after-load 'flycheck
   '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; STANDARD HOOKS
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'eldoc-mode)
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'display-line-numbers-mode)

(add-hook 'c++-mode-hook 'my-f5-compile-hook)
(add-hook 'c++-mode-hook 'my-ac-auto-nil-hook)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;;;;;;;;;;;;;;;
;; CMAKE      ;;
;;;;;;;;;;;;;;;;

;; (require 'rtags)
;; (cmake-ide-setup)

(require 'cmake-mode)
(add-hook 'cmake-mode-hook 'flycheck-mode)
(add-hook 'cmake-mode-hook 'company-mode)
(add-hook 'cmake-mode-hook 'display-line-numbers-mode)
(add-hook 'cmake-mode-hook 'my-ac-auto-nil-hook)
;; (add-hook 'cmake-mode-hook 'my-ac-auto-t-hook)

;;;;;;;;;;;;;;;
;; GLSL mode ;;
;;;;;;;;;;;;;;;

(use-package company-glsl
  :config
  (when (executable-find "glslangValidator")
    (add-to-list 'company-backends 'company-glsl)))

(add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.shader\\'" . glsl-mode))

(add-hook 'glsl-mode-hook 'display-line-numbers-mode)

(add-hook 'glsl-mode-hook 'my-ac-auto-t-hook)
(add-hook 'glsl-mode-hook 'my-f5-compile-hook)

;;;;;;;;;;;;;;;;
;; PYTHON     ;;
;;;;;;;;;;;;;;;;

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python3" . python-mode)
  :config
  (add-hook 'python-mode-hook 'display-line-numbers-mode)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'elpy-mode)
  (add-hook 'python-mode-hook 'company-mode)
  ;; (add-hook 'python-mode-hook 'my-ac-auto-nil-hook)

  (use-package flycheck
    :ensure t
    :config
    (setq flycheck-python-pylint-executable "pylint3"))

  (use-package company-jedi
    :ensure t
    :init
    (add-to-list 'company-backends 'company-jedi))
  )

;; (use-package python
;;   :mode ("\\.py\\'" . python-mode)
;;   :interpreter ("python3" . python-mode)
;;   :config
;;   (add-hook 'python-mode-hook 'my-ac-auto-nil-hook)
;;   (add-hook 'python-mode-hook 'display-line-numbers-mode)
;;   (add-hook 'python-mode-hook 'flycheck-mode)
;;   (add-hook 'python-mode-hook 'pyvenv-mode)
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;;   (add-hook 'python-mode-hook 'company-mode)
  
;;   (use-package anaconda-mode
;;     :ensure t
;;     :bind ("C-c C-d" . anaconda-mode-show-doc)
;;     :config
;;     (setq python-shell-interpreter "ipython")
;;     )

;;   (use-package company-anaconda
;;     :ensure t
;;     :init
;;     (add-to-list 'company-backends 'company-anaconda)
;;     ;; (add-to-list 'company-backends '(company-anaconda :with company-capf))
;;     )

;;   (use-package flycheck
;;     :ensure t
;;     :init
;;     (setq flycheck-python-pylint-executable "pylint3"))
;;   )

;; ;; ;; CONDA
;; ;; (setq conda-env-home-directory (expand-file-name "~/anaconda3/"))
;; ;; (require 'conda)
;; ;; (conda-env-initialize-interactive-shells) ;; interactive shell support
;; ;; (conda-env-initialize-eshell) ;; eshell support
;; ;; (conda-env-autoactivate-mode t) ;; auto-activation

;;;;;;;;;;;;
;; GOLANG ;;
;;;;;;;;;;;;
;; go get -u github.com/rogpeppe/godef
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u github.com/mdempsky/gocode OR for modules go get -u github.com/stamblerre/gocode
;; go get -u golang.org/x/lint/golint

;; PATH
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

;; USE-PACKAGE
(use-package go-mode
  :init
  (setenv "GOPATH" "/home/darko/go")
  (add-to-list 'exec-path "/home/darko/go/bin")
  (add-hook 'go-mode-hook 'flycheck-mode)
  (add-hook 'go-mode-hook 'display-line-numbers-mode)
  (add-hook 'go-mode-hook 'company-mode)
  (add-hook 'go-mode-hook 'my-ac-auto-nil-hook)
  (add-hook 'before-save-hook 'gofmt-before-save) ; call Gofmt before saving  
  :bind
  (("M-." . godef-jump) ; Godef jump key binding
   ("M-*" . pop-tag-mark)
   ("C-c C-r" . go-remove-unused-imports)
   ("C-c i" . go-goto-imports)
   ("C-c C-f" . gofmt)
   ("C-c k" . godoc-at-point))  
  :config
  (setq gofmt-command "goimports") ; use goimports instead of go-fmt
  (setq tab-width 4)
  (setq company-idle-delay 0.3)
  
  (use-package company-go
  :init
  (add-to-list 'company-backends 'company-go))
  )

;;;;;;;;;;
;; JAVA ;;
;;;;;;;;;;
(require 'processing-mode)

(add-hook 'java-mode-hook 'my-ac-auto-nil-hook)

(require 'eclim)
(setq eclim-executable "/home/darko/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")
(setq eclimd-executable "/home/darko/.p2/pool/plugins/org.eclim_2.8.0/bin/eclimd")
(setq eclimd-default-workspace "/home/darko/eclipse-workspace")
;; (setq eclimd-autostart t)

;; ;; add the emacs-eclim source
;; (require 'ac-emacs-eclim)
;; (ac-emacs-eclim-config)

(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(setq company-emacs-eclim-ignore-case t)

(defun my-java-mode-hook ()
  (eclim-mode t)
  (company-mode t))
(add-hook 'java-mode-hook 'my-java-mode-hook)

(add-hook 'java-mode-hook (lambda ()
                            (local-set-key [f5] 'eclim-run-class)
                            (local-set-key "\M- " 'company-complete)
                            ;; (local-set-key (kbd "C-c C-p d") 'processing-find-in-reference)
                            (local-set-key (kbd "C-c k") 'eclim-java-browse-documentation-at-point)
                            ;; (setq-local company-minimum-prefix-length 0)
                            ;; (setq-local company-idle-delay .3)
                            ))

;;;;;;;;;;;;;;;;
;; TYPESCRIPT ;;
;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; TIDE: TypeScript Interactive Development Environment for Emacs
;; cf. https://github.com/ananthakumaran/tide
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
  (local-set-key "\C-c\C-d" 'tide-documentation-at-point))
  
(setq tide-always-show-documentation t)
;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(setq typescript-indent-level 2)
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; TSLint is an extensible static analysis tool that checks TypeScript code for readability, maintainability, and functionality errors.
;; sudo npm install tslint typescript -g (cf. https://palantir.github.io/tslint/usage/cli/)
(flycheck-add-mode 'typescript-tslint 'ng2-ts-mode)
;; sudo apt install tidy
;; (flycheck-add-mode 'html-tidy 'ng2-html-mode)

;; TS-COMINT (REPL): Run a TypeScript interpreter in an inferior process window
;; sudo npm install -g tsun (cf. https://github.com/josteink/ts-comint)
(add-hook 'typescript-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-e") 'ts-send-last-sexp)
            (local-set-key (kbd "C-M-x") 'ts-send-last-sexp-and-go)
            (local-set-key (kbd "C-c b") 'ts-send-buffer)
            (local-set-key (kbd "C-c C-b") 'ts-send-buffer-and-go)
            (local-set-key (kbd "C-c l") 'ts-load-file-and-go)))

;;;;;;;;;;;;;;;;
;; JAVASCRIPT ;;
;;;;;;;;;;;;;;;;

(setq-default js-indent-level 2)
(add-hook 'js-mode-hook 'js2-minor-mode)

;; tide
(add-hook 'js2-mode-hook #'setup-tide-mode)
;; ac
(add-hook 'js2-mode-hook 'my-ac-auto-nil-hook)

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

;;;;;;;;;;
;; HTML ;;
;;;;;;;;;;

(add-hook 'html-mode-hook 'my-ac-auto-t-hook)
(add-hook 'nxml-mode-hook 'my-ac-auto-t-hook)

;;;;;;;;;
;; CSS ;;
;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-hook 'css-mode-hook 'my-ac-auto-t-hook)

;;;;;;;;;;;;;;
;; WEB-MODE ;;
;;;;;;;;;;;;;;

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gohtml\\'" . web-mode))

(setq web-mode-engines-alist
      '(("go"    . "\\.gohtml\\'")))

(add-hook 'web-mode-hook 'my-ac-auto-t-hook)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)

(setq css-indent-offset 2)
;;;;;;;;;;;;;;;;;;;;
;; DOCKER-COMPOSE ;;
;;;;;;;;;;;;;;;;;;;;

(require 'docker-compose-mode)
(add-hook 'docker-compose-mode-hook 'my-ac-auto-t-hook)

;;;;;;;;;;;;;;
;; LUA-MODE ;;
;;;;;;;;;;;;;;

(setq lua-indent-level 4)

;; company-lua
(require 'company-lua)
(defun my-lua-mode-company-init ()
  (setq-local company-backends '((company-lua
                                  company-etags
                                  company-dabbrev-code
                                  company-yasnippet))))
(add-hook 'lua-mode-hook #'my-lua-mode-company-init)
(add-hook 'lua-mode-hook 'company-mode)

(add-hook 'lua-mode-hook 'hs-minor-mode)
(add-hook 'lua-mode-hook 'imenu-add-menubar-index)

;; (require 'flymake-lua)
;; (add-hook 'lua-mode-hook 'flymake-lua-load)

(add-hook 'lua-mode-hook 'my-ac-auto-nil-hook)
(add-hook 'lua-mode-hook 'flycheck-mode)

(add-hook 'lua-mode-hook '(lambda ()
                            (local-set-key [f5] 'compile)
                            (local-set-key "\C-x\C-e" 'lua-send-defun)
                            (local-set-key "\C-c\C-l" 'lua-send-current-line)
                            (local-set-key "\C-c\C-r" 'lua-send-region)
                            (local-set-key "\C-c\C-b" 'lua-send-buffer)
                            ;; (local-set-key "\M-g\M-n" 'flymake-goto-next-error)
                            ;; (local-set-key "\M-g\M-p" 'flymake-goto-prev-error)
                            ))

;;;;;;;;;;;;;;
;; ELM-MODE ;;
;;;;;;;;;;;;;;

(flycheck-elm-setup)
(add-hook 'elm-mode-hook 'flycheck-mode)

;; company
(add-hook 'elm-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-elm)
;; (with-eval-after-load 'company
;;   (add-to-list 'company-backends 'company-elm))
(add-hook 'elm-mode-hook #'elm-oracle-setup-completion)

(add-hook 'elm-mode-hook 'my-ac-auto-t-hook)

(setq elm-tags-on-save t)
(setq elm-tags-exclude-elm-stuff nil)

(setq elm-format-on-save t)

;;;;;;;;;;;;
;; R-MODE ;;
;;;;;;;;;;;;

(require 'ess-smart-underscore)
(add-to-list 'auto-mode-alist '("\\.rmd\\'" . markdown-mode))
(require 'ess-r-mode)

;;;;;;;;;;;;;;
;; ORG-MODE ;;
;;;;;;;;;;;;;;

(require 'org-install)
(require 'org)

(setq org-agenda-files '("~/Radovi/Org/Wikidev/Projects/Mainflux/"
                         "~/Radovi/Org/Wikith/Projekti/Organizer.org"
                         "~/Radovi/Org/Wikidev/Projects/Experience/Experience.org"
                         ))


(setq org-directory "~/Radovi/Org/Wikith")
(setq org-html-validation-link nil)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.wiki$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time)

;; highlight src syntax
(setq org-src-fontify-natively t)

;; hooks for minor mods
(add-hook 'org-mode-hook '(lambda ()
                            (setq-local electric-pair-pairs
                            '(
                              (?\/ . ?\/)
                              ;; (?\* . ?\*)
                              ))
                            (local-set-key "\C-c\[" 'helm-bibtex)
                            ))
(add-hook 'org-mode-hook 'my-ac-auto-nil-hook)

;; TEXT MODE
;; (add-hook 'text-mode-hook 'my-ac-auto-t-hook)

;; REMEMBER MODE
(define-key global-map "\C-cc" 'org-capture)
;; file OR file+headline OR file+datetree
(setq org-capture-templates
      '(
        ("i" "Ideja" entry (file+headline "~/Radovi/Org/Wikith/Ideje/Ideje_03.org" "Ideje")        
         "* IDEJA \n%U\t*%f*\n%i\n\n%?")
        ("r" "Rezime" entry (file+headline "~/Radovi/Org/Wikith/Rezimei/Rezimei_01.org" "Rezimei")
         "* %?\n\n%U")        
        ("e" "Resurs" entry (file+headline "~/Radovi/Org/Wikith/Resursi/Resursi_01.org" "Resursi")
         "* %?\n\n%U")
        ("c" "Citat" entry (file+headline "~/Radovi/Org/Wikith/Citati/Citati_01.org" "Citati")
         "* %?\n\n%U\n%i")
        ("j" "Journal" entry (file+headline "~/Radovi/Org/Wikith/Projekti/Journal.org" "Entries")
         "* %?\n\n%U")        
        ("t" "Todo" entry (file+headline "~/Radovi/Org/Wikith/Projekti/Organizer.org" "Todo")
         "* TODO %?\n\n%U")        
        ))


; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; CUSTOM TAGS

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
    (ac-clear-dictionary-cache)))

(add-hook 'org-mode-hook (lambda ()
                           (local-set-key "\C-c\C-t" 'add-tag-to-org-mode-dict)
                           ))

;; WRAP-REGION

(require 'wrap-region)

(add-hook 'org-mode-hook #'wrap-region-mode)

(wrap-region-add-wrapper "=" "=" nil 'org-mode) ; select region, hit = then region -> =region= in org-mode
(wrap-region-add-wrapper "*" "*" nil 'org-mode) ; select region, hit * then region -> *region* in org-mode
(wrap-region-add-wrapper "/" "/" nil 'org-mode) ; select region, hit / then region -> /region/ in org-mode
(wrap-region-add-wrapper "_" "_" nil 'org-mode) ; select region, hit _ then region -> _region_ in org-mode
(wrap-region-add-wrapper "+" "+" nil 'org-mode) ; select region, hit + then region -> +region+ in org-mode
(wrap-region-add-wrapper "~" "~" nil 'org-mode) ; select region, hit ~ then region -> ~region~ in org-mode

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

;; HELM-BIBTEX

(setq bibtex-completion-additional-search-fields '(keywords))
(setq bibtex-completion-bibliography bibliographies)

(add-hook 'bibtex-mode-hook 'my-ac-auto-t-hook)

;; EBIB

(global-set-key "\C-ce" 'ebib)

(eval-after-load 'ebib
  '(progn
     (define-key ebib-multiline-mode-map
       "\C-c\C-c" 'ebib-quit-multiline-buffer-and-save)
     (define-key ebib-multiline-mode-map
       "\C-c\C-q" 'ebib-cancel-multiline-buffer)
     (define-key ebib-multiline-mode-map
       "\C-c\C-s" 'ebib-save-from-multiline-buffer)
     (setq ebib-index-window-size 26)
     (setq ebib-keywords-field-keep-sorted t)
     (setq ebib-keywords-file "~/Radovi/Org/Dict/org-mode")
     (setq ebib-keywords-file-save-on-exit (quote always))
     (setq ebib-preload-bib-files bibliographies)))

;; ORG-REF

(require 'org-ref)
(setq org-latex-prefer-user-labels t)
(setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))

;;;;;;;;;;;;;;;;;;
;; SML + TIDAL  ;;
;;;;;;;;;;;;;;;;;;

(require 'haskell-mode)
(require 'tidal)

(add-hook 'sml-mode-hook 'display-line-numbers-mode)

(add-hook 'sml-mode-hook 'my-ac-auto-t-hook)
(add-hook 'sml-mode-hook '(lambda ()
                            (local-set-key " " 'sml-electric-space)
                            ))

;;;;;;;;;;;;;;;
;; SOLARIZED ;;
;;;;;;;;;;;;;;;

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use less bolding
;; (setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
;; (setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

;; Avoid all font-size changes
;; (setq solarized-height-minus-1 1.0)
;; (setq solarized-height-plus-1 1.0)
;; (setq solarized-height-plus-2 1.0)
;; (setq solarized-height-plus-3 1.0)
;; (setq solarized-height-plus-4 1.0)
