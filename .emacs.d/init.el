(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" default))
 '(package-selected-packages
   '(treemacs-projectile treemacs dashboard projectile helm doom-modeline doom-themes which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package all-the-icons
  :ensure t)

;; Dont show startup msg
(setq inhibit-startup-message t)

;; Dont show tool bar
(tool-bar-mode -1)

;; Dont show scroll bar
(toggle-scroll-bar -1)

;; Show matching parenthesis
(show-paren-mode 1)

;; Use IDO mode
(setq ido-everywhere t)
(ido-mode t)

;; Projectile
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))

;; Dashboard
(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents . 3)
                            (projects . 3)))
    (setq dashboard-startup-banner 'logo)
    (setq dashboard-set-file-icons t)
    (setq dashboard-set-heading-icons t)
   )
  :config
  (dashboard-setup-startup-hook))

;; Treemacs
(use-package treemacs
  :ensure t
  :bind
  (:map global-map
	([f8] . treemacs)
	("C-<f8>". treemacs-select-wwindow))
  :config
  (progn
    (setq treemacs-is-never-other-window t))
  )

;; Treemacs Projectile
(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)
