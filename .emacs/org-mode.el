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
  (setq org-agenda-files '("~/Radovi/Org/Wikith/Projekti/Organizer.org"
                           "~/Radovi/Org/Wikidev/Projects/Haptiq/Haptiq.org"
                         ))
  (setq org-capture-templates '(
          ("r" "Rezime" entry (file+headline "~/Radovi/Org/Wikith/Rezimei/Rezimei_01.org" "Rezimei") "* %?\n\n%U")
          ("c" "Citat" entry (file+headline "~/Radovi/Org/Wikith/Citati/Citati_01.org" "Citati") "* %?\n\n%U\n%i")
          ("i" "Ideja" entry (file+headline "~/Radovi/Org/Wikith/Ideje/Ideje_03.org" "Ideje") "* \n%U\t*%f*\n%i\n\n%?")
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
   ("C-c [" . helm-bibtex) ;; "C-c ]" org-ref-helm-insert-cite-link
   ("C-c l" . org-store-link)
   ("s-t" . add-tag-to-org-mode-dict)
   )
  ;; :config (electric-indent-local-mode -1)
  )

(use-package company-dict
  :ensure t
  :init
  (setq company-dict-dir (concat "~/Radovi/Org/Dict/"))
  :hook (org . company-dict))

;;;;;;;;;;;;;;;;;;
;; BIBLIOGRAPHY ;;
;;;;;;;;;;;;;;;;;;

(setq bibliographies (list
                      "~/Radovi/Org/Wikith/Resursi/Reference.bib"
                      "~/Radovi/Org/Wikith/Projekti/ProtePhilo/ProtePhilo.bib"
                      ))

(use-package bibtex
  :init
  (setq bibtex-completion-additional-search-fields '(keywords))
  (setq bibtex-completion-bibliography bibliographies) ;; cf. helm-bibtex
  )

(use-package ebib
  :ensure t
  :init
  (setq ebib-create-backups nil)
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
