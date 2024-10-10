(set-face-font 'default "VictorMono Nerd Font")

(set-face-attribute 'default nil
                    :family "VictorMono Nerd Font"
                    :weight 'regular :height 180)

(set-fontset-font "fontset-default"
                  nil
                  (font-spec :family "VictorMono Nerd Font" :height 180))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-palenight t))
