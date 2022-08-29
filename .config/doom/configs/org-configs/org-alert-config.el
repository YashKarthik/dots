;;; configs/org-configs/org-alert-config.el -*- lexical-binding: t; -*-

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

(org-alert-enable)
