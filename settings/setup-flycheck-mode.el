(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Better use pylint
;;(require 'flycheck-pyflakes)
;;(add-hook 'python-mode-hook 'flycheck-mode)

(defun flycheck-python-setup ()
  (flycheck-mode))
(add-hook 'python-mode-hook #'flycheck-python-setup)

(require 'python)

;; We can safely declare this function, since we'll only call it in Python Mode,
;; that is, when python.el was already loaded.
(declare-function python-shell-calculate-exec-path "python")

(defun flycheck-virtualenv-set-python-executables ()
  "Set Python executables for the current buffer."
  (let ((exec-path (python-shell-calculate-exec-path)))
    (setq-local flycheck-python-pylint-executable
                (executable-find "pylint"))
    (setq-local flycheck-python-flake8-executable
                (executable-find "flake8"))))

(defun flycheck-virtualenv-setup ()
  "Setup Flycheck for the current virtualenv."
  (when (derived-mode-p 'python-mode)
    (add-hook 'hack-local-variables-hook
              #'flycheck-virtualenv-set-python-executables 'local)))

(add-hook 'flycheck-mode-hook #'flycheck-virtualenv-setup)

(provide 'setup-flycheck-mode)
