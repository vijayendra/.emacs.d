(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(blink-cursor-mode nil)
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(eclim-eclipse-dirs (quote ("/Users/vijay/eclipse/java-photon/Eclipse.app")))
 '(eclim-executable "/Users/vijay/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")
 '(eclimd-default-workspace "~/eclipse-workspace")
 '(eclimd-executable
   "/Users/vijay/eclipse/java-photon/Eclipse.app/Contents/Eclipse/eclimd")
 '(global-font-lock-mode t nil (font-lock))
 '(grep-find-command
   (quote
    ("find ~/gitrepos/cmmcloud -name \"*.py\" -not -name \"*.pyc\" -not -name \"*flycheck*\" -exec grep --color -nH -e \"\" \\{\\} +" . 109)))
 '(grep-find-template "")
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-mode-indent-ignore-first-tab t)
 '(ns-command-modifier (quote meta))
 '(ns-function-modifier (quote control))
 '(safe-local-variable-values
   (quote
    ((project-venv-name . "celery-test")
     (project-venv-name . "mongo-test")
     (project-venv-name . "/Users/vijay/gitrepos/mongo-test/venv"))))
 '(sgml-tag-alist
   (quote
    (("!["
      ("ignore" t)
      ("include" t))
     ("!attlist")
     ("!doctype")
     ("test" t)
     ("!entity"))))
 '(show-paren-mode t nil (paren))
 '(tool-bar-mode nil)
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
 '(window-number-face ((t (:foreground "black"))) t))
