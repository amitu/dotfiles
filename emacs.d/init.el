(require 'package)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'package-archives
    '("melpa-stable" . "https://stable.melpa.org/packages/") t
)
(package-initialize)

(require 'use-package)

(use-package helm
  :ensure t
  :diminish (helm-mode)
  :config
  (require 'helm)
  (require 'helm-config)
  (require 'helm-eshell)
  (helm-autoresize-mode t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-for-files)
  (global-set-key (kbd "C-x C-b") 'helm-for-files)
  (global-set-key (kbd "C-x f") 'helm-find-files)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x s") 'helm-do-grep)
  (global-set-key (kbd "s-g") 'helm-do-grep)
  (global-set-key (kbd "C-x S") 'helm-find)
  (global-set-key (kbd "C-x o") 'other-window)
  (global-set-key (kbd "C-x O") 'helm-occur)
  (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
  (global-set-key (kbd "s-SPC") 'helm-all-mark-rings)
  (global-set-key (kbd "s-b") 'helm-for-files)
  (global-set-key (kbd "s-x") 'helm-M-x)
  (global-set-key (kbd "s-i") 'helm-imenu)
  ; these is for entire file system
  (global-set-key (kbd "C-x l") 'helm-locate)
  (global-set-key (kbd "C-x C-l") 'helm-locate)
  ; rebind tab to run persistent action
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  ; make TAB works in terminal
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  ; list actions using C-z
  (define-key helm-map (kbd "C-z")  'helm-select-action)

  (add-hook 'eshell-mode-hook
    #'(lambda ()
      (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)
    )
  )
)

(require 'helm-descbinds)
(helm-descbinds-mode)

(use-package projectile
  ; docs: http://batsov.com/projectile/
  :ensure t

  :init

  (setq projectile-indexing-method 'alien)
  (setq projectile-completion-system 'helm)
  (setq projectile-enable-caching t)

  :config

  (projectile-global-mode)
  ; C-u S-f (flush cache, and find file)
  (define-key projectile-mode-map [?\s-f] 'projectile-find-file)
  (define-key projectile-mode-map (kbd "C-c f") 'projectile-find-file)
  (define-key projectile-mode-map [?\s-g] 'projectile-grep)
  (global-set-key (kbd "s-p") 'projectile-switch-project)
  (global-set-key (kbd "C-c p p") 'projectile-switch-project)
)

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq projectile-switch-project-action 'projectile-dired)
)

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-c s"  ) 'magit-status)
  (global-set-key (kbd "C-c d"  ) 'magit-diff-unstaged)
  (global-set-key (kbd "C-c D"  ) 'magit-diff-staged)
  (global-set-key (kbd "C-c C-d") 'magit-diff)
  (global-set-key (kbd "s-m") 'magit-status)
  (global-set-key (kbd "s-d") 'magit-diff-unstaged)
  (global-set-key (kbd "s-D") 'magit-diff-staged)
  (global-set-key (kbd "s-e") 'magit-diff)
)

(use-package saveplace
  :ensure t
  :init
  (setq-default save-place t)
  (setq save-place-forget-unreadable-files nil)
)

(use-package guide-key
  :ensure t
  :diminish guide-key-mode
  :config
  (setq guide-key/guide-key-sequence t)
  (guide-key-mode 1)
)

(defun my-git-gutter-refresh ()
  (interactive)
  (git-gutter+-refresh)
)

(use-package git-gutter+
  :ensure nil
  :init
  (global-git-gutter+-mode)
  (global-set-key (kbd "C-c r") 'my-git-gutter-refresh)
  :config
  :diminish (git-gutter+-mode)
)

(use-package misc
  :demand t
  :bind ("M-z" . zap-up-to-char)
)

(set 'use-package-verbose t)

;;;;;;;
;;;;;;; User Customizations
;;;;;;;

; highlight current line globabbly
(global-hl-line-mode)

; fix scrolling behaviour
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; no acceleration
(setq mouse-wheel-follow-mouse 't) ;; scroll the right window

; Ctrl-up/down will scroll but will keep focus in same line
(defun gcm-scroll-down ()
  (interactive)
  (scroll-up (/ (window-text-height) 3))
)

(defun gcm-scroll-up ()
  (interactive)
  (scroll-down (/ (window-text-height) 3))
)

(global-set-key [(control down)] 'gcm-scroll-down)
(global-set-key [(control up)]   'gcm-scroll-up)

; meta up/down will scroll by one window
(defun sfp-page-down ()
  (interactive)
  (next-line (- (/ (window-text-height) 2) next-screen-context-lines))
)
(defun sfp-page-up ()
  (interactive)
  (previous-line (- (/ (window-text-height) 2) next-screen-context-lines))
)

(global-set-key [(meta down)] 'sfp-page-down)
(global-set-key [(meta up)] 'sfp-page-up)

; Super-<left>/<right> should switch window
(defun go-to-next-window ()
  (interactive)
  (other-window 1)
)
(defun go-to-prev-window ()
  (interactive)
  (other-window -1)
)

; switch window using Super-<left>/<right> keys
(global-set-key (kbd "s-<right>") 'go-to-next-window)
(global-set-key (kbd "s-<left>") 'go-to-prev-window)

; no toolbar
(tool-bar-mode -1)

; no scrollbar
(scroll-bar-mode -1)

; if something is highlighted and you start typing, it overwrites
; highlighted text
(delete-selection-mode t)

; Make y and yes both work
(fset 'yes-or-no-p 'y-or-n-p)

; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

; Spaces instead tabs
(setq default-tab-width 4)

; Disable file backup
(setq make-backup-files nil)

; require final newline
(setq require-final-newline t)

; highlight closing parenthesis
(show-paren-mode 1)

; Ctrl-w replace <-backspace backward="backward" delete="delete" for="for"
; p="p">; C-w normally deletes whole region now reset to C-x C-k
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(require 'multi-term)
(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c C-t") 'multi-term)
(global-set-key (kbd "S-s-<right>") 'multi-term-next)
(global-set-key (kbd "S-s-<left>") 'multi-term-next)

; line mode is for normal editing command
(global-set-key (kbd "C-c C-j") 'term-line-mode)
; this is needed for pasting
(global-set-key (kbd "C-c C-k") 'term-char-mode)

;; Show keystrokes in minibuffer early
(setq echo-keystrokes 0.1)

; whitespace mode
(global-set-key (kbd "C-c w") 'whitespace-mode)

; do not blick cursor
(blink-cursor-mode -1)

(setq-default fill-column 78)
(set-face-attribute 'default nil :height 120)

(defun open-line-below ()
"Open a line below the line the point is at.

Then move to that line and indent accordning to mode"
  (interactive)
  (move-end-of-line 1)
  (newline)
  (indent-according-to-mode)
)

(defun open-line-above ()
"Open a line above the line the point is at.

Then move to that line and indent accordning to mode"
  (interactive)
  (move-beginning-of-line 1)
  (newline)
  (forward-line -1)
  (indent-according-to-mode)
)

(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-O") 'open-line-above)

(defun back-to-indentation-or-beginning-of-line ()
  "Moves point back to indentation if there is any non blank
characters to the left of the cursor.  Otherwise point moves to
beginning of line."
  (interactive)
  (if (= (point) (save-excursion (back-to-indentation) (point)))
    (beginning-of-line)
    (back-to-indentation)
  )
)
(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning-of-line)

(defun goto-last-change ()
  (interactive)
  (let ( (mypos (car (cadr buffer-undo-list))) )
     (if mypos (goto-char mypos))
  )
)
(global-set-key (kbd "s-L") 'goto-last-change)

;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

;; Prefer utf8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(defun end-of-line+ (&optional n)
  "Move cursor to end of current line or end of next line if repeated.
This is similar to `end-of-line', but:
  If called interactively with no prefix arg:
     If the previous command was also `end-of-line+', then move to the
     end of the next line.  Else, move to the end of the current line.
  Otherwise, move to the end of the Nth next line (Nth previous line
     if N<0).  Command `end-of-line', by contrast, moves to the end of
     the (N-1)th next line."
  (interactive
   (list (if current-prefix-arg (prefix-numeric-value current-prefix-arg) 0)))
  (unless n (setq n 0))                 ; non-interactive with no arg
  (if (and (eq this-command last-command) (not current-prefix-arg))
      (forward-line 1)
    (forward-line n))
  (let ((inhibit-field-text-motion  t))  (end-of-line)))

(global-set-key (kbd "C-e") 'end-of-line+)

; show how long it took to load emacs this must be the last few lines of this
; file if this goes out of hand http://www.emacswiki.org/emacs/ProfileDotEmacs
(fset 'startup-echo-area-message
    #'(lambda ()
          (message "emacs loaded in %s" (emacs-init-time))
    )
)
