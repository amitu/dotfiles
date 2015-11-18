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

(set 'use-package-verbose t)

; show how long it took to load emacs
; this must be the last few lines of this file
; if this goes out of hand http://www.emacswiki.org/emacs/ProfileDotEmacs
(fset 'startup-echo-area-message
    #'(lambda ()
          (message "emacs loaded in %s" (emacs-init-time))
    )
)
