;;; configs/web-config.el -*- lexical-binding: t; -*-

(use-package! lsp-tailwindcss)

(defun my-web-mode-hook ()
  "Hooks for web mode"

  (setq
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   typescript-indent-level 2))

(add-hook!
 'web-mode-hook
 'my-web-mode-hook)

(add-hook!
 'typescript-mode-hook
 'my-web-mode-hook)

;; use markdown-mode for .mdx
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))

;; python
(use-package! pipenv
  :hook (python-mode . pipenv-mode))

(setq sql-mysql-options '("-C" "-t" "-f" "-n"))
