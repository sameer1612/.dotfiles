;; -*- no-byte-compile: t; -*-
;;; emacs/undo/packages.el

(if (modulep! +tree)
    (package! undo-tree :pin "d8f72bbe7d3c3a2808986febd3bb1a46d4da7f51")
  (package! undo-fu :pin "dbb3e4b699dd488497ef9b32a04b8e928a6bc8ef")
  (package! undo-fu-session :pin "beb0e285d074145eaf481a959c903b77c19ae91e")
  (when (> emacs-major-version 27)  ; unsupported in 27
    (package! vundo :pin "5374125dc0aaf1769bb0965344befb90f809ccfc")))
