(require 'python-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-jedi))

(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer)

(add-hook 'jedi-mode-hook 'jedi-direx:setup)

(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=100"))

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)
(setq py-isort-options '("--lines=100"))

(provide 'setup-python-mode)
