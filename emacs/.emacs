(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

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
(use-package rtags
  :init
  (setq rtags-display-result-backend 'helm)
  :config
  (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
  (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
  (rtags-enable-standard-keybindings))

(use-package irony
  :config
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (use-package flycheck-irony
    :config
    (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  (use-package company-irony
    :config
    (add-to-list 'company-backends 'company-irony)))

(require 'cmake-mode nil t)

;; c-style
(setq c-default-style "bsd")
(setq c-basic-offset 4)

;; auctex
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-PDF-mode 1)
  (setq TeX-engine 'xetex))

;; asciidoc
(use-package adoc-mode
  :mode ("\\.adoc\\'" . adoc-mode))

;; org
(use-package org
  :config
  (use-package org-bullets)
  (add-hook 'org-mode-hook (lambda ()
                             (org-indent-mode t)
                             (org-bullets-mode t))))

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
(use-package dracula-theme
  :if (display-graphic-p)
  :config
  (load-theme 'dracula t))

;; settings
(use-package better-defaults)

;; got tired of scratch being in lisp mode
(setq inhibit-startup-screen t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message 'nil)

;; Just open symlinks.
(setq find-file-visit-truename t)

;; recompile hotkey
(global-set-key [(f9)] 'recompile)

;; easier switching windows
(global-set-key (kbd "M-o") 'other-window)

;; font size
(set-face-attribute 'default nil :height 90)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq gc-cons-threshold 16777216
      gc-cons-percentage 0.1)
