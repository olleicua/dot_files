(add-to-list 'load-path "~/.emacs.d/")


(setq cursor-type 'bar)

(require 'haml-mode)
(add-hook 'haml-mode-hook
		  (lambda ()
			(setq indent-tabs-mode nil)
			(define-key haml-mode-map "\C-m" 'newline-and-indent)))

(require 'coffee-mode)
(require 'markdown-mode)

;; rainbow parentheses
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((((background light)) (:foreground "#403940" :weight bold))))
 '(rainbow-delimiters-depth-2-face ((((background light)) (:foreground "#3d6326" :weight bold))))
 '(rainbow-delimiters-depth-3-face ((((background light)) (:foreground "#0a31a6" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((((background light)) (:foreground "#bf22bf" :weight bold))))
 '(rainbow-delimiters-depth-5-face ((((background light)) (:foreground "#a84707" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((((background light)) (:foreground "#827d79" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((((background light)) (:foreground "#63a84a" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((((background light)) (:foreground "#3284ba" :weight bold))))
 '(rainbow-delimiters-depth-9-face ((((background light)) (:foreground "#701a91" :weight bold))))
 '(rainbow-delimiters-unmatched-face ((((background light)) (:background "#cccccc" :foreground "#dd090B" :weight bold)))))

; TABS ;
;(global-set-key "\C-i" 'self-insert-command)
;(defvar just-tab-keymap (make-sparse-keymap) "Keymap for just-tab-mode")
;(define-minor-mode just-tab-mode
;  "Just want the TAB key to be a TAB"
;  :global t :lighter " TAB" :init-value 0 :keymap just-tab-keymap
;  (define-key just-tab-keymap (kbd "TAB") 'indent-for-tab-command))
;(global-set-key (kbd "RET") 'newline-and-indent)
(setq default-tab-width 4) ;; 8 is way too many

;; Packages
;(require 'package)
;(add-to-list 'package-archives
;			 '("marmalade" . "http://marmalade-repo.org/packages/"))
;(package-initialize)

;; ORG-MODE suggested binding
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-todo-keywords
	  '((sequence "TODO" "STARTED" "|" "WAITING" "CANCELLED" "MISSED" "DONE")))
(setq org-agenda-include-diary t)
; mobileOrg setup
(setq org-directory "~/Dropbox/org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-agenda-files '("~/Dropbox/org/schedule.org"))
(setq org-mobile-index-for-pull "~/Dropbox/org/shcedule.org")
(global-set-key (kbd "C-c p") 'org-mobile-pull)
(global-set-key (kbd "C-c h") 'org-mobile-push)
; CALENDAR FUNCTIONS
(defun calendar-nearest-to (target-dayname target-day target-month)
  "Recurring event that occurs in the nearest TARGET-DAYNAME to
the date TARGET-DAY, TARGET-MONTH each year."
  (interactive)
  (let* ((dayname (calendar-day-of-week date))
         (target-date (list target-month target-day (calendar-extract-year date)))
         (days-diff (abs (- (calendar-day-number date)
                            (calendar-day-number target-date)))))
    (and (= dayname target-dayname)
         (< days-diff 4))))
(defun diary-limited-cyclic (recurrences interval y m d)
  "For use in emacs diary. Cyclic item with limited number of recurrences.
Occurs every INTERVAL days, starting on YYYY-MM-DD, for a total of
RECURRENCES occasions."
  (let ((startdate (calendar-absolute-from-gregorian (list m d y)))
        (today (calendar-absolute-from-gregorian date)))
    (and (not (minusp (- today startdate)))
         (zerop (% (- today startdate) interval))
         (< (floor (- today startdate) interval) recurrences))))

; ISWITCHB
(setq iswitchb-mode t)

; HIPPIE EXPAND
(define-key read-expression-map [(tab)] 'hippie-expand)

; META KEY
(setq mac-command-key-is-meta t)

; NEWLINES
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (setq require-final-newline nil)
	     (setq mode-require-final-newline nil)
	     (setq show-newlines-mode t)))

; TABS
;(add-hook 'before-save-hook 'untabify)

(global-auto-revert-mode t)

; TRAMP

(require 'tramp)
(setq tramp-default-method "ssh")
(defun sudo-edit-current-file ()
  (interactive)
  (find-alternate-file (concat "/sudo:root@localhost:"
                         (buffer-file-name (current-buffer)))))

(global-set-key (kbd "C-c C-r") 'sudo-edit-current-file)

; JS

(setq js-indent-level 2)
(setq coffee-indent-level 2)

; coffee script

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

; org

(require 'org-latex)
(setq org-export-latex-listings 'minted)
(setq org-latex-to-pdf-process '("pdflatex --shell-escape -interaction nonstopmode %s"
								 "pdflatex --shell-escape -interaction nonstopmode %s"))
(setq org-export-latex-listings 't) 
(add-to-list 'org-export-latex-packages-alist '("" "minted"))

; auto modes

(defun my-auto-mode ()
  (rainbow-delimiters-mode)
  (when (stringp buffer-file-name)
	(cond
	 ((or (string-match "\\.pryrc\\'" buffer-file-name)
		  (string-match "\\.rake\\'" buffer-file-name)
		  (string-match "\\Gemfile\\'" buffer-file-name)
		  (string-match "\\Gemfile.lock\\'" buffer-file-name))
	  (ruby-mode))
	 ((string-match "\\.hcl\\'" buffer-file-name)
	  (lisp-mode))
	((string-match "\\.md\\'" buffer-file-name)
	 (markdown-mode))
	((or (string-match "\\.scss\\'" buffer-file-name)
		 (string-match "\\.sass\\'" buffer-file-name))
	 (css-mode))
	((string-match "\\.json\\'" buffer-file-name)
	 (javascript-mode)))))

(add-hook 'find-file-hook 'my-auto-mode)
