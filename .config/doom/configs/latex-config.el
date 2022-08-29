;;; configs/latex-config.el -*- lexical-binding: t; -*-

(setq TeX-PDF-mode t)
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
(add-to-list 'exec-path "/Library/TeX/texbin/")

(setq org-preview-latex-default-process 'dvisvgm)
(after! org (plist-put org-format-latex-options :scale 1))
(setq org-latex-src-block-backend 'minted)

(require 'org-src)
(add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t)))
