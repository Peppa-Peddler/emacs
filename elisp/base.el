;; Setting transparency, not working like urxvt
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(setq inhibit-startup-message t)

;;(setq-default indent-tabs-mode nil)

(defun coding-hooks ()
  (setq c-basic-offset 4)
  (setq-default tab-width 4)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'brace-list-open 0)
  (c-set-offset 'block-open 0)
  (c-set-offset 'class-open 0)
  (c-set-offset 'inline-open 0)
  (c-toggle-hungry-state 1)
  (local-set-key "\M-a" 'paren-backward-sexp)
  (local-set-key "\M-e" 'paren-forward-sexp)
  (local-set-key "\C-\M-h" 'hs-hide-all)
  (hs-minor-mode t)
  (abbrev-mode 0)
  (add-hook 'before-save-hook 'coding-system-hook)
  )
(add-hook 'c++-mode-hook 'coding-hooks)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 2)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

(set-face-attribute 'default nil :font "NotoSansMono Nerd Font" :height 127)

;; Custom file
(defvar alpha2phi/custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

; (defconst private-dir  (expand-file-name "private" user-emacs-directory))
; (defconst temp-dir (format "%s/cache" private-dir) "elisp temp directories")

;; Emacs customizations
(setq custom-file                        alpha2phi/custom-file
      make-backup-files                  nil
      ;display-line-numbers-type          'absolute
      ; inhibit-startup-message            t
      use-package-always-ensure          t)

;; Keep buffers automatically up to date
(global-auto-revert-mode t)

(use-package display-line-numbers
  :ensure nil
  :config
  (set-face-attribute 'line-number-current-line nil
			:background "#7fffd4"
			:foreground "black"
			:weight 'bold)
  :hook
  ((prog-mode yaml-mode systemd-mode) . display-line-numbers-mode))

;; Display line number
;; (global-display-line-numbers-mode)

;; Show matching parentheses
(show-paren-mode 1)

;; Need to load custom file to avoid being overwritten
;; more at https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html
(if (file-exists-p alpha2phi/custom-file)
  (load custom-file))

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(electric-indent-mode 1)
(electric-pair-mode)
(ido-mode t)
;(global-hl-line-mode +1)

(provide 'base)
