(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck-pyflakes)
(add-hook 'python-mode-hook 'flycheck-mode)

(provide 'setup-flycheck-mode)
