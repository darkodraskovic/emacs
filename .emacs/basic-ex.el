;;;;;;;;;;;;
;; THEME  ;;
;;;;;;;;;;;;

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)

  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)

  (doom-themes-org-config)
  (custom-set-faces
  `(mode-line ((t (:background ,(doom-color 'dark-violet)))))
  `(font-lock-comment-face ((t (:foreground ,(doom-color 'base6))))))
  )

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;;;;;;;;;;;;;
;; TREEMACS ;;
;;;;;;;;;;;;;;

(use-package all-the-icons
  :ensure t
  )

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  (setq treemacs-width 24)
  (setq treemacs--icon-size 16)
  :config
  (treemacs-follow-mode nil)
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

;;;;;;;;;;;;;;;; YASNIPPET

(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs '("~/Radovi/Linux/.emacs.d/snippets"))
  (yas-global-mode 1)
  :config
  (yas-reload-all)
  )

(use-package yasnippet-snippets
  :ensure t
  :after (yasnippet)
  )

(use-package which-key
  :ensure t
  :init
  (setq which-key-idle-delay 0.5)
  ;; :config
  ;; (which-key-mode)
  )

