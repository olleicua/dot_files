(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(package-selected-packages '(company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'deeper-blue t)

;; Enable electric indent
(electric-indent-mode 1)

;; Company mode for completion
(use-package company
  :ensure t
  :config
  (global-company-mode 1)
  (setq company-tooltip-limit 10
        company-show-numbers t
        company-idle-delay 0.2
        company-minimum-prefix-length 2))

;; Smart tab function
(defun smart-tab ()
  "Smart tab behavior: complete or indent."
  (interactive)
  (cond
   ((minibufferp) (minibuffer-complete))
   ((and company-mode (company--should-complete))
    (company-complete-common-or-cycle))
   ((looking-at "\\_>") (completion-at-point))
   (t (indent-for-tab-command))))

(global-set-key (kbd "TAB") 'smart-tab)

;; Enable line numbers globally
(global-display-line-numbers-mode 1)

;; Enable column numbers globally
(column-number-mode 1)

;; horizontal space
(global-set-key (kbd "M-\]")
                (lambda () (interactive)
                  (when (string= "\n" (char-to-string (char-after)))
                    (delete-char 1))
                  (delete-horizontal-space)
                  (insert " ")))

(global-set-key (kbd "M-\\")
                (lambda () (interactive)
                  (when (string= "\n" (char-to-string (char-after)))
                    (delete-char 1))
                  (delete-horizontal-space)))

;; cursor
(setq-default cursor-type 'bar)

;; Enable whitespace mode globally
;; Comprehensive whitespace configuration
(setq whitespace-style
      '(face         ; Use faces to visualize
        tab-mark     ; Show tabs
        space-mark   ; Show spaces
        trailing     ; Highlight trailing whitespace
        lines-tail   ; Highlight lines longer than `whitespace-line-column'
        newline      ; Show newlines
        newline-mark ; Show newlines
        empty        ; Show empty lines at beginning/end of buffer
        ))


(setq whitespace-line-column 80) ; Highlight long lines
(setq whitespace-space-regexp "\\(\x3000+\\)") ; For full-width spaces

;; Custom faces
(custom-set-faces
 '(whitespace-space ((t (:background "gray15" :foreground "gray40"))))
 '(whitespace-tab ((t (:background "red" :foreground "red"))))
 '(whitespace-trailing ((t (:background "red" :foreground "white"))))
 '(whitespace-newline ((t (:foreground "gray30" :weight bold)))))

(global-whitespace-mode 1)
