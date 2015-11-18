(require 'package)
(add-to-list 'package-archives
    '("melpa-stable" . "https://stable.melpa.org/packages/") t
)
(package-initialize)

(require 'use-package)

(use-package projectile
    :ensure t
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
