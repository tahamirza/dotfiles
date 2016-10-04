; the packages to install
(setq package-list '(
		     ;; keybindings
		     evil
		     key-chord

		     ;; project management
		     magit
		     projectile

		     ;; completion
		     company
		     flycheck
		     flx-ido
		     smex

		     ;; extra modes
		     auctex
		     markdown-mode
		     php-mode
		     ))

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

; fetch the list of packages available
(package-refresh-contents)

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; evil
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

;; smex
(require 'smex)
(smex-initialize)

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


;; Just open symlinks.
(setq find-file-visit-truename t)

;; c-style
(setq c-default-style "bsd")

;; *****keybinds*****
(require 'key-chord)
(key-chord-mode 1)

;; escape to normalcy
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; smex
(global-set-key (kbd "M-x") 'smex)
(define-key evil-normal-state-map (kbd "SPC") 'smex)

;; recompile hotkey
(global-set-key [(f9)] 'recompile)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (key-chord rainbow-delimiters projectile php-mode markdown-mode magit flycheck flx-ido evil company auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
