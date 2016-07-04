; Font lock in all major modes
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Don't beep. Don't visible-bell (fails on el capitan). Just blink the modeline on errors.
(setq visible-bell nil)

(put 'upcase-region 'disabled nil)
(add-hook 'write-file-hooks 'time-stamp)
(line-number-mode 1)

; determine if I'm running Emacs 21 or 20, and change accordingly;
(setq crs-v21 (eq emacs-major-version 21))

;; Title
(setq frame-title-format (list "%b - GNU Emacs " emacs-version))
(setq icon-title-format frame-title-format)

;; MAC options
(when is-mac
  (setq mac-function-modifier 'control)
  (setq mac-command-modifier 'meta)
  )

;;[Esc] [Esc] invoke goto-line
(define-key global-map "\e\e" 'goto-line)

;; Key bindings
(global-set-key [f1] 'find-file-recursively)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-1") 'other-window)

; Highlight marked region
(transient-mark-mode t)

; Stop cursor blinking which is a PITA
(blink-cursor-mode -1)

;; Allows Emacs to load gzipped and bzipped files on the fly and
;; then recompress them before saving them. 
(auto-compression-mode 1)

; Automagically save bookmarks
(setq bookmark-save-flag 1)

; Make mouse yank at point
(setq mouse-yank-at-point t)

; Make searches case-insensitive
(setq case-fold-search t)

; Man page pushiness
(setq Man-notify-method 'pushy)

; Parenthesis matching
(show-paren-mode 1)

; Show line and column numbers in modeline
(line-number-mode t)
(column-number-mode t)

; Don't add newlines to end of buffer when scrolling
(setq next-line-add-newlines nil)
;
; Don't modify eol's
(setq inhibit-eol-conversion t)
;
; 'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p)
;
; Access system clipboard
(setq x-select-enable-clipboard t)
;

;; Font lock faces
(set-face-foreground 'font-lock-comment-face "peru")
(set-face-foreground 'font-lock-string-face "lime green")
(set-face-foreground 'font-lock-function-name-face "orange red")
(set-face-foreground 'font-lock-keyword-face "magenta")
(set-face-foreground 'font-lock-constant-face "gold1")
(set-face-foreground 'font-lock-type-face "cyan2")
(set-face-foreground 'font-lock-variable-name-face "white")
(set-face-foreground 'font-lock-builtin-face "PaleGreen1")


(setq default-frame-alist
      '(
        (font . "-misc-fixed-medium-r-normal--12-120-100-100-c-90-iso8859-1")
        (background-color . "black")
        (foreground-color . "white")
        ))

(column-number-mode 1)
(setq inhibit-startup-message t)

;; Fill up to in Text mode
(setq default-fill-column 80)	     

;; to open shell in emacs use: M-x shell
(ansi-color-for-comint-mode-on)

;; disabling indent-tabs-mode and setting inden offset and tab-width 
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;to set foreground color to white
(set-foreground-color "white")

;;to set background color to black
(set-background-color "black")

;; fullscreen mode
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-hook 'shell-mode-hook 
          'ansi-color-for-comint-mode-on)

;; setting default c-x f directory
(setq default-directory (concat (getenv "HOME") "/"))

(defun my-insert-file-name (filename &optional args)
    "Insert name of file FILENAME into buffer after point.
  
  Prefixed with \\[universal-argument], expand the file name to
  its fully canocalized path.  See `expand-file-name'.
  
  Prefixed with \\[negative-argument], use relative path to file
  name from current directory, `default-directory'.  See
  `file-relative-name'.
  
  The default with no prefix is to insert the file name exactly as
  it appears in the minibuffer prompt."
    ;; Based on insert-file in Emacs -- ashawley 20080926
    (interactive "*fInsert file name: \nP")
    (cond ((eq '- args)
           (insert (file-relative-name filename)))
          ((not (null args))
           (insert (expand-file-name filename)))
          (t
           (insert filename))))

(global-set-key "\C-x\C-i" 'my-insert-file-name)

(provide 'appearance)


