(setq user-full-name "yashkarthik")

;; THEMES

;; Themes > colorscheme
(setq doom-theme 'doom-tokyo-night)


(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "SF Pro" :size 15))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

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

;; ORG
(setq org-directory "~/Knowledge\sBase")
(setq org-agenda-files (quote ("~/Knowledge\sBase/agenda")))

(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-agenda-start-with-log-mode t) ;; daily planner thingy
(setq org-ellipsis " ▼"
            org-hide-emphasis-markers t
            org-superstar-prettify-item-bullets t
            org-superstar-headline-bullets-list '("◉" "●" "○" "❖" "◆" "◇"))

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
  (setq org-roam-node-display-template
        (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

  (setq org-roam-capture-templates
        '(("p" "People" plain "%?"
           :if-new (file+head "people/${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)

          ("r" "Reference" plain "%?"
           :if-new (file+head "reference/${slug}.org"
                              ":PROPERTIES:
:DATE: %<%d %b, %Y>
:ROAM_REFS:
:END:
#+title: ${title}\n")
           :unnarrowed t)

          ("e" "Evergreen" plain "%?"
           :if-new (file+head "evergreen/${slug}.org"
                              ":PROPERTIES:
:DATE: %<%d %b, %Y>
:END:
#+title: ${title}\n")
           :unnarrowed t)))

  (setq org-roam-dailies-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "%<%d %b %Y>.org" "#+title: %<%d %b, %Y>\n")
           :unnarrowed t)))


  (org-roam-setup))

(setq org-capture-templates
      '(("t" "Todo" entry (file "~/Knowledge\sBase/agenda/todo.org")
         "* TODO %?\n")
        ("s" "Fleeting" entry (file "~/Knowledge\sBase/inbox.org")
         "* %?\n")))

(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
        (file-name-directory
         (file-relative-name (org-roam-node-file node) org-roam-directory))))
    (error "")))

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
(setq org-latex-src-block-backend 'minted)

(require 'org-src)
(add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t)))

;; visual
(setq pdf-view-use-scaling t)
(setq tool-bar-mode nil)
(setq ns-pop-up-frames t)

;; python
(use-package! pipenv
  :hook (python-mode . pipenv-mode))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(setq auth-sources nil)
(setq password-cache-expiry nil)

;; org-alert: https://github.com/spegoraro/org-alert
(use-package! org-alert
  :ensure t)
(setq org-alert-interval 300
      org-alert-notify-cutoff 10
      org-alert-notify-after-event-cutoff 10
      org-alert-notification-title "Reminder")

(setq alert-default-style 'osx-notifier)
(setq alert-fade-time 10)

(advice-add 'alert :after #'my/play-sound-on-alert
 '((name . "my/org-alert-sound")))

(defun my/play-sound-on-alert (&rest r)
  (start-process-shell-command "Agenda Alert" nil "afplay /System/Library/Sounds/Glass.aiff"))

;;(advice-remove
;; 'org-alert--dispatch
;; "my/org-alert-sound")
