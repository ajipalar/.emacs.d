;;A cleaner emacs init-file

;;Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'zenburn)

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

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2cbd2a0d861fd6baf446f4393f3c5ed00ed861fe9c9073c87a7c8438ada877d4" default))
 '(package-selected-packages '(magit evil)))
(load-theme 'monokai)

(global-set-key (kbd "C-c C-v") 'vimish-fold)
(global-set-key (kbd "C-c C-r") 'vimish-fold-refold)       
(global-set-key (kbd "C-c C-u") 'vimish-fold-unfold)       
