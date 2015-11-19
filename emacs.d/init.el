(require 'package)
(add-to-list 'package-archives
    '("melpa-stable" . "https://stable.melpa.org/packages/") t
)
(package-initialize)

(require 'use-package)

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
  ; keybindings:
  ; - TODO: kill list of projects

  ; https://github.com/nex3/perspective-el
)

(global-set-key [?\s-p] 'projectile-switch-project)

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
)

(use-package magit
  :ensure t
)
(global-set-key (kbd "C-c s") 'magit-status)

(set 'use-package-verbose t)

;;;;;;;
;;;;;;; User Customizations
;;;;;;;

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
