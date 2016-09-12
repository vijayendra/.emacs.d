(require 'python-mode)

(setq python-shell-virtualenv-path "/Users/vijay/gitrepos/drive-migration/venv")

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot nil)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-jedi))

(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer)

(add-hook 'jedi-mode-hook 'jedi-direx:setup)

(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=100"))
(setq py-autopep8-options '("--ignore=E265"))

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)
(setq py-isort-options '("--lines=100"))



(provide 'setup-python-mode)
