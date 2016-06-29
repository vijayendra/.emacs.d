;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
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
;; Set up appearance early
(require 'appearance)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

(setq package-list
      '(
        web-mode
        yasnippet
        go-mode
        python-mode
        company
        company-go
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


(require 'setup-iswitchb)
(require 'setup-yasnippet)
(require 'setup-company-mode)
(require 'setup-web-mode)
(require 'setup-go-mode)

