(require 'package)
(add-to-list 'package-archives
    '("melpa-stable" . "https://stable.melpa.org/packages/") t
)
(package-initialize)

(require 'use-package)

(use-package helm
  :ensure t
  :config
  (require 'helm)
  (require 'helm-config)
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
  (global-set-key (kbd "C-x S") 'helm-find)
  (global-set-key (kbd "C-x o") 'other-window)
  (global-set-key (kbd "C-x O") 'helm-occur)
  ; these is for entire file system
  (global-set-key (kbd "C-x l") 'helm-locate)
  (global-set-key (kbd "C-x C-l") 'helm-locate)
  ; rebind tab to run persistent action
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  ; make TAB works in terminal
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  ; list actions using C-z
  (define-key helm-map (kbd "C-z")  'helm-select-action)
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
  ; keybindings:
  ; - TODO: kill list of projects

  ; https://github.com/nex3/perspective-el
)

(global-set-key [?\s-p] 'projectile-switch-project)
(global-set-key (kbd "C-c p p") 'projectile-switch-project)

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
)

(use-package magit
  :ensure t
)
(global-set-key (kbd "C-c s"  ) 'magit-status)
(global-set-key (kbd "C-c d"  ) 'magit-diff-unstaged)
(global-set-key (kbd "C-c D"  ) 'magit-diff-staged)
(global-set-key (kbd "C-c C-d") 'magit-diff)

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

; no toolbar
(tool-bar-mode -1)

; show how long it took to load emacs
; this must be the last few lines of this file
; if this goes out of hand http://www.emacswiki.org/emacs/ProfileDotEmacs
(fset 'startup-echo-area-message
    #'(lambda ()
          (message "emacs loaded in %s" (emacs-init-time))
    )
)
