;; Turn off mouse interface early in startup to avoid momentary display

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(setq snippets-dir
      (expand-file-name "snippets" user-emacs-directory))

(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'my-comint-init)

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "saves")))))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load custom-file)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Set up appearance early
(require 'appearance)

(setq package-list
      '(
        exec-path-from-shell
        web-mode
        yasnippet
        ; go-mode
        company
        company-go
        magit
        python-mode
        jedi
        jedi-direx
        company-jedi
        flycheck
        ; virtualenvwrapper
        py-autopep8
        py-isort
        yaml-mode
        markdown-mode
        eclim
        gradle-mode
        company-emacs-eclim
        ))

;; Setup packages
(require 'setup-package)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(exec-path-from-shell-initialize)

(require 'setup-iswitchb)
(require 'setup-yasnippet)
(require 'setup-company-mode)
(require 'setup-web-mode)
; (require 'setup-go-mode)
(require 'setup-magit)
(require 'setup-yaml)
(require 'setup-python-mode)
(require 'setup-flycheck-mode)
(require 'setup-eclim-mode)



