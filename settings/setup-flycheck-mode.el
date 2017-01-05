(require 'flycheck)

;; flycheck mode uses pylint by default
;; run `pip install pylint`

(add-hook 'after-init-hook #'global-flycheck-mode)

(defun flycheck-python-setup ()
  (flycheck-mode))
(add-hook 'python-mode-hook #'flycheck-python-setup)

(require 'python)

(provide 'setup-flycheck-mode)
