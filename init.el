(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(add-to-list 'load-path (concat user-emacs-directory "bongocat-mode"))

;; Base configuration
(require 'base)

;; Theme
(require 'theme)

;; Evil Mode
;; (require 'vim)

;; Completion
;;(require 'completion)

;; Ligature
;; (require 'liga)

;; Bongo-cat
(require 'bongocat)
(bongocat-mode)

;; Vterm
(use-package vterm
    :ensure t)
