;;;;;;;;;;;;;;;
;; GLSL mode ;;
;;;;;;;;;;;;;;;

(use-package glsl-mode
  :ensure t
  :mode (("\\.vs\\'" . glsl-mode) ("\\.fs\\'" . glsl-mode) ("\\.shader\\'" . glsl-mode) ("\\.glsl\\'" . glsl-mode))
  :init
  (add-hook 'glsl-mode-hook 'display-line-numbers-mode)
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

(defun ts-js-mode-hooks ()
  (setq typescript-indent-level 2)
  (setq js-indent-level 2)
  (local-set-key (kbd "M-.") 'lsp-find-definition)
  )

(use-package js
  :ensure t
  :commands js-mode
  :hook ((js-mode . lsp-deferred)
         (js-mode . ts-js-mode-hooks)
         )
  )

(use-package typescript-mode
  :ensure t
  :commands typescript-mode
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode))
  :hook
  ((typescript-mode . lsp-deferred)
   (typescript-mode . ts-js-mode-hooks))
  )

(use-package json-mode
  :ensure t
  :commands json-mode
  :mode ("\\.gltf\\'" . json-mode)
  :hook ((json-mode . lsp-deferred)
         (json-mode . hs-minor-mode))
  :config (setq js-indent-level 2)
  (setq tab-width 2)
  )


;;;;;;;;;;;;;;
;; WEB-MODE ;;
;;;;;;;;;;;;;;

(use-package web-mode
  :ensure t
  :mode (
         ;; ("\\.jsx\\'" .  web-mode)
         ;; ("\\.tsx\\'" . web-mode)
         ("\\.gohtml\\'" . web-mode) ("\\.html?\\'" . web-mode)
         )
  :init   (setq web-mode-engines-alist
                '(("go"    . "\\.gohtml\\'")))
  :hook (web-mode . lsp-deferred)
  :config (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
  (setq nxml-child-indent 4 nxml-attribute-indent 4)
  (setq css-indent-offset 2)
  )

(use-package css-mode
  :ensure t
  :mode ("\\.scss\\'" . css-mode)
  )

;;;;;;;;;;;;;;
;; LUA-MODE ;;
;;;;;;;;;;;;;;

(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua"
  :hook (lua-mode . lsp-deferred)
  ;; :init (setq lsp-clients-lua-language-server-install-dir "~/Programs/lua-language-server/")
  ;; (setq lsp-clients-lua-language-server-install-dir "~/Programs/lua-language-server/bin/Linux/lua-language-server")
  ;; (setq lsp-clients-lua-language-server-main-location "~/Programs/lua-language-server/main.lua")
  :config
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents t)
  (setq lua-prefix-key nil)
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

