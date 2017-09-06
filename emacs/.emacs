(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)

;; evil
(use-package evil
  :init
  (setq evil-want-C-i-jump nil)
  (setq evil-move-beyond-eol t)
  :config
  (evil-mode 1))

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

;; windmove
(windmove-default-keybindings)

;; font size
(set-face-attribute 'default nil :height 90)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dracula-theme which-key auto-org-md company esup magit use-package projectile key-chord evil auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
