;;; theming.el -*- lexical-binding: t; -*-

(setq doom-theme 'nano-dark)

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "SF Pro" :size 15))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(set-face-attribute 'mode-line nil :font "FiraCode Nerd Font Mono" :height 137)
(set-face-attribute 'mode-line-inactive nil :font "FiraCode Nerd Font Mono" :height 140)
(setq doom-modeline-bar-width 4)

;; splash screen
(setq fancy-splash-image (concat doom-private-dir "splash.png"))

(set-face-background 'scroll-bar "transparent")

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq indent-tabs-mode nil)
(setq display-line-numbers-type 'relative)

(setq evil-insert-state-cursor '((bar . 2) "plum")
      evil-normal-state-cursor '(box "plum")
      evil-visual-state-cursor '(box "magenta")
      evil-replace-state-cursor '(hbar "plum"))

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)

(setq org-superstar-item-bullet-alist
  '((?* . ?•)
    (?+ . ?•)
    (?- . ?•)))

(setq org-superstar-headline-bullets-list '(?◉ ?○ ?◌))

(setq org-ellipsis " ▼"
            org-hide-emphasis-markers t
            org-superstar-prettify-item-bullets t)


;; un-hides whitespace between headings when collapsing headings.
(customize-set-variable 'org-blank-before-new-entry
                        '((heading . nil)
                          (plain-list-item . nil)))

;; disable whitespace-mode
(setq global-whitespace-mode -1)

(setq pdf-view-use-scaling t)
(setq tool-bar-mode nil)
(setq ns-pop-up-frames t)

(add-hook! 'text-mode-hook (svg-tag-mode-on))
(add-hook! 'prog-mode-hook
  (svg-tag-mode-on)
  (lsp-headerline-breadcrumb-mode))
