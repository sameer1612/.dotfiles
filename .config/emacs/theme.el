(set-face-attribute 'default nil
                    :family "VictorMono Nerd Font"
                    :height 180
                    :weight 'medium)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-gruvbox t))
