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
(setq doom-theme 'doom-tokyo-night)


(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Source Serif Pro" :height 1.05))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; splash screen
(setq fancy-splash-image (concat doom-private-dir "splash.png"))

(set-face-background 'scroll-bar "transparent")

;; nyan cat
(use-package! nyan-mode
  :hook (doom-modeline-mode . nyan-mode)
  :config
  (setq nyan-animate-nyancat t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq indent-tabs-mode nil)
(setq display-line-numbers-type 'relative)

(setq evil-insert-state-cursor '((bar . 2) "plum")
      evil-normal-state-cursor '(box "plum")
      evil-visual-state-cursor '(box "magenta")
      evil-replace-state-cursor '(hbar "plum")
      )

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)

;; ORG
(setq org-directory "~/Knowledge\sBase")
;;(setq org-agenda-files (quote ("~/Knowledge\sBase/agenda")))


(setq org-agenda-files (list "~/Knowledge\sBase/agenda"
                             "~/Knowledge\sBase/College\sStuff.org"))

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

;; Not sure if i want header sizes
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

;; un-hides whitespace between headings when collapsing headings.
(customize-set-variable 'org-blank-before-new-entry
                        '((heading . nil)
                          (plain-list-item . nil)))
(setq org-cycle-separator-lines 1)

(dolist (mode '(org-mode-hook
                markdown-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(require 'org-download)

(setq org-download-method 'directory)
(setq-default org-download-heading-lvl nil)
(setq-default org-download-image-dir "~/Knowledge\sBase/images")

(defun dummy-org-download-annotate-function (link) "")
(setq org-download-annotate-function 'dummy-org-download-annotate-function)

;; org-hook

(defun my/writing-hook ()
  (setq mixed-pitch-set-height t
        org-image-actual-width nil
        visual-fill-column-center-text t
        org-image-actual-width (/ (* (display-pixel-width) 1) 3))

  (set-face-attribute 'variable-pitch nil :height 1.05)

  (org-appear-mode)
  (svg-tag-mode-on)
  (mixed-pitch-mode)
  (visual-line-mode)
  (org-download-enable)
  (visual-fill-column-mode))

(add-hook!
 'text-mode-hook
 'my/writing-hook)

(defun my/agenda-text-pitch-hook ()
  (if (string= default-directory "/Users/Yash/Knowledge Base/agenda/")
      (mixed-pitch-mode 0)))

(add-hook!
 'org-mode-hook
 'my/agenda-text-pitch-hook)

;; ORG-roam
(use-package! org-roam
  :ensure t
  :init
  (setq org-roam-directory "~/Knowledge\sBase")
  :config
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n")
           :unnarrowed t)

          ("n" "Notes" plain "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              ":PROPERTIES:
:people:
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

  (setq org-roam-dailies-capture-templates
        '(("d" "default" plain
           "\n[%<%R>] %?"
           :target (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%d %b, %Y>\n")
           :unnarrowed t)))


  (org-roam-setup))

;; open org-roam node in new split
(map! :leader
      (:desc "Open node in new split" "n r v" (lambda () (interactive) (+evil/window-vsplit-and-follow) (org-roam-node-find))))

(map! :leader
      (:desc "Open node in new split" "n r h" (lambda () (interactive) (+evil/window-split-and-follow) (org-roam-node-find))))

;; ORG-roam UI

(use-package! websocket
  :after org-roam)

;;(use-package! org-roam-ui
;;  :hook (after-init . org-roam-ui-mode)
;;  :config
;;  (setq org-roam-ui-follow nil
;;        org-roam-ui-open-on-start nil
;;        org-roam-ui-update-on-save t))

;; disable whitespace-mode
(setq global-whitespace-mode -1)

;; tailwind-css
(use-package! lsp-tailwindcss)

(defun my-web-mode-hook ()
  "Hooks for web mode"
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        typescript-indent-level 2))

(add-hook 'web-mode-hook
          'my-web-mode-hook)

(add-hook 'typescript-mode-hook
          'my-web-mode-hook)

;; use markdown-mode for .mdx
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))

(setq sql-mysql-options '("-C" "-t" "-f" "-n"))

;;svg-tag-mode https://github.com/rougier/svg-tag-mode
(require 'svg-tag-mode)

(defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")
(defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")
(defconst day-re "[A-Za-z]\\{3\\}")
(defconst day-time-re (format "\\(%s\\)? ?\\(%s\\)?" day-re time-re))

(defun svg-progress-percent (value)
  (svg-image (svg-lib-concat
              (svg-lib-progress-bar (/ (string-to-number value) 100.0)
                                nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
              (svg-lib-tag (concat value "%")
                           nil :stroke 0 :margin 0)) :ascent 'center))

(defun svg-progress-count (value)
  (let* ((seq (mapcar #'string-to-number (split-string value "/")))
         (count (float (car seq)))
         (total (float (cadr seq))))
  (svg-image (svg-lib-concat
              (svg-lib-progress-bar (/ count total) nil
                                    :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
              (svg-lib-tag value nil
                           :stroke 0 :margin 0)) :ascent 'center)))

(setq svg-tag-tags
      `(
        ;; Org tags
        (":\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))
        (":\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))

        ;; Task priority
        ("\\[#[A-Z]\\]" . ( (lambda (tag)
                              (svg-tag-make tag :face 'org-priority
                                            :beg 2 :end -1 :margin 0))))

        ;; Progress
        ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)
                                            (svg-progress-percent (substring tag 1 -2)))))
        ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)
                                          (svg-progress-count (substring tag 1 -1)))))

        ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :face 'org-todo :inverse t :margin 0))))

        ("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'org-done :margin 0))))


        ;; Citation of the form [cite:@Knuth:1984]
        ("\\(\\[cite:@[A-Za-z]+:\\)" . ((lambda (tag)
                                          (svg-tag-make tag
                                                        :inverse t
                                                        :beg 7 :end -1
                                                        :crop-right t))))
        ("\\[cite:@[A-Za-z]+:\\([0-9]+\\]\\)" . ((lambda (tag)
                                                (svg-tag-make tag
                                                              :end -1
                                                              :crop-left t))))


        ;; Active date (with or without day name, with or without time)
        (,(format "\\(<%s>\\)" date-re) .
         ((lambda (tag)
            (svg-tag-make tag :beg 1 :end -1 :margin 0))))

        (,(format "\\(<%s \\)%s>" date-re day-time-re) .
         ((lambda (tag)
            (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0))))

        (,(format "<%s \\(%s>\\)" date-re day-time-re) .
         ((lambda (tag)
            (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0))))

        ;; Inactive date  (with or without day name, with or without time)
         (,(format "\\(\\[%s\\]\\)" date-re) .
          ((lambda (tag)
             (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))

         (,(format "\\(\\[%s \\)%s\\]" date-re day-time-re) .
          ((lambda (tag)
             (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0 :face 'org-date))))

         (,(format "\\[%s \\(%s\\]\\)" date-re day-time-re) .
          ((lambda (tag)
             (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0 :face 'org-date))))

         (,(format "\\(\\[%s\\]\\)" time-re) .
          ((lambda (tag)
             (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))

         ))

;; Elfeed
(setq elfeed-goodies/entry-pane-size 0.5)
(setq elfeed-feeds
      '(("https://nav.al/feed" wisdom)
        ("https://meltingasphalt.com/feed/" philosophy behavior)
        ("https://latecheckout.substack.com/feed" communities web3)
        ("https://sahilbloom.substack.com/feed" investing life)
        ("https://balajis.com/rss/" web3 politics future)
        ("https://www.weskao.com/blog?format=rss" education communities)
        ("https://fs.blog/feed" wisdom frameworks)
        ("https://www.alexbeckett.xyz/rss/" crypto-technical)
        ;;("http://www.aaronsw.com/2002/feeds/pgessays.rss" startups investing tech)
        ))

;; Embark
;; select candidate and C-; v/h to open in new vertical/horizontal split
(map!
 :map embark-file-map
 :desc "Open file in v-split" "v" (lambda ()
                                    (interactive)
                                    (+evil/window-vsplit-and-follow)
                                    (call-interactively #'find-file))

 :desc "Open file in h-split" "h" (lambda ()
                                    (interactive)
                                    (+evil/window-split-and-follow)
                                    (call-interactively #'find-file)))

;; Spell
(after! ispell
  (setq ispell-program-name "aspell"
        ispell-dictionary "en_US"
        ispell-local-dictionary "en_US"
        ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")))


;; Latex
(setq TeX-PDF-mode t)
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
(add-to-list 'exec-path "/Library/TeX/texbin/")

(setq org-preview-latex-default-process 'dvisvgm)
(after! org (plist-put org-format-latex-options :scale 1))
(setq org-latex-listings 'minted)

(require 'org-src)
(add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t)))

;; other

(setq pdf-view-use-scaling t)
(setq tool-bar-mode nil)
(setq ns-pop-up-frames t)

;; python
(use-package! pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(setq auth-sources nil)
(setq password-cache-expiry nil)
