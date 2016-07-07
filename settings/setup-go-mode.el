(require 'go-mode)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setq go-work-dir
      (expand-file-name "~/gowork"))

(setenv "GOPATH" go-work-dir)

(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path (concat go-work-dir "bin"))
(add-hook 'before-save-hook 'gofmt-before-save)

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Go oracle
  (load-file (concat go-work-dir "/src/golang.org/x/tools/cmd/oracle/oracle.el"))
  ; Godef jump key binding
  
  (local-set-key (kbd "M-.") 'godef-jump)
  ; Find tag in other window
  (local-set-key (kbd "C-x 4 .") 'godef-jump-other-window)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))

(setq company-tooltip-limit 10)                       ; bigger popup window
(setq company-idle-delay .2)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(setq company-selection-wrap-around 1) ; start autocompletion only after typing

;; (custom-set-faces
;;  '(company-preview
;;    ((t (:foreground "darkgray" :underline t))))
;;  '(company-preview-common
;;    ((t (:inherit company-preview))))
;;  '(company-tooltip
;;    ((t (:background "lightgray" :foreground "black"))))
;;  '(company-tooltip-selection
;;    ((t (:background "steelblue" :foreground "white"))))
;;  '(company-tooltip-common
;;    ((((type x)) (:inherit company-tooltip :weight bold))
;;     (t (:inherit company-tooltip))))
;;  '(company-tooltip-common-selection
;;    ((((type x)) (:inherit company-tooltip-selection :weight bold))
;;     (t (:inherit company-tooltip-selection)))))

(add-to-list 'load-path (concat go-work-dir "/src/github.com/dougm/goflymake"))

(require 'go-flymake)

(provide 'setup-go-mode)

