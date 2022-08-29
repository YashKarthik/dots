;;; configs/spell-config.el -*- lexical-binding: t; -*-

(after! ispell
  (setq ispell-program-name "aspell"
        ispell-dictionary "en_US"
        ispell-local-dictionary "en_US"
        ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")))
