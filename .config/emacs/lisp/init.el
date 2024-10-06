;;; lisp/init.el -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; :core is now treated like a normal module, and this is its (temporary) init
;; file, which will be removed once we've resolved our `use-package' dependency
;; (which will soon be moved to its own module), then these will be returned to
;; the profile init file.
;;
;;; Code:

(doom-require 'doom-keybinds)
(doom-require 'doom-ui)
(doom-require 'doom-projects)
(doom-require 'doom-editor)

;; COMPAT: `safe-local-variable-directories' was introduced in Emacs 30.1
(unless (boundp 'safe-local-variable-directories)
  (defvar safe-local-variable-directories ())
  (define-advice hack-local-variables-filter (:around (fn variables dir-name) respect)
    (let ((enable-local-variables
           (if (delq nil (mapcar (lambda (dir)
                                   (and dir-name dir
                                        (file-equal-p dir dir-name)))
                                 safe-local-variable-directories))
               :all
             enable-local-variables)))
      (funcall fn variables dir-name))))

;; Ensure .dir-locals.el in $EMACSDIR and $DOOMDIR are always respected
(add-to-list 'safe-local-variable-directories doom-emacs-dir)
(add-to-list 'safe-local-variable-directories doom-user-dir)

;;; Support for Doom-specific file extensions
(add-to-list 'auto-mode-alist '("/\\.doom\\(?:project\\|module\\|profile\\)?\\'" . lisp-data-mode))
(add-to-list 'auto-mode-alist '("/\\.doomrc\\'" . emacs-lisp-mode))

;;; init.el ends here
