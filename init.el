(add-to-list 'load-path (concat user-emacs-directory "elisp"))

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

;; Vterm
(use-package vterm
    :ensure t)
