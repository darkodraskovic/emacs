;;;;;;;;;;;;;;;; VARS

;; used with org-cite, bibtex, ebib, org-ref and helm-bibtex
(setq bibliographies (list
                      "~/Radovi/Org/Wikith/Resursi/Reference.bib"
                      "~/Radovi/Org/Wikith/Projekti/Racionalizam/Leibniz/Leibniz.bib"
                      ))

(setq org-mode-dict "~/Radovi/Org/Wikith/Resursi/org-mode.org")

(setq capture-templates '(("r" "Rezime" entry (file+headline "~/Radovi/Org/Wikith/Rezimei/Rezimei_01.org" "Rezimei") "* %?\n\n%U")
                          ("c" "Citat" entry (file+headline "~/Radovi/Org/Wikith/Citati/Citati_01.org" "Citati") "* %?\n\n%U\n%i")
                          ("i" "Ideja" entry (file+headline "~/Radovi/Org/Wikith/Ideje/Ideje_03.org" "Ideje") "* \n%U\t*%f*\n%i\n\n%?")
                          ("j" "Journal" entry (file+headline "~/Radovi/Org/Wikith/Projekti/Journal.org" "Entries") "* %?\n\n%U")
                          ("t" "Todo" entry (file+headline "~/Radovi/Org/Wikith/Projekti/Organizer.org" "Todo") "* TODO %?\n\n%U")))

(setq agenda-files '("~/Radovi/Org/Wikith/Projekti/Organizer.org"))

;;;;;;;;;;;;;;;; FUNCS

(defun add-tag-to-org-mode-dict ()
  "Append tag to 'org-mode' 'auto-complete' dict."
  (interactive)
  (let ((dict-file org-mode-dict))
    (write-region (region-beginning) (region-end) dict-file t)
    (write-region "\n" nil dict-file t)
    (let ((buffer-name "org-mode.org"))
      (find-file dict-file)    
      (set-buffer buffer-name)
      (sort-lines nil (point-min) (point-max))
      (delete-duplicate-lines (point-min) (point-max) nil t)
      (save-buffer buffer-name)
      )
    ))

(defun replace-newline-with-space ()
  "Replace newline characters with a space in the current paragraph and merge hyphenated words."
  (interactive)
  (save-excursion
    (let ((start (progn (backward-paragraph) (point)))
          (end (progn (forward-paragraph) (point))))
      (narrow-to-region start end)
      ;; Replace newline characters with a space
      (goto-char (point-min))
      (while (search-forward "\n" nil t)
        (replace-match " "))
      
      ;; Merge hyphenated words
      (goto-char (point-min))
      (while (re-search-forward "\\([^- \n]\\)- \\([^- \n]\\)" nil t)
        (replace-match "\\1\\2"))
      (while (re-search-forward "\\([^­ \n]\\)­ \\([^­ \n]\\)" nil t)
        (replace-match "\\1\\2"))

      ; hack: remove space at the start and move paragraph one line below
      (goto-char (point-min))
      (delete-char 1)
      (insert "\n")

      )
    (widen)))

;;;;;;;;;;;;;;;; MODES

(use-package wrap-region
  :ensure t
  :config
  (wrap-region-add-wrapper "=" "=" nil 'org-mode) ; select region, hit = then region -> =region= in org-mode
  (wrap-region-add-wrapper "*" "*" nil 'org-mode) ; select region, hit * then region -> *region* in org-mode
  (wrap-region-add-wrapper "/" "/" nil 'org-mode) ; select region, hit / then region -> /region/ in org-mode
  (wrap-region-add-wrapper "_" "_" nil 'org-mode) ; select region, hit _ then region -> _region_ in org-mode
  (wrap-region-add-wrapper "+" "+" nil 'org-mode) ; select region, hit + then region -> +region+ in org-mode
  (wrap-region-add-wrapper "~" "~" nil 'org-mode) ; select region, hit ~ then region -> ~region~ in org-mode

  (wrap-region-add-wrapper "`" "`" nil 'markdown-mode)  
  )

(use-package markdown-mode
  :ensure t
  :config
  :init
  (add-hook 'markdown-mode-hook #'wrap-region-mode)  
  )

;;;;;;;;;;;;;;;; ORG-MODE

(defun remove-electric-indent-mode ()
  (electric-indent-local-mode -1))

(use-package org-mode
  :after (org-ref)
  :mode (("\\.org$" . org-mode) ("\\.wiki$" . org-mode))
  :init
  (add-hook 'org-mode-hook #'wrap-region-mode)
  (add-hook 'org-mode-hook #'remove-electric-indent-mode)
  (setq org-directory "~/Radovi/Org/Wikith")
  (setq org-html-validation-link nil)
  (setq org-log-done 'time)
  (setq org-adapt-indentation nil)
  (setq org-src-fontify-natively t)
  (setq org-agenda-files agenda-files)
  (setq org-capture-templates capture-templates)
  (setq org-refile-targets (quote ((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9)))) ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
  (setq org-latex-prefer-user-labels t)
  (setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))
  (setq org-cite-global-bibliography bibliographies)
  :config
  (setq company-idle-delay nil)
  ;; (find-file org-mode-dict)
  :bind
  (("C-c c" . org-capture)
   ("C-c a" . org-agenda)
   ("C-c l" . org-store-link)
   ("s-t" . add-tag-to-org-mode-dict)
   ("s-q" . replace-newline-with-space)
   )
  (:map org-mode-map
        ("C-c [" . helm-bibtex)
        ("C-c ]" . org-ref-insert-cite-link)
        )
  )

;;;;;;;;;;;;;;;; BIBLIOGRAPHY

(use-package bibtex
  :init
  (setq bibtex-completion-additional-search-fields '(keywords))
  ;; a minimal configuration for helm-bibtex:
  ;; cf. https://github.com/tmalsburg/helm-bibtex#minimal-configuration
  (setq bibtex-completion-bibliography bibliographies)
  )

(use-package ebib
  :ensure t
  :init
  (setq ebib-create-backups nil)
  (setq ebib-index-window-size 26)
  (setq ebib-keywords-field-keep-sorted t)
  (setq ebib-keywords-file org-mode-dict)
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

;; cf. https://github.com/jkitchin/org-ref#what-about-org-cite
(use-package org-ref
  :ensure t
  )
