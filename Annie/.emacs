(add-to-list 'load-path "~/.emacs.d/")

;; ELPA
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


(setq default-cursor-type 'bar)

(require 'haml-mode)
(add-hook 'haml-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (define-key haml-mode-map "\C-m" 'newline-and-indent)))

(require 'coffee-mode)
(require 'markdown-mode)
(require 'php-mode)
(require 'yaml-mode)


(add-hook 'after-init-hook #'global-flycheck-mode)

;; RAINBOW PARENTHESES

(tool-bar-mode -1)
(menu-bar-mode -1)
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(global-whitespace-mode t)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(whitespace-line (quote whitespace-line))
 '(whitespace-line-column 1000))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#36401a" :foreground "#fff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Monofonto"))))
 '(scroll-bar ((t (:foreground "#262353"))))
 '(fringe ((t (:background "#04250a"))))
 '(minibuffer-prompt ((t (:foreground "orchid1" ))))
 '(mode-line ((t (:background "#38156a" :foreground "#99c0c0" ))))
 '(mode-line-highlight ((t (:foreground "#d5c562" ))))
 '(mode-line-buffer-id ((t (:inverse-video t))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#04250a" :foreground "#ddffaa" :box nil :weight light))))
 ;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
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
 '(whitespace-empty ((t nil)))
 '(whitespace-hspace ((t (:foreground "#616181"))))
 '(whitespace-indentation ((t (:foreground "#616181"))))
 '(whitespace-line ((t nil)))
 '(whitespace-newline ((t (:foreground "#616181"))))
 '(whitespace-space ((t (:foreground "#616181"))))
 '(whitespace-space-after-tab ((t nil)))
 '(whitespace-space-before-tab ((t nil)))
 '(whitespace-tab ((t (:foreground "#616181"))))
 '(whitespace-trailing ((t (:background "#501a2a" :foreground "salmon")))))

(setq default-tab-width 4) ;; 8 is way too many

; ISWITCHB
(setq iswitchb-mode nil)

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
(require 'org-latex)
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

; Auto modes

(defun my-auto-mode ()
  (whitespace-mode)
  (column-number-mode)
  (rainbow-delimiters-mode)
  (my-tab-fix)
  (when (stringp buffer-file-name)
    (cond
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
         (string-match "\\.handlebars\\'" buffer-file-name))
     (html-mode))
    ((string-match "\\.coffee\\'" buffer-file-name)
     (my-coffee-tab-fix))
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
                    [164] [95])
        ('space-mark 2208
                     [2212] [95])
        (space-mark 2336
                    [2340] [95])
        (space-mark 3616
                    [3620] [95])
        (space-mark 3872
                    [3876] [95])
        (newline-mark 10
                      [182 10])
        (tab-mark 9
                  [187 9] [92 9])))

;; CSS

(setq css-indent-offset 2)

;; long lines:

(setq bidi-display-reordering nil)

;; misc

(setq inhibit-startup-message t)
