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

;; command completion
(use-package which-key
  :config
  (which-key-mode))

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

(require 'cmake-mode nil t)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl"))

;; c-style
(setq c-default-style "bsd")
(setq c-basic-offset 4)

(setq inhibit-splash-screen t)

;; messes with the feel of a dark theme
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

;; dired
(setq dired-dwim-target t)

;; Just open symlinks.
(setq find-file-visit-truename t)

;; recompile hotkey
(global-set-key [(f9)] 'recompile)

;; easier switching windows
(global-set-key (kbd "M-o") 'other-window)

;; save bookmarks after every change
(setq bookmark-save-flag 1)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(load "~/.emacs.d/mail.el")

(setq gc-cons-threshold 16777216
      gc-cons-percentage 0.1)
