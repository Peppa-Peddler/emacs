;; Setting transparency, not working like urxvt
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

(setq indent-tabs-mode t)
(setq tab-width 4)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

(set-face-attribute 'default nil :font "Fira Code" :height 120)

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
      display-line-numbers-type          'relative
      ; inhibit-startup-message            t
      use-package-always-ensure          t)

;; Keep buffers automatically up to date
(global-auto-revert-mode t)

;; Display line number
(global-display-line-numbers-mode)

;; Show matching parentheses
(show-paren-mode 1)

;; Need to load custom file to avoid being overwritten
;; more at https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html
(if (file-exists-p alpha2phi/custom-file)
  (load custom-file))

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-display-line-numbers-mode 1)
(electric-indent-mode 1)
(electric-pair-mode)
(ido-mode t)
(global-hl-line-mode +1)

(provide 'base)

