(use-package! org-caldav
  :init

  ;; Sync on close; and save after syncing.
  (defun org-caldav-sync-at-close ()
    (org-caldav-sync)
    (save-some-buffers))

  ;; delayed sync.
  (defvar org-caldav-sync-timer nil
    "Timer that `org-caldav-push-timer' used to reschedule itself, or nil.")

  (defun org-caldav-sync-with-delay (secs)
    (when org-caldav-sync-timer
      (cancel-timer org-caldav-sync-timer))
    (setq org-caldav-sync-timer
          (run-with-idle-timer
           (* 1 secs) nil 'org-caldav-sync)))

  ;; Server config
  (setq org-caldav-url "https://172-105-62-50.ip.linodeusercontent.com/remote.php/dav/calendars/admin")
  (setq org-icalendar-alarm-time 1)
  (setq org-caldav-calendars
        `((:calendar-id "tasks-1"
           :inbox ("~/Nextcloud/Knowledge\sBase/agenda/calendars.org")
           :files ("~/Nextcloud/Knowledge\sBase/agenda/todo.org",  "~/Nextcloud/Knowledge\sBase/agenda/inbox.org"))))

  :config
  (setq org-icalendar-alarm-time 1)
  (setq org-icalendar-include-todo 1)
  (setq org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due))
  (setq org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo))
  (setq org-icalendar-timezone "Asia/Kolkata")

  (add-hook 'after-save-hook
            (lambda ()
              (when (eq major-mode 'org-mode)
                (org-caldav-sync-with-delay 300))))

  (add-hook 'kill-emacs-hook 'org-caldav-sync-at-close))
