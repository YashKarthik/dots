;;; configs/org-config/basic.el -*- lexical-binding: t; -*-

(setq org-directory "~/Nextcloud/Knowledge\sBase")
(setq org-agenda-files (quote ("~/Nextcloud/Knowledge\sBase/agenda")))

(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-agenda-start-with-log-mode t) ;; daily planner thingy

(setq org-cycle-separator-lines 1)

(dolist (mode '(org-mode-hook
                markdown-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package! org-download
  :init
  (setq org-download-method 'directory)
  (setq-default org-download-image-dir "~/Nextcloud/Knowledge\sBase/images")

  :config
  (setq-default org-download-heading-lvl nil)
  (defun dummy-org-download-annotate-function (link) "")
  (setq org-download-annotate-function 'dummy-org-download-annotate-function))


(use-package! mixed-pitch
  :hook
  '(text-mode . mixed-pitch-mode))

;; org-hook
(defun my/writing-hook ()
  (setq org-appear-mode t
        visual-fill-column-center-text t
        org-image-actual-width (/ (* (display-pixel-width) 1) 3))

  (mixed-pitch-mode)
  (visual-line-mode)
  (org-download-enable)
  (visual-fill-column-mode))

(add-hook!
 'text-mode-hook
 'my/writing-hook)

;; todo keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(d)" "MAYBE(m)" "|" "DONE(d)" "CANCELLED(c)")
       (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
       (sequence "NOTE")))
