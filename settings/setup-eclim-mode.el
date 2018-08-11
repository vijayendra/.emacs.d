(require 'eclim)
(require 'gradle-mode)
(require 'company)
(require 'company-emacs-eclim)

(setq eclimd-autostart t)

; emacs-eclim freezes when emacs generates auto-save-file, such as #Main.java#.
(setq auto-save-default nil)

(custom-set-variables
  '(eclim-eclipse-dirs '("/Users/vijay/eclipse/java-photon/Eclipse.app"))
  '(eclim-executable "/Users/vijay/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")
  '(eclimd-executable "/Users/vijay/eclipse/java-photon/Eclipse.app/Contents/Eclipse/eclimd")
  '(eclimd-default-workspace "~/eclipse-workspace")
  )

(add-hook 'java-mode-hook 'eclim-mode)
(add-hook 'java-mode-hook '(lambda() (gradle-mode 1)))
(add-hook 'java-mode-hook '(lambda () (yas-minor-mode -1)))
; To make our lives nice and sweet we’ll bind M-x gradle-execute build run to a key-combination in our .emacs file:
(defun build-and-run ()
	(interactive)
	(gradle-run "build run"))

; command to build and run
(define-key gradle-mode-map (kbd "C-c C-r") 'build-and-run)

; command to autocorrect problems
(define-key eclim-mode-map (kbd "C-c C-c") 'eclim-problems-correct)

(company-emacs-eclim-setup)
(global-company-mode t)


(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(provide 'setup-eclim-mode)
