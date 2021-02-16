(defun user/config-general-basics ()

  ;; Coding indentation settings
  (setq indent-tabs-mode t
        tab-width 2
        c-basic-offset 2)

  (setq python-indent-offset 2
        python-tab-width 2)

  ;; treemacs
  (treemacs-resize-icons 15)
  )

(defun layers()
  '(csv
     html
     imenu-list
     javascript
     yaml
     json
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; better-defaults
     (python :variables python-backend 'anaconda)
     java
     (c-c++ :variables
            c-c++-enable-clang-support t
            ;; c-c++-default-mode-for-headers 'c++-mode
            )
     auto-completion
     ;; syntax-checking
     version-control
     emacs-lisp
     git
     helm
     ;; lsp
     markdown
     multiple-cursors
     (org :variables
          org-enable-github-support t
          org-enable-bootstrap-support t)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; version-control
     (treemacs :variables
               treemacs-width 35)))
