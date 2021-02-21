(defun user/config-generals ()
  (user/config-font-sizes)
  (user/config-general-basics)
  )

(defun user/config-general-basics ()
  (setq max-specpdl-size 13000)
  (setq max-lisp-eval-depth 13000)

  ;; Coding indentation settings
  (setq indent-tabs-mode t
        tab-width 2
        c-basic-offset 2)

  (setq python-indent-offset 2
        python-tab-width 2)

  ;; treemacs
  (treemacs-resize-icons 15)
  )

(defun user/config-font-sizes ()
  ;; treemacs font size
  (add-hook 'treemacs-mode-hook
            (lambda () (text-scale-decrease 1)))
  )
