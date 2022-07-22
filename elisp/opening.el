(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents . 3)
			    (projects . 3)))
    (setq dashboard-center-content t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-set-heading-icons t)
    (setq dashboard-startup-banner "~/.emacs.d/images/nerv.png")
    )
  :config
  (dashboard-setup-startup-hook))

(provide 'opening)
