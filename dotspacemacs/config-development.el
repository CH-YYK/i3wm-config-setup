(defun user/config-cpp-keybinds ()
  ;; bind tab to company-clang in C++mode
  (add-hook 'c++-mode-hook
            (lambda () (define-key c++-mode-map [tab] 'company-clang))
            )
  ;; (eval-after-load 'c++-mode
  ;;   (define-key c++-mode-map (kbd "<tab>") 'company-clang))
  ;; (eval-after-load 'c++
  ;;   (define-key evil-insert-state-map (kbd "C-]") 'company-clang))
  )