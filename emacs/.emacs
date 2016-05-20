; the packages to install
(setq package-list '(evil magit monokai-theme auctex rainbow-delimiters))

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
(load-theme 'monokai t)

;; get rid of the silly scrollbar and tool bar
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; (add-to-list 'default-frame-alist '(font . "Terminus-11"))
;; (set-face-attribute 'default t :font "Terminus-11")

(set-default-font "Terminus-11")

;; sets up wordwrap for org-mode and text-mode
(add-hook 'org-mode-hook
	  (lambda ()
	    (visual-line-mode t)
	    (org-indent-mode t)))
(add-hook 'text-mode-hook 'visual-line-mode)

;; i usually want spellchecking in my LaTeX
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; got tired of the splash screen
(setq inhibit-splash-screen t)

;; makes auctex work with pdfs by default
(setq TeX-PDF-mode 1)

(setq TeX-engine 'xetex)

;;setup deft for org-mode
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directory "~/shared_docs/notes/")

;; recompile hotkey
(global-set-key [(f9)] 'recompile)

;; for stats
(require 'ess-site)

;; default smartparens configuration
(require 'smartparens-config)
(smartparens-global-mode t)

;; rainbow parens
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
