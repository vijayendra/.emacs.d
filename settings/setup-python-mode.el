(require 'python-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot nil)

;; use following for python3 support
(setq jedi:environment-root "python3")
(setq jedi:environment-virtualenv
     (list "/Library/Frameworks/Python.framework/Versions/3.6/bin/virtualenv"))

;; use following for python2 support
;(setq jedi:environment-root "python2")
;(setq jedi:environment-virtualenv
;      (list "/usr/local/bin/virtualenv-2.7"))

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-jedi))

(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer)

(add-hook 'jedi-mode-hook 'jedi-direx:setup)

;; install following pip packages manually
;; cd ~/.emacs.d/.python-environments/default/bin/
;; ./pip install autopep8 isort pylint flake8

(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=100"))
(setq py-autopep8-options '("--ignore=E265"))

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)
(setq py-isort-options '("--lines=100"))

(add-hook 'comint-output-filter-functions 'python-pdbtrack-comint-output-filter-function)

(provide 'setup-python-mode)
