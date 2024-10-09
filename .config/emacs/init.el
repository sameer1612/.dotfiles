(load (locate-user-emacs-file "packages/packages.el"))

(load (locate-user-emacs-file "theme.el"))
(load (locate-user-emacs-file "options.el"))

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)
