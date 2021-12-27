;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "yashkarthik.eth")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; ---------------FONT-start-----------------------
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 15)
      doom-big-font(font-spec :family "FiraCode Nerd Font Mono" :size 25))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;;-----------------FONT-end--------------------

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; default theme
(setq doom-theme 'doom-one)
(setq my/light-theme 'doom-solarized-light
      my/dark-theme doom-theme)

;; function to toggle theme
(defun my/toggle-dark-theme ()
  (interactive)
  (if (eq my/dark-theme doom-theme)
      (load-theme my/light-theme t)
    (load-theme my/dark-theme t)))

(map! :leader
      (:prefix-map ("t" . "toggle")
       :desc "Dark theme" "d" #'my/toggle-dark-theme))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; ORG-sart------------------------------------

(setq org-directory "~/org/")

;; 1. change the ... thingy when folding
;; 2. set conceallevel=2 basically
;; 3. Instead of *, **, ***; use these symbols
(setq org-ellipsis " ▼"
      org-hide-emphasis-markers t
      org-superstar-headline-bullets-list '("⦿" "◉" "○" "❖" "◆" "◇"))

(with-eval-after-load 'org-faces
;; for each heading level, set diffirent font size, and use doc font
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :weight 'bold :height (cdr face))))

;; use firacode for these blocks in list
(defun my-adjoin-to-list-or-symbol (element list-or-symbol)
  (let ((list (if (not (listp list-or-symbol))
                  (list list-or-symbol)
                list-or-symbol)))
    (require 'cl-lib)
    (cl-adjoin element list)))

(eval-after-load "org"
  '(mapc
    (lambda (face)
      (set-face-attribute
       face nil
       :inherit
       (my-adjoin-to-list-or-symbol
        'fixed-pitch
        (face-attribute face :inherit))))
    (list 'org-code 'org-block 'org-table 'org-table-header 'org-todo 'org-verbatim 'org-special-keyword 'org-meta-line 'org-checkbox)))

;;---------------------------ORG-end-----------------------------------
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
