; show how long it took to load emacs
; this must be the last few lines of this file
; if this goes out of hand http://www.emacswiki.org/emacs/ProfileDotEmacs
(fset 'startup-echo-area-message
    #'(lambda ()
          (message "emacs loaded in %s" (emacs-init-time))
    )
)
