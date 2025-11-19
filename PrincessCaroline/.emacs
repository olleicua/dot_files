(setq comp-deferred-compilation nil)
(setq native-comp-deferred-compilation nil)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;(server-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(package-selected-packages '(whitespace-plus company)))

(load-theme 'deeper-blue t)

;; Enable electric indent
(electric-indent-mode 1)

;; Company mode for completion
;; (use-package company
;;   :ensure t
;;   :config
;;   (global-company-mode 1)
;;   (setq company-tooltip-limit 10
;;         company-show-numbers t
;;         company-idle-delay 0.2
;;         company-minimum-prefix-length 2))

;; Smart tab function
;; (defun smart-tab ()
;;   "Smart tab behavior: complete or indent."
;;   (interactive)
;;   (cond
;;    ((minibufferp) (minibuffer-complete))
;;    ((and company-mode (company--should-complete))
;;     (company-complete-common-or-cycle))
;;    ((looking-at "\\_>") (completion-at-point))
;;    (t (indent-for-tab-command))))
;; 
;; (global-set-key (kbd "TAB") 'smart-tab)

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

;; whitespace

(setq-default show-trailing-whitespace t)


;; CSS
(with-eval-after-load 'css-mode
  ;; Set the indentation step to 2 spaces for css-mode
  (setq css-indent-offset 2)
)
