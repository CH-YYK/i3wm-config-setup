(defun user/config-development ()
  (setq-default company-mode t)
  (user/config-cpp-env)
  (user/config-python-env)
  )


(defun user/config-cpp-env ()
  ;; bind tab to company-clang in C++mode
  (require 'company-capf)
  (add-hook 'c++-mode-hook
            (lambda () (define-key c++-mode-map (kbd "C-<tab>") 'company-clang)))
  (add-hook 'c++-mode-hook
            (lambda () (setq flycheck-gcc-language-standard "c++11")))

  ;; (eval-after-load 'c++-mode
  ;;   (define-key c++-mode-map (kbd "<tab>") 'company-clang))
  ;; (eval-after-load 'c++
  ;;   (define-key evil-insert-state-map (kbd "C-]") 'company-clang))
  )

(defun user/config-python-env()
  ;; keybindings
  (add-hook 'python-mode-hook
            (lambda () (define-key python-mode-map (kbd "C-<tab>") 'company-anaconda)))

  ;; flycheck
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  )
