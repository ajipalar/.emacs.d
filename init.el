;; Set up package.el to work with MELPA
(require 'package)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(package-initialize)
(package-refresh-contents)
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(load-theme 'monokai)
(load-theme 'zenburn)
(setq magit-view-git-manual-method 'man)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)
(global-set-key (kbd "C-c g") 'magit-file-dispatch)
;; Download julia-mode
(unless (package-installed-p 'julia-mode)
  (package-install 'julia-mode))
;; Enable julia-mode
(require 'julia-mode)

;;Install julia-shell-mode after julia-mode
(add-to-list 'load-path "~/package/jlpkgs/julia-shell-mode")
(require 'julia-shell)

;; Define functions and hooks for julia-shell-mode
(defun my-julia-mode-hooks()
  (require 'julia-shell-mode))
(add-hook 'julia-mode-hook 'my-julia-mode-hooks)
(define-key julia-mode-map (kbd "C-c C-c") 'julia-shell-run-region-or-line)
(define-key julia-mode-map (kbd "C-c C-s") 'julia-shell-save-and-go)
(load-theme 'monokai)
