(require 'package)

;; fn key becomes hyper key
(setq ns-function-modifier 'hyper)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin:/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/usr/local/bin" "/Library/TeX/texbin/")))

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/lisp/")

;; brew install coreutils for mac.
;; coreutils contains posix compliant versions of core utilities, eg ls
;; dired needs compliant version of ls.
(when (executable-find "gls")
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program t)
  (setq insert-directory-program "gls")
)

(add-to-list 'package-archives
    '("melpa" . "https://melpa.org/packages/") t
)
(package-initialize)

(require 'use-package)

;; (use-package company
;;  :ensure t
;;  :diminish (company-mode)
;;  :config
;;  (setq company-idle-delay 1)
;;  (setq company-minimum-prefix-length 1)
  ;; (setq company-dabbrev-ignore-case t)
  ;; (setq company-dabbrev-code-ignore-case t)
  ;; (setq company-dabbrev-downcase nil)
  ;; (setq company-dabbrev-other-buffers 'all)
  ;; (setq company-dabbrev-code-other-buffers 'all)
  ;; (setq company-dabbrev-code-everywhere t)
  ;; (global-company-mode)

;;  (autoload 'helm-company "helm-company")
;;  (define-key company-mode-map (kbd "C-:") 'helm-company)
;;  (define-key company-active-map (kbd "C-:") 'helm-company)
;;)

;; (use-package pyenv-mode
;;  :ensure t
;;  :diminish (pyenv-mode)
;;  :config
  ;; (pyenv-mode-set "rblog")
  ;; (pyenv-mode)
;;)

;;(use-package anaconda-mode
  ;; supposedly we can make anaconda mode restart and do project specific stuff
  ;; but we are forcing it to rblog mode as I cant do the switching stuff as of
  ;; now
;;   :ensure t
;;  :config
  ;; (add-hook 'python-mode-hook 'anaconda-mode)
  ;; (add-hook 'python-mode-hook 'eldoc-mode)
;;)

(use-package helm
  :ensure t
  :diminish (helm-mode)
  :config
  (require 'helm)
  (require 'helm-config)
  (require 'helm-eshell)
  (require 'helm-descbinds)
  (helm-autoresize-mode t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  (helm-mode 1)
  (helm-descbinds-mode)
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
  (global-set-key (kbd "s-o") 'helm-occur)
  (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
  (global-set-key (kbd "s-SPC") 'helm-all-mark-rings)
  (global-set-key (kbd "s-b") 'helm-for-files)
  (global-set-key (kbd "s-x") 'helm-M-x)
  (global-set-key (kbd "s-i") 'helm-imenu)
  ; these is for entire file system
  (global-set-key (kbd "C-x l") 'helm-locate)
  (global-set-key (kbd "C-x C-l") 'helm-locate)
  (global-set-key (kbd "H-l") 'helm-locate)
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

(use-package deft
  :ensure t
  :init
  (setq deft-extensions '("txt" "tex" "org"))
  (setq deft-directory "~/Dropbox/org/")
  (setq deft-recursive t)
  (setq deft-use-filename-as-title t)
  :config
  (autoload 'deft "deft" "Deft Mode" t)
  (autoload 'deft-find-file "deft" "Open file using Deft Mode" t)
  (global-set-key (kbd "H-d") 'deft)
  (global-set-key (kbd "C-x C-g") 'deft-find-file)
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

(defun my/git-gutter-refresh ()
  (interactive)
  (mapc
    (lambda (buffer)
      (with-current-buffer buffer
        (git-gutter+-refresh)
      )
    )
    (buffer-list)
  )
  (message "done") ;; to ignore errors
)

(use-package git-gutter+
  :ensure nil
  :init
  (global-git-gutter+-mode)
  (global-set-key (kbd "C-c r") 'my/git-gutter-refresh)
  :diminish (git-gutter+-mode)
)

(use-package elfeed
  :ensure t
  :init
  (setq elfeed-feeds
    '(
      "http://nullprogram.com/feed/"
      "http://www.terminally-incoherent.com/blog/feed/"
      "http://xkcd.com/rss.xml"
      "http://sachachua.com/blog/category/visual-book-notes/feed/"
      "http://www.sciencedaily.com/rss/top/science.xml"
    )
  )
  (setf url-queue-timeout 30)
  :config
  (global-set-key (kbd "C-x w") 'elfeed)
)

(use-package markdown-mode
  :ensure t
  :defer t
  :commands 'markdown-mode
  :mode "\\.markdown\\'" "\\.md\\'"
  )

(defun shk-yas/helm-prompt (prompt choices &optional display-fn)
  "Use helm to select a snippet. Put this into `yas/prompt-functions.'"
  (interactive)
  (setq display-fn (or display-fn 'identity))
  (if (require 'helm-config)
      (let (tmpsource cands result rmap)
        (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
        (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
        (setq tmpsource
              (list
               (cons 'name prompt)
               (cons 'candidates cands)
               '(action . (("Expand" . (lambda (selection) selection))))
               ))
        (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
        (if (null result)
            (signal 'quit "user quit!")
          (cdr (assoc result rmap))))
    nil))

(use-package yasnippet
  :ensure t
  :defer t
  :diminish yas-minor-mode
  :commands (yas-global-mode yas-minor-mode)
  :config
  ; personal snippets go here
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  ; snippets that are part of yas snippet repo
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/ysnippets")
  ; remember to call (yas-reload-all) when modifying snippets
  (add-to-list 'yas-prompt-functions 'shk-yas/helm-prompt)
  ; (setq yas-verbosity 1)
  (require 'yasnippet)
  (global-set-key (kbd "H-i") 'yas-insert-snippet)
  (global-set-key (kbd "H-I") 'yas-describe-tables)
  (yas-global-mode 1)
)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (require 'color-theme-sanityinc-tomorrow)
  ;; (color-theme-sanityinc-tomorrow-day)
)

(use-package material-theme
  :ensure t
  :config (load-theme 'material t)
)

(use-package flymake
  :ensure t
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
)

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "s-l") 'avy-goto-line)
  (global-set-key (kbd "s-L") 'avy-goto-word-1)
)

(use-package elpy
  :ensure t
  :config
  (elpy-enable)
)

(set 'use-package-verbose t)

;; python-mode is added as a submodule

;; (setq py-install-directory "~/.emacs.d/python-mode")
;; (add-to-list 'load-path py-install-directory)
;; (require 'python-mode)

;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;;;;;;
;;;;;;; User Customizations
;;;;;;;

(require 'paren)
(show-paren-mode t)

(setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.9/libexec/ditaa0_9.jar")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates ditaa

;; htmlize
(autoload 'htmlize-buffer "htmlize" "HTMLize current buffer" t)
(autoload 'htmlize-file "htmlize" "HTMLize a file" t)
(autoload 'htmlize-region "htmlize" "HTMLize current region" t)

;; terminal notifier
(autoload 'tn-notify "terminal-notifier" "Alert on Desktop" t)
;; (tn-notify "Ahoy, message!" "Whoa there, title!" "Yo, subtitle!")

;; typing game
(autoload 'typing-of-emacs "typing" "The Typing Of Emacs, a game." t)

; highlight current line globabbly
(global-hl-line-mode)

;; auto save session every desktop-auto-save-timeout=30 seconds.
(desktop-save-mode -1)

; fix scrolling behaviour
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
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

(mapc
 (lambda (mode)
   (when (fboundp mode)
     (funcall mode -1)))
 '(menu-bar-mode tool-bar-mode scroll-bar-mode))

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

; sentences end in single space
(setq sentence-end-double-space nil)

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

;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

;; remove trailing whitepsace
(global-set-key (kbd "C-c W") 'delete-trailing-whitespace)

(require 'fill-column-indicator)
(add-hook 'after-change-major-mode-hook 'fci-mode)

; do not blick cursor
(blink-cursor-mode -1)

; show human readable sizes in dired
(setq-default dired-listing-switches "-alhv")



(setq-default fill-column 80)
(set-face-attribute 'default nil :height 120) ; font size
;; (set-face-attribute 'default nil :height 200) ; large font size

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

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "C-c b") 'switch-to-previous-buffer)

(global-set-key (kbd "M-j")
  (lambda ()
    (interactive)
    (join-line -1)
  )
)

;; http://whattheemacsd.com/setup-magit.el-01.html
;; START: full screen magit-status

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
;; END

(global-set-key (kbd "H-k") (lambda ()
                              (interactive)
                              (kill-buffer (window-buffer (next-window)))))


(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)

(require 'work-init)

; show how long it took to load emacs this must be the last few lines of this
; file if this goes out of hand http://www.emacswiki.org/emacs/ProfileDotEmacs
(fset 'startup-echo-area-message
    #'(lambda ()
          (message "emacs loaded in %s" (emacs-init-time))
    )
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#4d4d4c" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#ffffff"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-day)))
 '(custom-safe-themes
   (quote
    ("870a63a25a2756074e53e5ee28f3f890332ddc21f9e87d583c5387285e882099" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(fci-rule-color "#d6d6d6")
 '(hl-sexp-background-color "#1c1f26")
 '(safe-local-variable-values
   (quote
    ((eval setq byte-compile-not-obsolete-vars
           (quote
            (display-buffer-function))))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
