;;; configs/shell-env.el -*- lexical-binding: t; -*-

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(setq auth-sources nil)
(setq password-cache-expiry nil)
