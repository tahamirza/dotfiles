(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)


;; helm
(use-package helm
  :bind ("M-x" . helm-M-x)
  :bind ("C-x C-f" . helm-find-files)
  :config
  (helm-mode 1))

;; projects
(use-package projectile
  :config
  (projectile-mode t))

;; completion
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;; command completion
(use-package which-key
  :config
  (which-key-mode))

;; on the fly syntax checking
(use-package flycheck
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode))

;; snippets
(use-package yasnippet
  :config
  (add-hook 'prog-mode-hook 'yas-global-mode))

;; c++
(use-package irony)
(use-package rtags)
(use-package cmake-ide
  :config
  (add-hook 'c-mode-hook 'cmake-ide-setup)
  (add-hook 'c++-mode-hook 'cmake-ide-setup))

;; auctex
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-PDF-mode 1)
  (setq TeX-engine 'xetex))

;; line wrapping
(use-package visual-fill-column)
(defun writing-mode ()
  (visual-line-mode t)
  (visual-fill-column-mode t))

;; asciidoc
(use-package adoc-mode
  :mode ("\\.adoc\\'" . adoc-mode)
  :config
  (add-hook 'adoc-mode-hook 'writing-mode))

;; org
(use-package org
  :config
  (use-package org-bullets)
  (add-hook 'org-mode-hook (lambda ()
                             (org-indent-mode t)
                             (org-bullets-mode t)
                             (writing-mode))))

;; git
(use-package magit
  :bind ("C-x g" . magit-status))

;; nyan
(use-package nyan-mode
  :init
  (setq nyan-animate-nyancat t)
  (setq nyan-wavy-trail t)
  :config
  (nyan-mode 1))

;; theme
(use-package leuven-theme
  :if (display-graphic-p)
  :config
  (load-theme 'leuven t))

;; settings
(use-package better-defaults)

;; got tired of scratch being in lisp mode
(setq inhibit-startup-screen t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message 'nil)

;; Just open symlinks.
(setq find-file-visit-truename t)

;; c-style
(setq c-default-style "bsd")

;; recompile hotkey
(global-set-key [(f9)] 'recompile)

;; windmove
(windmove-default-keybindings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (which-key auto-org-md company esup magit use-package projectile key-chord evil auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
