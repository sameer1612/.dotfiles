(defun reverse-join-line ()
  "Join the next line to the current line."
  (interactive)
  (next-line)   ;; Move to the next line
  (join-line))  ;; Then join the line

(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (rune/leader-keys
   "j" '(reverse-join-line :which-key "reverse join line")
   "w" '(save-buffer :which-key "save buffer")
   "ff" '(counsel-projectile-find-file :which-key "find file in project")
   "fg" '(counsel-projectile-git-grep :which-key "grep in project")
   "fp" '(counsel-projectile-switch-project :which-key "switch project")
   "fc" '(lambda () (interactive) (counsel-find-file "~/.config/emacs/"))
   "fa" '(counsel-find-file :which-key "generic file opener")
   "fb" '(counsel-ibuffer :which-key "counsel buffer list")))
