(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)

;; key chords
(use-package key-chord
  :config
  (key-chord-mode 1))

(use-package helm
  :bind ("M-x" . helm-M-x)
  :config
  (helm-mode 1))

;; evil
(use-package evil
  :init
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (key-chord-define evil-insert-state-map "fd" 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "SPC") 'helm-M-x)
  (define-key evil-visual-state-map (kbd "SPC") 'helm-M-x))

;; projectile
(use-package projectile
  :config
  (projectile-global-mode t))

;; auctex
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-PDF-mode 1)
  (setq TeX-engine 'xetex))

;; asciidoc
(use-package adoc-mode)

;; magit
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
  :config
  (load-theme 'leuven t))

;; who needs guis
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; got tired of scratch being in lisp mode
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message 'nil)

;; Just open symlinks.
(setq find-file-visit-truename t)

;; c-style
(setq c-default-style "bsd")

;; recompile hotkey
(global-set-key [(f9)] 'recompile)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (esup magit use-package projectile key-chord evil auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
