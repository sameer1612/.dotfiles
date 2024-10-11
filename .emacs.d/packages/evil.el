(defun reverse-join-line ()
  (interactive)
  (next-line)
  (join-line))

(use-package evil
  :ensure t
  :defer t
  :hook
  (after-init . evil-mode)
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
	
	(add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[5 q")))
	(add-hook 'evil-insert-state-exit-hook  (lambda () (send-string-to-terminal "\033[2 q")))
	
  (evil-set-undo-system 'undo-redo)

  (setq evil-leader/in-all-states t)
  (setq evil-want-fine-undo t)

  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'visual (kbd "SPC"))

  (evil-define-key 'normal 'global (kbd "C-d") 'scroll-up)
  (evil-define-key 'normal 'global (kbd "C-u") 'scroll-down)
 
  (evil-define-key 'normal 'global (kbd "0") 'evil-first-non-blank)
  (evil-define-key 'normal 'global (kbd "<leader> j") 'reverse-join-line)

  (evil-define-key 'normal 'global (kbd "<leader> qq") 'save-buffers-kill-terminal)

  ;; Keybindings for searching and finding files.
  (evil-define-key 'normal 'global (kbd "<leader> f f") 'project-find-file)
  (evil-define-key 'normal 'global (kbd "<leader> f G") 'consult-grep)
  (evil-define-key 'normal 'global (kbd "<leader> f g") 'consult-git-grep)
  (evil-define-key 'normal 'global (kbd "<leader> f h") 'consult-info)
  (evil-define-key 'normal 'global (kbd "<leader> f l") 'consult-line)

  ;; Flymake navigation
  (evil-define-key 'normal 'global (kbd "<leader> x x") 'consult-flymake)
  (evil-define-key 'normal 'global (kbd "] d") 'flymake-goto-next-error)
  (evil-define-key 'normal 'global (kbd "[ d") 'flymake-goto-prev-error)

  ;; Dired commands for file management
  (evil-define-key 'normal 'global (kbd "<leader> d d") 'dired)
  (evil-define-key 'normal 'global (kbd "<leader> d j") 'dired-jump)
  (evil-define-key 'normal 'global (kbd "<leader> f a") 'find-file)

  ;; NeoTree command for file exploration
  (evil-define-key 'normal 'global (kbd "<leader> e e") 'neotree-toggle)

  ;; Buffer management keybindings
  (evil-define-key 'normal 'global (kbd "] b") 'switch-to-next-buffer)
  (evil-define-key 'normal 'global (kbd "[ b") 'switch-to-prev-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> b i") 'ibuffer)
  (evil-define-key 'normal 'global (kbd "<leader> b d") 'kill-current-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> w") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'consult-buffer)

  ;; Project management keybindings
  (evil-define-key 'normal 'global (kbd "<leader> p b") 'consult-project-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> p p") 'project-switch-project)
  (evil-define-key 'normal 'global (kbd "<leader> p g") 'project-find-regexp)
  (evil-define-key 'normal 'global (kbd "<leader> p k") 'project-kill-buffers)
  (evil-define-key 'normal 'global (kbd "<leader> p d") 'project-dired)

  ;; Yank from kill ring
  (evil-define-key 'normal 'global (kbd "P") 'consult-yank-from-kill-ring)
  (evil-define-key 'normal 'global (kbd "<leader> P") 'consult-yank-from-kill-ring)

  ;; Embark actions for contextual commands
  (evil-define-key 'normal 'global (kbd "<leader> .") 'embark-act)

  ;; Undo tree visualization
  (evil-define-key 'normal 'global (kbd "<leader> u") 'undo-tree-visualize)

  ;; Help keybindings
  (evil-define-key 'normal 'global (kbd "<leader> h m") 'describe-mode) ;; Describe current mode
  (evil-define-key 'normal 'global (kbd "<leader> h f") 'describe-function) ;; Describe function
  (evil-define-key 'normal 'global (kbd "<leader> h v") 'describe-variable) ;; Describe variable
  (evil-define-key 'normal 'global (kbd "<leader> h k") 'describe-key) ;; Describe key

  ;; Tab navigation
  (evil-define-key 'normal 'global (kbd "] t") 'tab-next) ;; Go to next tab
  (evil-define-key 'normal 'global (kbd "[ t") 'tab-previous) ;; Go to previous tab


  ;; Custom example. Formatting with prettier tool.
  (evil-define-key 'normal 'global (kbd "<leader> m p")
    (lambda ()
      (interactive)
      (shell-command (concat "prettier --write " (shell-quote-argument (buffer-file-name))))
      (revert-buffer t t t)))

  ;; LSP commands keybindings
  (evil-define-key 'normal 'global (kbd "<leader> l d") 'xref-find-definitions)
  (evil-define-key 'normal 'global (kbd "<leader> l r") 'xref-find-references)
  (evil-define-key 'normal 'global (kbd "<leader> l a") 'lsp-execute-code-action)
  (evil-define-key 'normal 'global (kbd "<leader> r") 'lsp-rename)
  (evil-define-key 'normal 'global (kbd "<leader> l f") 'lsp-format-buffer)


  (defun ek/lsp-describe-and-jump ()
	"Show hover documentation and jump to *lsp-help* buffer."
	(interactive)
	(lsp-describe-thing-at-point)
	(let ((help-buffer "*lsp-help*"))
      (when (get-buffer help-buffer)
		(switch-to-buffer-other-window help-buffer))))
  ;; Open hover documentation
  (evil-define-key 'normal 'global (kbd "K") 'ek/lsp-describe-and-jump)
  ;; Yeah, on terminals, Emacs doesn't support (YET), the use of floating windows,
  ;; thus, this will open a small buffer bellow your window.
  ;; This floating frames are called "child frames" and some recent effort is being put
  ;; into having a translation of those marvelous GUI stuff to terminal. Let's hope
  ;; we add this to Emacs Kick soom :)

  ;; Commenting functionality for single and multiple lines
  (evil-define-key 'normal 'global (kbd "gcc")
    (lambda ()
      (interactive)
      (if (not (use-region-p))
          (comment-or-uncomment-region (line-beginning-position) (line-end-position)))))

  (evil-define-key 'visual 'global (kbd "gc")
    (lambda ()
      (interactive)
      (if (use-region-p)
          (comment-or-uncomment-region (region-beginning) (region-end)))))

  (evil-mode 1))


(use-package evil-collection
  :after evil
  :defer t
  :ensure t
  :hook
  (evil-mode . evil-collection-init)
  :config
  (setq evil-collection-want-find-usages-bindings nil)
  (define-key evil-normal-state-map (kbd "J") (lambda () (interactive) (evil-next-line 5)))
  (define-key evil-normal-state-map (kbd "K") (lambda () (interactive) (evil-previous-line 5)))
  (evil-collection-init))

(use-package evil-replace-with-register
  :config
  (setq evil-replace-with-register-key (kbd "gr"))
  (evil-replace-with-register-install))


(defun my-jk ()
  (interactive)
  (let* ((initial-key ?j)
         (final-key ?k)
         (timeout 0.5)
         (event (read-event nil nil timeout)))
    (if event
        ;; timeout met
        (if (and (characterp event) (= event final-key))
            (evil-normal-state)
          (insert initial-key)
          (push event unread-command-events))
      ;; timeout exceeded
      (insert initial-key))))

(define-key evil-insert-state-map (kbd "j") 'my-jk)
