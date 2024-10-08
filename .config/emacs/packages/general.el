(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (rune/leader-keys
   "j" '(join-line :which-key "join line")
   "fc" '(lambda () (interactive) (find-file "~/.config/emacs/"))
   "ff" '(counsel-find-file :which-key "join line")
   "fb" '(counsel-ibuffer :which-key "counsel buffer list")))
