(defun user/config-generals ()
  (user/config-font-sizes)
  (user/config-general-basics)
  )

(defun user/config-general-basics ()
  (setq max-specpdl-size 130000)
  (setq max-lisp-eval-depth 130000)

  ;; Coding indentation settings
  (setq indent-tabs-mode t
        tab-width 4
        c-basic-offset 2)

  ;; treemacs
  (treemacs-resize-icons 15)
  )

(defun user/config-font-sizes ()
  ;; treemacs font size
  (add-hook 'treemacs-mode-hook
            (lambda () (text-scale-decrease 1)))
  )
