;;; configs/embark-config.el -*- lexical-binding: t; -*-

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
