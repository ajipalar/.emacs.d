;;Update settings for lsp-mode
(setq gc-cons-threshold 1000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(defun my-put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
		      default-directory
		    (buffer-file-name))))
    (when filename
      (with-temp-buffer
	(insert filename)
	(clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun hello ()
  "Hello World and you can call it via M-x hello."
  (interactive)
  (message "Hello World!"))
(defun whats-up ()
  "whats-up and you can call it via M-x whats-up."
  (interactive)
  (message "Not much. Sup with you?"))

;;CEDET Collection of Emacs Development Environment Tools

;;(require 'semantic)
;;(global-semanticdb-minor-mode 1)
;;(semantic-mode 1)
;;(semantic-enable)

;;Disable Python and HTML code semantic code completion

;;Turn on syntax highlighting no matter the mode
(global-font-lock-mode 1)


;; Source: http://www.emacswiki.org/emacs-en/download/misc-cmds.el
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-aut :noconfirm))

(defun do-org-show-all-images ()
  (interactive)
  (org-display-inline-images t t))
(global-set-key (kbd "C-c C-x C v")
		'do-org-show-all-images)

(setq org-confirm-babel-evaluate nil)


(org-babel-do-load-languages
 'org-babel-load-language
 '((emacs-lisp . t)
   (shell . t)
   (python . t)
   (julia . t)
   (c++ . t)
   (awk . t)
   (sed . t)))
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

(setq load-path (cons (expand-file-name "/Users/ajipalar/Projects/tutorials/cmake_tutorial/CMake/Auxiliary/cmake-mode.el") load-path))
(require 'cmake-mode)
(require 'rust-mode)
(require 'vimish-fold)

;;Enable lsp-mode
;;if you want to change prefix for lsp-mode keybindings.
(setq lsp-keymap-prefix "s-l")

(require 'lsp-mode)
(add-hook 'c++-mode-hook #'lsp)

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
