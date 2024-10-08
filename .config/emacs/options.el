(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)

(setq inhibit-startup-message t)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)


(setq display-line-numbers-type 'relative)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

