;;A cleaner emacs init-file

;;Turn on syntax heighlighting no matter the mode
(global-font-lock-mode 1)


(org-babel-do-load-languages
 'org-babel-load-language
 '((emacs-lisp . t)
   (shell . t)
   (python . t)
   (julia . t)
   (c++ . t)
   (awk . t)
   (sed . t)))
