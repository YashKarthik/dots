;;; configs/org-configs/org-roam-config.el -*- lexical-binding: t; -*-

(use-package! org-roam
  :ensure t
  :init
  (setq org-roam-directory "~/Nextcloud/Knowledge\sBase")
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
      '(("t" "Todo" entry (file "~/Nextcloud/Knowledge\sBase/agenda/todo.org")
         "* TODO %?\n")
        ("s" "Fleeting" entry (file "~/Nextcloud/Knowledge\sBase/agenda/inbox.org")
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
