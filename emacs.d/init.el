;; configs
(setq inhibit-startup-message t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(menu-bar-mode -1)               ; Disable the menu bar
(setq visible-bell t)            ; visual bell


(global-set-key  (kbd "<escape>") 'keyboard-escape-quit)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(setq package-archives '(("melpa" . "https://melpa.org/packages/")
      ("melpa-stable" . "https://stable.melpa.org/packages/")
      ("org" . "https://orgmode.org/elpa/")
      ("elpa" . "https://elpa.gnu.org/packages/")
      ))
      

(unless  package-archive-contents
     (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.


(use-package evil
  :config (evil-mode 1))
;;
(use-package which-key
  :config (which-key-mode))


(use-package ivy
  :config (ivy-mode 1))

(use-package rainbow-delimiters
  :config (rainbow-delimiters-mode))
;;
(use-package dracula-theme
  :config (load-theme 'dracula))

(use-package spinner)
(use-package lsp-mode)
(use-package tree-sitter)

(use-package treemacs)
(use-package treemacs-all-the-icons)
(use-package treemacs-evil)
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b54bf2fa7c33a63a009f249958312c73ec5b368b1094e18e5953adb95ad2ec3a" default))
 '(package-selected-packages
   '(spinner treemacs-evil treemacs-all-the-icons lsp-mode tree-sitter treemacs cmake-mode which-key use-package rainbow-delimiters ivy general evil dracula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package general
  :ensure t
  :after evil
  :config
  (general-create-definer tyrant-def
    :states '(normal insert motion emacs)
    :keymaps 'override
    :prefix "SPC"
    :non-normal-prefix "M-SPC")
  (tyrant-def "" nil)

  (general-def universal-argument-map
    "SPC u" 'universal-argument-more)

  (tyrant-def
    ;; buffers
    "bc" 'kill-this-buffer 
    "bk" 'switch-to-buffer
    "bs" 'save-buffer
    "be" 'eval-buffer
    ;; tabs
    "to" 'tab-new
    "tO" 'tab-bar-new-tab-choice
    "ts" 'tab-switch
    "tr" 'tab-rename
    "tR" 'tab-bar-rename-tab-by-name
    ;; treemacs
    "ot" 'treemacs
    ;; files
    "ff" 'find-file
    "xh" 'mark-whole-buffer))
