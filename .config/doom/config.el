(setq user-full-name "yashkarthik.eth")

;;  NOTE:
;;  Text wrapping:
;;  By default, Emacs wraps a line that reaches the window width, except at a word boundary. The buffer text is not changed.
;;  Modes such as AutoFillMode insert a line ending after the last word that occurs before the value of option ‘fill-column’ (a column number).
;;  Modes such as VisualFillColumn (in concert with VisualLineMode) wrap a line after the last word before ‘fill-column’, but ultimately they do not alter the buffer text. Such “soft” wrapping is essentially a display effect.
;;  Modes such as VisualLineMode wrap a line right before the window edge, but ultimately they do not alter the buffer text. VisualLineMode wrapping is essentially a display effect.

;; Function defs (used later)


;; THEMES

;; Themes > colorscheme
(setq doom-theme 'doom-palenight)

;; Themes > fonts
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 15)
      doom-big-font(font-spec :family "FiraCode Nerd Font Mono" :size 25))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; Themes > other
(setq indent-tabs-mode nil)
(setq display-line-numbers-type 'relative)

;; ORG
(setq org-directory "~/org")
(setq org-agenda-files (quote ("~/org/agenda")))

(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-agenda-start-with-log-mode t) ;; daily planner thingy
(setq org-ellipsis " ▼"
            org-hide-emphasis-markers t
            org-superstar-prettify-item-bullets t
            org-superstar-headline-bullets-list '("◉" "●" "○" "❖" "◆" "◇")
            )

(defcustom org-superstar-item-bullet-alist
  '((?* . ?•)
    (?+ . ?•)
    (?- . ?•))
  "Alist of UTF-8 bullets to be used for plain org lists.

You should call ‘org-superstar-restart’ after changing this
variable for your changes to take effect."
  :group 'org-superstar
  :type '(alist :options ((?* (character))
                          (?+ (character))
                          (?- (character)))))

;; Not sure if i want this
;;(with-eval-after-load 'org-faces (dolist (face '((org-level-1 . 1.2)
;;                                                 (org-level-2 . 1.1)
;;                                                 (org-level-3 . 1.05)
;;                                                 (org-level-4 . 1.0)
;;                                                 (org-level-5 . 1.0)
;;                                                 (org-level-6 . 1.0)
;;                                                 (org-level-7 . 1.0)
;;                                                 (org-level-8 . 1.0)))
;;                                   (set-face-attribute (car face) nil :weight 'bold :height (cdr face)))
;;                      )


(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; use Firacode for these blocks in list
(defun my-adjoin-to-list-or-symbol (element list-or-symbol)
  (let ((list (if (not (listp list-or-symbol))
                  (list list-or-symbol)
                list-or-symbol)))
    (require 'cl-lib)
    (cl-adjoin element list))
  )

;; run the above function for the list
(defun make-code-monospace ()
  '(mapc
    (lambda (face)
      (set-face-attribute
       face nil
       :inherit
       (my-adjoin-to-list-or-symbol
        'fixed-pitch
        (face-attribute face :inherit))))

    (list 'org-code 'org-block
          'org-table 'org-table-header
          'org-todo 'org-verbatim 'org-special-keyword
          'org-meta-line 'org-checkbox)
    )
  )


(make-code-monospace)

;; Spell

;; org-hook
(defun my/writing-hook ()
  (setq visual-fill-column-center-text t)
  (setq ispell-program-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))

  (flyspell-mode)
  (org-appear-mode)
  (visual-line-mode)
  (visual-fill-column-mode)
  (adaptive-wrap-prefix-mode))

(add-hook!
 'org-mode-hook
 'my/writing-hook)

(setq org-indent-indentation-per-level 1)

;; ORG-roam
(after! org-roam
  :init
  (setq org-roam-v2-ack t)

  :custom
  (setq org-roam-directory "~/Knowledge\sBase")
  (setq org-roam-capture-templates
   '(("d" "default" plain "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)

     ("n" "Notes" plain "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                         ":PROPERTIES:
:author:
:link:
:date:
:END:
#+title: ${title}\n")
      :unnarrowed t)

     ("b" "bio" plain "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                         ":PROPERTIES:
:twitter: [[https://twitter.com/%^{twitter}][%\\1]]
:link:
:END:
#+title: ${title}
#+filetags: :bio:")
      :unnarrowed t)))

  :config
  (org-roam-setup))

;; done't open capture buffer, just put the link
(defun my/org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

;;(map! :leader
;;      (:prefix-map ("m" . "<localleader>")
;;      (:prefix-map ("m" . "roam")
;;       :desc "Insert immediately" "m" #'my/org-roam-node-insert-immediate)))

;; ORG-roam UI
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; disable whitespace-mode
(setq global-whitespace-mode -1)

;; tailwind-css
(use-package! lsp-tailwindcss)

(setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2)

;; use markdown-mode for .mdx
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
