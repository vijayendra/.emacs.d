(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(define-key web-mode-map (kbd "C-n") 'web-mode-tag-match)

(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

(add-hook 'web-mode-hook '(lambda () (yas-activate-extra-mode 'html-mode)))
(add-hook 'web-mode-hook 'company-mode)
(add-hook 'web-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-yasnippet))
  (company-mode)))

(add-hook 'web-mode-hook
  (lambda () (untabify (point-min) (point-max))))

(provide 'setup-web-mode)

