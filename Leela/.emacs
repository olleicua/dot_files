(add-to-list 'load-path "~/.emacs.d/lisp/")


(setq backup-inhibited t)
(setq cursor-type 'bar)

;; (require 'haml-mode)
;; (add-hook 'haml-mode-hook
;;           (lambda ()
;;             (setq indent-tabs-mode nil)
;;             (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;; (require 'coffee-mode)
;; (require 'markdown-mode)

;; meta key
(setq mac-option-modifier 'meta)

;; LAYOUT

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (set-background-color "#702060")
(set-foreground-color "#ffefcf")
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;; FACES

(custom-set-faces

 ;; defaults
 '(default ((t (:background "black" :foreground "white"))))

 ;; whitespace
 '(whitespace-space ((t (:bold t :foreground "#300020"))))
 '(whitespace-indentation ((t (:bold t :foreground "#300020"))))
 '(whitespace-line ((t ())))
 '(whitespace-newline ((t (:foreground "#300020"))))
 '(whitespace-tab ((t (:foreground "#ffbbaa" :background "#ff3030"))))
 '(whitespace-trailing ((t (:foreground "#ffbbaa" :background "#ff3030"))))

 ;; line numbers
 '(linum ((t (:foreground "black" :background "green"))))

 ;; rainbow delimeters
 ;; '(rainbow-delimiters-depth-1-face ((((background light)) (:foreground "#403940" :weight bold))))
 ;; '(rainbow-delimiters-depth-2-face ((((background light)) (:foreground "#3d6326" :weight bold))))
 ;; '(rainbow-delimiters-depth-3-face ((((background light)) (:foreground "#0a31a6" :weight bold))))
 ;; '(rainbow-delimiters-depth-4-face ((((background light)) (:foreground "#bf22bf" :weight bold))))
 ;; '(rainbow-delimiters-depth-5-face ((((background light)) (:foreground "#a84707" :weight bold))))
 ;; '(rainbow-delimiters-depth-6-face ((((background light)) (:foreground "#827d79" :weight bold))))
 ;; '(rainbow-delimiters-depth-7-face ((((background light)) (:foreground "#63a84a" :weight bold))))
 ;; '(rainbow-delimiters-depth-8-face ((((background light)) (:foreground "#3284ba" :weight bold))))
 ;; '(rainbow-delimiters-depth-9-face ((((background light)) (:foreground "#701a91" :weight bold))))
 ;; '(rainbow-delimiters-unmatched-face ((((background light)) (:background "#ffbbaa" :foreground "#ff3030" :weight bold))))
 )

;; newline character

(setq whitespace-display-mappings
      '((space-mark 32 [183] [46])
        (newline-mark 10 [8629 10])
        (tab-mark 9 [9655 9] [92 9])))
;; (setq whitespace-display-mappings
;;        ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
;;       '(
;;         (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
;;         (newline-mark 10 [182 10]) ; 10 LINE FEED
;;         (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
;;         ))

;; RAINBOW PARENTHESES

;; (require 'rainbow-delimiters)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should coNtain only one such instance.
  ;; If there is more than one, they won't work right.
 )

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
;            '("marmalade" . "http://marmalade-repo.org/packages/"))
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

;; tab completion

(setq-default indent-tabs-mode nil)

(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding
point."
  (interactive "*P")
  (let (line)
    (setq line (thing-at-point 'line))
    (indent-according-to-mode)
    (when (and
           (or (bobp) (not (string-match "[ \t\n]" (char-to-string (char-before)))))
           (or (eobp) (not (= ?w (char-syntax (char-after)))))
           (equal (substring-no-properties line)
                  (substring-no-properties (thing-at-point 'line))))
      (dabbrev-expand arg))))

(defun my-tab-fix ()
  (local-set-key [tab] 'indent-or-expand))

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

;; auto modes

(defun my-auto-mode ()
  (my-tab-fix)
  (whitespace-mode)
  ;; (rainbow-delimiters-mode)
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

(add-hook 'prog-mode-hook 'linum-mode)
;; (set-face-foreground 'linum "black")
;; (set-face-background 'linum "yellow")

;; ITERM2 MOUSE SUPPORT
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

(setq ruby-insert-encoding-magic-comment nil)
