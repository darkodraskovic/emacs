;;;;;;;;;;;
;; magit ;;
;;;;;;;;;;;

(use-package magit
  :ensure t
  )


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
  (setq lsp-ui-doc-delay .5)
  (setq lsp-ui-doc-show-with-cursor 1)
  (setq lsp-ui-doc-position 'at-point)
  )

(use-package helm-lsp
  :ensure t
  :config
  (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
  )

;;;;;;;;;;
;; bash ;;
;;;;;;;;;;

(use-package sh-mode
  :hook (sh-mode . display-line-numbers-mode)
  )

;;;;;;;;;;;;;;;;
;; CPP        ;;
;;;;;;;;;;;;;;;;

(use-package clang-format
  :ensure t
  )

(defcustom my-clang-format-enabled t
  "If t, run clang-format on mm/c/cpp buffers upon saving."
  :group 'clang-format
  :type 'boolean
  :safe 'booleanp)
;; clang-format-on-save
(defun my-clang-format-before-save ()
  "Usage: (add-hook 'before-save-hook 'clang-format-before-save)."
  (interactive)
  (if (and my-clang-format-enabled (file-exists-p (expand-file-name ".clang-format" (projectile-project-root))))
      (when (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode)) (clang-format-buffer))
    (message "my-clang-format-enabled is false"))
  )
(add-hook 'before-save-hook 'my-clang-format-before-save)

;; cf. https://clangd.llvm.org/installation.html for project setup
(use-package c++
  :mode (("\\.h\\'" . c++-mode) ("\\.cpp\\'" . c++-mode))
  :commands c++-mode
  :hook
  (c++-mode . lsp-deferred)
  )

(use-package c
  :commands c-mode
  :init (setq lsp-clients-clangd-args '("--header-insertion=never"))
  :hook (c-mode . lsp-deferred)
  )

(defun my-asm-mode-hook ()
  ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
  (local-unset-key (vector asm-comment-char))
  ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
  (setq tab-always-indent (default-value 'tab-always-indent))
  (setq asm-comment-char "/")
  )

(use-package asm-mode
  :hook ((asm-mode . display-line-numbers-mode)
         (asm-mode . my-asm-mode-hook)
         )
  :init (add-to-list 'auto-mode-alist '("\\.asm\\'" . asm-mode))
  )


(add-hook 'asm-mode-hook #'my-asm-mode-hook)

;;;;;;;;;;;;;;;;
;; CMAKE      ;;
;;;;;;;;;;;;;;;;

(use-package cmake-mode
  :ensure t
  :hook ((cmake-mode . flycheck-mode)
         (cmake-mode . display-line-numbers-mode)
         (cmake-mode . lsp-deferred)))

;;;;;;;;;;;;;;;;
;; PYTHON     ;;
;;;;;;;;;;;;;;;;

(use-package pyvenv
  :ensure t
  )

(use-package blacken
  :ensure t
  )

(use-package python-mode
  :ensure t
  :commands python-mode
  :hook ((python-mode . lsp-deferred)
         (python-mode . pyvenv-mode)
         (python-mode . blacken-mode))
  )

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
