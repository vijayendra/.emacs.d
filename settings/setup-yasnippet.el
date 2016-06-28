(require 'yasnippet)

(yas/initialize)
(yas-global-mode 1)

;(setq yas/root-directory snippets-dir)
;(yas/load-directory yas/root-directory)

(yas-reload-all)

(define-key yas-minor-mode-map (kbd "C-i") 'yas-insert-snippet)

(provide 'setup-yasnippet)

