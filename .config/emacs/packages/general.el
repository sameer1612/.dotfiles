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
   "fc" '(lambda () (interactive) (counsel-find-file "~/.config/emacs/"))
   "ff" '(counsel-find-file :which-key "join line")
   "fb" '(counsel-ibuffer :which-key "counsel buffer list")))
