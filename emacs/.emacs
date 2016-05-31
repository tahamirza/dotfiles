; the packages to install
(setq package-list '(evil magit auctex rainbow-delimiters))

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
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; custom theme
(load-theme 'wombat t)

;; who needs guis
(when (or
       (display-graphic-p)
       (daemonp))
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; sets up org-mode
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-indent-mode t)
	    (variable-pitch-mode t)
	    (auto-fill-mode t)
	    (flyspell-mode t)
	    ))

;; i usually want spellchecking in my LaTeX
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; got tired of the splash screen
(setq inhibit-splash-screen t)

;; makes auctex work with pdfs by default
(setq TeX-PDF-mode 1)

(setq TeX-engine 'xetex)

;; recompile hotkey
(global-set-key [(f9)] 'recompile)

;; rainbow parens
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Just open symlinks.
(setq find-file-visit-truename t)
