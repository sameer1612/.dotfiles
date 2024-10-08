;; package management setup
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; simple packages
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; larger package setup files
(load (locate-user-emacs-file "packages/general.el"))
(load (locate-user-emacs-file "packages/evil.el"))
(load (locate-user-emacs-file "packages/hydra.el"))
(load (locate-user-emacs-file "packages/ivy.el"))
(load (locate-user-emacs-file "packages/counsel.el"))
