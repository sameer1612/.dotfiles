(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "j k") 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "0") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "J") (lambda () (interactive) (evil-next-line 5)))
  (define-key evil-normal-state-map (kbd "K") (lambda () (interactive) (evil-previous-line 5)))

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :init
  (setq evil-collection-want-find-usages-bindings nil)
  :config
  (evil-collection-init))

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "gr") nil)
  (define-key evil-visual-state-map (kbd "gr") nil))

(use-package evil-replace-with-register
  :config
  (setq evil-replace-with-register-key (kbd "gr"))
  (evil-replace-with-register-install))
