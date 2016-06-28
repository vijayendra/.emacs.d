;; setup iswitchb mode -- this is required for switching buffer on C-c b
(require 'iswitchb)
;; this is the list of buffers we never want to see
(defvar crs-hated-buffers
  '("KILL" "*Messages*"))
(setq iswitchb-buffer-ignore (append '("^ " "*Buffer")
                                     crs-hated-buffers))
(defun crs-hated-buffers ()
  "List of buffers I never want to see, converted from names to buffers."
  (delete nil
          (append
           (mapcar 'get-buffer crs-hated-buffers)
           (mapcar (lambda (this-buffer)
                     (if (string-match "^ " (buffer-name this-buffer))
                         this-buffer))
                   (buffer-list)))))

(defun crs-bury-buffer (&optional n)
  (interactive)
  (unless n
    (setq n 1))
  (let ((my-buffer-list (crs-delete-these (crs-hated-buffers)
                                          (buffer-list
                                           (selected-frame)))))
    (switch-to-buffer
     (if (< n 0)
         (nth (+ (length my-buffer-list) n)
              my-buffer-list)
       (bury-buffer)
       (nth n my-buffer-list)))))

(global-set-key [(control right)] 'crs-bury-buffer)
(global-set-key [(control left)] (lambda ()
                                   (interactive)
                                   (crs-bury-buffer -1)))

                                        ;			      
(iswitchb-mode 1)
(setq iswitchb-buffer-ignore '("^\*"))

(global-set-key "\C-x\C-b" 'electric-buffer-list)


(add-hook
 'iswitchb-define-mode-map-hook
 '(lambda ()
    (define-key iswitchb-mode-map [tab] 'iswitchb-next-match)))

(provide 'setup-iswitchb)
