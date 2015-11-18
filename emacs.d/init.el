(fset 'startup-echo-area-message
        #'(lambda ()
                  (message "emacs loaded in %s" (emacs-init-time))))
