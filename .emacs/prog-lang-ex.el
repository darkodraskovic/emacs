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

;; (use-package sml-mode
;;   :ensure t
;;   :init
;;   (add-hook 'sml-mode-hook 'display-line-numbers-mode)
;;   :bind (:map sml-mode-map (" " . sml-electric-space))
;;   )

;;;;;;;;;;
;; RUST ;;
;;;;;;;;;;

(use-package rustic
  :ensure t
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :init
  (require 'lsp-rust)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook)

  ;; enable / disable the hints as you prefer:
  (setq lsp-rust-analyzer-server-display-inlay-hints t)
  (setq lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (setq lsp-rust-analyzer-display-chaining-hints t)
  (setq lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (setq lsp-rust-analyzer-display-closure-return-type-hints t)
  (setq lsp-rust-analyzer-display-parameter-hints nil)
  (setq lsp-rust-analyzer-display-reborrow-hints nil)  
)

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

(use-package dap-mode
  :ensure
  :config
  (dap-ui-mode)
  (dap-ui-controls-mode 1)

  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  ;; installs .extension/vscode
  (dap-gdb-lldb-setup)
  (dap-register-debug-template
   "Rust::LLDB Run Configuration"
   (list :type "lldb"
         :request "launch"
         :name "LLDB::Run"
	 :gdbpath "rust-lldb"
         :target nil
         :cwd nil)))
