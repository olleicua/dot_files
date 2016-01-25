(add-to-list 'load-path "~/.emacs.d/load")

(setq default-cursor-type 'bar)

(require 'haml-mode)
(add-hook 'haml-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (define-key haml-mode-map "\C-m" 'newline-and-indent)))

(scroll-bar-mode -1)
(tool-bar-mode -1)

(require 'coffee-mode)
(require 'json-mode)
(require 'markdown-mode)
(require 'rainbow-delimiters)
(require 'yaml-mode)
;(require 'php-mode)
;(require 'yaml-mode)

;; PHP

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; RAINBOW PARENTHESES


(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(global-whitespace-mode t)
 '(whitespace-line (quote whitespace-line) t)
 '(whitespace-line-column 100000))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#46201a" :foreground "#fff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :spacing "monospace" :foundry "unknown" :family "PT Mono"))))
 '(fringe ((t (:background "#25040a"))))
 '(minibuffer-prompt ((t (:foreground "orchid1"))))
 '(mode-line ((t (:background "#386a15" :foreground "#ffaa88"))))
 '(mode-line-buffer-id ((t (:inverse-video t))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((t (:foreground "#d5c562"))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#25040a" :foreground "#ddffaa" :box nil :weight light))))
 '(rainbow-delimiters-depth-1-face ((((background dark)) (:foreground "#a099a0" :weight bold))))
 '(rainbow-delimiters-depth-2-face ((((background dark)) (:foreground "#74c371" :weight bold))))
 '(rainbow-delimiters-depth-3-face ((((background dark)) (:foreground "#3a61d6" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((((background dark)) (:foreground "#bf22bf" :weight bold))))
 '(rainbow-delimiters-depth-5-face ((((background dark)) (:foreground "#c86727" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((((background dark)) (:foreground "#908a69" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((((background dark)) (:foreground "#cfd580" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((((background dark)) (:foreground "#0fd580" :weight bold))))
 '(rainbow-delimiters-depth-9-face ((((background dark)) (:foreground "#902ab9" :weight bold))))
 '(rainbow-delimiters-unmatched-face ((((background dark)) (:background "#caa" :foreground "#dd090B" :weight bold))))
 '(scroll-bar ((t (:foreground "#262353"))))
 '(whitespace-empty ((t nil)))
 '(whitespace-hspace ((t (:foreground "#66604a" :spacing "monospace"))))
 '(whitespace-indentation ((t (:foreground "#66604a" :spacing "monospace"))))
 '(whitespace-line ((t (:inherit default :slant italic))))
 '(whitespace-newline ((t (:foreground "#66604a" :spacing "monospace" :height 85))))
 '(whitespace-space ((t (:foreground "#66604a" :spacing "monospace"))))
 '(whitespace-space-after-tab ((t nil)))
 '(whitespace-space-before-tab ((t nil)))
 '(whitespace-tab ((t (:foreground "#66604a" :spacing "monospace"))))
 '(whitespace-trailing ((t (:foreground "#40662a" :background "#f38" :spacing "monospace")))))

;; '(whitespace-empty ((t nil)))
 ;; '(whitespace-hspace ((t (:foreground "#616181"))))
 ;; '(whitespace-indentation ((t (:foreground "#616181"))))
 ;; '(whitespace-line ((t nil)))
 ;; '(whitespace-newline ((t (:foreground "#616181"))))
 ;; '(whitespace-space ((t (:foreground "#616181"))))
 ;; '(whitespace-space-after-tab ((t nil)))
 ;; '(whitespace-space-before-tab ((t nil)))
 ;; '(whitespace-tab ((t (:foreground "#616181"))))
 ;; '(whitespace-trailing ((t (:background "#501a2a" :foreground "salmon")))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Ubuntu Mono"))))
;;  '(completions-first-difference ((t (:inherit bold :slant italic))))
;;  '(rainbow-delimiters-depth-1-face ((((background light)) (:foreground "#403940" :weight bold))))
;;  '(rainbow-delimiters-depth-2-face ((((background light)) (:foreground "#3d6326" :weight bold))))
;;  '(rainbow-delimiters-depth-3-face ((((background light)) (:foreground "#0a31a6" :weight bold))))
;;  '(rainbow-delimiters-depth-4-face ((((background light)) (:foreground "#bf22bf" :weight bold))))
;;  '(rainbow-delimiters-depth-5-face ((((background light)) (:foreground "#a84707" :weight bold))))
;;  '(rainbow-delimiters-depth-6-face ((((background light)) (:foreground "#827d79" :weight bold))))
;;  '(rainbow-delimiters-depth-7-face ((((background light)) (:foreground "#63a84a" :weight bold))))
;;  '(rainbow-delimiters-depth-8-face ((((background light)) (:foreground "#3284ba" :weight bold))))
;;  '(rainbow-delimiters-depth-9-face ((((background light)) (:foreground "#701a91" :weight bold))))
;;  '(rainbow-delimiters-unmatched-face ((((background light)) (:background "#cccccc" :foreground "#dd090B" :weight bold))))
;;  '(whitespace-empty ((t nil)))
;;  '(whitespace-hspace ((t (:foreground "lightgray"))))
;;  '(whitespace-indentation ((t (:foreground "light gray"))))
;;  '(whitespace-line ((t (:inherit default :slant italic))))
;;  '(whitespace-space ((t (:foreground "lightgray"))))
;;  '(whitespace-space-after-tab ((t nil)))
;;  '(whitespace-space-before-tab ((t nil)))
;;  '(whitespace-tab ((t (:foreground "lightgray"))))
;;  '(whitespace-trailing ((t (:foreground "deep pink")))))

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
;(global-set-key "\C-cl" 'org-store-link)
;(global-set-key "\C-cc" 'org-capture)
;(global-set-key "\C-ca" 'org-agenda)
;(global-set-key "\C-cb" 'org-iswitchb)
;(setq org-todo-keywords
;     '((sequence "TODO" "STARTED" "|" "WAITING" "CANCELLED" "MISSED" "DONE")))
;(setq org-agenda-include-diary t)
;; mobileOrg setup
;(setq org-directory "~/Dropbox/org")
;(setq org-mobile-directory "~/Dropbox/MobileOrg")
;(setq org-agenda-files '("~/Dropbox/org/schedule.org"))
;(setq org-mobile-index-for-pull "~/Dropbox/org/shcedule.org")
;(global-set-key (kbd "C-c p") 'org-mobile-pull)
;(global-set-key (kbd "C-c h") 'org-mobile-push)
;; CALENDAR FUNCTIONS
;(defun calendar-nearest-to (target-dayname target-day target-month)
;  "Recurring event that occurs in the nearest TARGET-DAYNAME to
;the date TARGET-DAY, TARGET-MONTH each year."
;  (interactive)
;  (let* ((dayname (calendar-day-of-week date))
;         (target-date (list target-month target-day (calendar-extract-year date)))
;         (days-diff (abs (- (calendar-day-number date)
;                            (calendar-day-number target-date)))))
;    (and (= dayname target-dayname)
;         (< days-diff 4))))
;(defun diary-limited-cyclic (recurrences interval y m d)
;  "For use in emacs diary. Cyclic item with limited number of recurrences.
;Occurs every INTERVAL days, starting on YYYY-MM-DD, for a total of
;RECURRENCES occasions."
;  (let ((startdate (calendar-absolute-from-gregorian (list m d y)))
;        (today (calendar-absolute-from-gregorian date)))
;    (and (not (minusp (- today startdate)))
;         (zerop (% (- today startdate) interval))
;         (< (floor (- today startdate) interval) recurrences))))

; ISWITCHB
(setq iswitchb-mode t)

; HIPPIE EXPAND
(define-key read-expression-map [(tab)] 'hippie-expand)

; META KEY
(setq mac-command-key-is-meta t)

; NEWLINES
(global-linum-mode 3)

(add-hook 'ruby-mode-hook
      '(lambda ()
         (setq require-final-newline nil)
         (setq mode-require-final-newline nil)
         (setq show-newlines-mode t)))

; TABS
;(add-hook 'before-save-hook 'untabify)

(setq-default indent-tabs-mode nil)
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

; or
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
;(require 'org-latex)
;(setq org-export-latex-listings 'minted)
;(setq org-latex-to-pdf-process '("pdflatex --shell-escape -interaction nonstopmode %s"
;                                "pdflatex --shell-escape -interaction nonstopmode %s"))
;(setq org-export-latex-listings 't)
;(add-to-list 'org-export-latex-packages-alist '("" "minted"))

;; tab completion

;(defun indent-or-expand (arg)
;  "Either indent according to mode, or expand the word preceding
;point."
;  (interactive "*P")
;  (if (and
;       (or (bobp) (= ?w (char-syntax (char-before))))
;       (or (eobp) (not (= ?w (char-syntax (char-after))))))
;      (dabbrev-expand arg)
;    (indent-according-to-mode)))

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

; reduce-horizontal-space on M-]

(global-set-key (kbd "M-\]")
                (lambda () (interactive)
                  (delete-horizontal-space)
                  (insert " ")))

; Auto modes

(defun my-auto-mode ()
  (whitespace-mode)
  (column-number-mode)
  (rainbow-delimiters-mode)
  (my-tab-fix)
  (when (stringp buffer-file-name)
    (cond
     ((string-match "\\.coffee.erb\\'" buffer-file-name)
      (coffee-mode))
     ((or (string-match "\\.pryrc\\'" buffer-file-name)
          (string-match "\\.rake\\'" buffer-file-name)
          (string-match "\\.gemspec\\'" buffer-file-name)
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
    ((or (string-match "\\.hbs\\'" buffer-file-name)
         (string-match "\\.handlebars\\'" buffer-file-name)
         (string-match "\\.html.erb\\'" buffer-file-name))
     (html-mode))
    ((string-match "\\.json\\'" buffer-file-name)
     (javascript-mode)))))

(add-hook 'find-file-hook 'my-auto-mode)
(add-hook 'css-mode-hook 'my-tab-fix)`

;; Whitespace

(setq whitespace-line-column 10000)
(setq whitespace-display-mappings
      '((space-mark 32
                    [183] [46])
        (space-mark 160
                    [183] [95])
        (space-mark 2208
                    [183] [95])
        (space-mark 2336
                    [183] [95])
        (space-mark 3616
                    [183] [95])
        (space-mark 3872
                    [183] [95])
        (newline-mark 10
                      [9166 10])
        (tab-mark 9
                  [187 9] [92 9])))

;; CSS

(setq css-indent-offset 2)

;; long lines:

(setq bidi-display-reordering nil)


;; tab completion

;(defun indent-or-expand (arg)
;  "Either indent according to mode, or expand the word preceding
;point."
;  (interactive "*P")
;  (if (and
;       (or (bobp) (= ?w (char-syntax (char-before))))
;       (or (eobp) (not (= ?w (char-syntax (char-after))))))
;      (dabbrev-expand arg)
;    (indent-according-to-mode)))

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

(defun coffee-indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding
point."
  (interactive "*P")
  (if (string-match "^ *$" (buffer-substring-no-properties (point-at-bol) (point)))
      (indent-according-to-mode)
    (dabbrev-expand arg)))

(defun my-tab-fix ()
  (local-set-key [tab] 'indent-or-expand))

(defun my-coffee-tab-fix ()
  (local-set-key [tab] 'coffee-indent-or-expand))

(global-set-key [C-tab] 'dabbrev-expand)

; reduce-horizontal-space on M-]

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
