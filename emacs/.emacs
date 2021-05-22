(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; command completion
(use-package which-key
  :config
  (which-key-mode))

;; nyan
(use-package nyan-mode
  :config
  (nyan-mode 1)
  :custom
  (nyan-animate-nyancat t)
  (nyan-wavy-trail t))

;; theme
(use-package dracula-theme
  :if (display-graphic-p)
  :config
  (load-theme 'dracula t))

(require 'cmake-mode nil t)

(use-package slime
  :custom
  (inferior-lisp-program "sbcl"))

(use-package magit)

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

(setq scroll-conservatively 1000)

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
