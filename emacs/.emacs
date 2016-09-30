; the packages to install
(setq package-list '(evil magit projectile company flycheck auctex markdown-mode flx-ido))

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; i have fallen
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)

;; ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; projectile
(projectile-global-mode t)

;; rtags
(require 'rtags)
(rtags-start-process-unless-running)
(setq rtags-autostart-diagnostics t)
(setq rtags-completions-enabled t)

;; company
(require 'company)
(global-company-mode)
(push 'company-rtags company-backends)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck-rtags)

;; who needs guis
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; setup writing modes
(add-hook 'text-mode-hook
	  (lambda ()
	    (variable-pitch-mode t)
	    (auto-fill-mode t)
	    (flyspell-mode t)))

;; setup programming modes
(add-hook 'prog-mode-hook
	  (lambda ()
	    (variable-pitch-mode t)
	    (font-lock-mode -1)))

;; got tired of the splash screen
(setq inhibit-splash-screen t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message 'nil)

;; makes auctex work with pdfs by default
(setq TeX-PDF-mode 1)

(setq TeX-engine 'xetex)

;; recompile hotkey
(global-set-key [(f9)] 'recompile)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Just open symlinks.
(setq find-file-visit-truename t)

;; c-style
(setq c-default-style "bsd")
