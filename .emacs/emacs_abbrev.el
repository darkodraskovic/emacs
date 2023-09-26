(define-abbrev-table 'global-abbrev-table 
  '(
    ("7src" "#+BEGIN_SRC c\n\n#+END_SRC")
    ("7js" "#+BEGIN_SRC js\n\n#+END_SRC")
    ("7cpp" "#+BEGIN_SRC c++\n\n#+END_SRC")
    ("7py" "#+BEGIN_SRC python\n\n#+END_SRC")
    ("7exa" "#+BEGIN_EXAMPLE\n\n#+END_EXAMPLE")
    ("7ja" "#+BEGIN_SRC java\n\n#+END_SRC")
    ("7lu" "#+BEGIN_SRC lua\n\n#+END_SRC")
    ("7li" "#+BEGIN_SRC lisp\n\n#+END_SRC")
    ("7go" "#+BEGIN_SRC go\n\n#+END_SRC")
    ("7elm" "#+BEGIN_SRC elm\n\n#+END_SRC")
    ("7sh" "#+BEGIN_SRC sh\n\n#+END_SRC")
    ("7glsl" "#+BEGIN_SRC glsl\n\n#+END_SRC")
    ("7xml" "#+BEGIN_SRC xml\n\n#+END_SRC")
    ("7lua" "#+BEGIN_SRC lua\n\n#+END_SRC")
    ("7sml" "#+BEGIN_SRC sml\n\n#+END_SRC")
    ("7csh" "#+BEGIN_SRC csharp\n\n#+END_SRC")
    ("7cs" "#+BEGIN_SRC csharp\n\n#+END_SRC")
    ("7asm" "#+BEGIN_SRC asm\n\n#+END_SRC")
    ("7sql" "#+BEGIN_SRC sql\n\n#+END_SRC")
    ("7bas" "#+BEGIN_SRC basic\n\n#+END_SRC")
    ("7rs" "#+BEGIN_SRC rust\n\n#+END_SRC")
    
    ("7c" "#+begin_comment\n\n#+end_comment")
    ("7q" "#+begin_quote\n\n#+end_quote")

    ("7tit" "#+TITLE: ")
    ;; set tags that all entries in a file should inherit just as if tags were
    ;; these defined in a hypothetical level zero that ;; surrounds the entire
    ;; these file: #+FILETAGS: :Peter:Boss:Secret:
    ("7tag" "#+FILETAGS: ::")
    ("7aut" "#+AUTHOR: Darko Draskovic")


    ("4q" "@QUOTE")
    ("4f" "@FORTE")
    ("4i" "@IDEA")
    ("4s" "@SUMMARY")
    ("4c" "@COMMENT")
    ("4b" "@BIBLIO")
    
    ("4e" "[...]")
))

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)
