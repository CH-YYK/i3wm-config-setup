(defun user/config-org-mode()
  ;; call for all
  (user/config-org-font-size)
  (user/config-org-basics)
  (user/config-org-agenda)
  (user/config-org-captures-templates)
  )

(defun user/config-org-font-size ()
  ;; header faces
  (let* ((variable-tuple
          (cond ((x-list-fonts "Monospaced")         '(:font "Monospaced"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                ((x-list-fonts "Verdana")         '(:font "Verdana"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color))
         )

    (custom-set-faces
     `(org-level-8 ((t (,@headline ,@variable-tuple ))))
     `(org-level-7 ((t (,@headline ,@variable-tuple ))))
     `(org-level-6 ((t (,@headline ,@variable-tuple ))))
     `(org-level-5 ((t (,@headline ,@variable-tuple ))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.0))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.15))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.3
                                   ))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

  (custom-set-faces
   '(variable-pitch ((t (:family "Monospace" :height 110 :weight thin))))
   '(fixed-pitch ((t ( :family "Monospace" :height 100)))))

  (add-hook 'org-mode-hook 'variable-pitch-mode)
  (add-hook 'org-mode-hook 'visual-line-mode)

  (custom-set-faces
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
  )

(defun user/config-org-basics()
  (message "config-org: basics")
  (setq org-todo-keyword-faces
				'(
					("TODO" . "#dc752f")
					("NEXT" . "#dc752f")
					("PROGRESS" . "#4f97d7")
					("CANCEL" . "#f2241f")
					("FIX" . "#dc752f")
					)
				)

  (setq org-directory "~/self_project/org-agenda-files/")
	(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org") "something"

  ;; pomodoro
  (setq org-pomodoro-length 30
        org-pomodoro-short-break-length 10)
  )

(defun user/config-org-captures-templates ()
  (message "config-org: captures-templates")
  (setq org-capture-templates  ;; set org-mode capture templates
				'(
					;; '%a' represent a link
					;; capture file and headline, save to gtd.org, under header Tasks
					("t" "Todo tasks")
					("tg" "General and simple tasks" entry (file+headline "~/self_project/org-agenda-files/gtd.org" "Tasks")
					 "* TODO %?     :SELF:\n  %i\n"
					 :empty-lines 1)
					("ta" "Emergencies that must be done right now" entry (file+headline "~/self_project/org-agenda-files/gtd.org" "Emergencies")
					 "* TODO \[#A\] %?     :SELF:\n"
					 :clock-in t
					 :empty-lines 1)

					;; capture ideas/nodes/memo
          ("d" "Quick notes or ideas to implement")
          ("dn" "Notes taken along with reading" entry (file+datetree "~/self_project/org-agenda-files/ideas.org" "Notes")
           "* %? :SELF:NOTES:\nEntered on %U\n %l \n %i"
           :tree-type month
           :empty-lines 1)

					("di" "ideas and potential todo list" entry (file+datetree "~/self_project/org-agenda-files/ideas.org" "Ideas")
					 "* %? :SELF:Ideas: \nCreated on %U\n %i\n "
					 :tree-type month
					 :kill-buffer t
					 :empty-lines 1)

          ("dm" "Memorandum" entry (file+datetree "~/self_project/org-agenda-files/memo.org" "Memoization")
           "* %? :SELF:MEMO:  \nEntered on %U\n %i\n"
           :tree-type month
           :empty-lines 1)

          ("dl" "LeetCode notes" entry (file+headline "~/self_project/org-agenda-files/journal.org" "LeetCode Challenges")
           "* [LeetCode Contest] %? :SELF:LeetCode: \n Created on %U \n %l"
           :empty-lines 1)

          ("b" "Blogs" entry (file+datetree "~/self_project/org-agenda-files/blogs.org" "Blogs"))
					))
  )

(defun user/config-org-agenda ()
  (message "config-org: agenda")
  (setq org-agenda-files
        (quote
         ("~/self_project/org-agenda-files/work.org"    ;; On-duty scheduled tasks to work on with Tag :DMAI:
          "~/self_project/org-agenda-files/random.org"  ;; Personal scheduled tasks with Tag :self:
					"~/self_project/org-agenda-files/ideas.org"   ;; Temporary ideas
          "~/self_project/org-agenda-files/gtd.org"     ;; Temporary TODO tasks 
          "~/self_project/org-agenda-files/journal.org" ;; To-be-reviewed materials
          )))
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
  (setq org-todo-keywords '((sequence "TODO" "PROG" "|" "DONE" "|" "FAIL")))
	(setq org-hide-emphasis-markers t)  ;; hide *...*
  (font-lock-add-keywords 'org-mode
                          '(("^*\\([-]\\)"
                             (0 (prog1()(compose-region (match-beginning 1)(match-end 1) "~"))))))
  (setq org-agenda-custom-commands  	;; Customized commands for agenda.
        '(
          ("w" . "Tasks")
          ("wa" "Emergency and Important" tags-todo "+PRIORITY=\"A\"")
					("wb" "Non-Emergency but Important" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
					("wc" "Non-Emergency and Non-important" tags-todo "+PRIORITY=\"C\"")

					("p" . "Projects")
					("pw" tags-todo "PROJECT+WORK+CATEGORY=\"DMAI\"")
					("pl" tags-todo "PROJECT+CATEGORY=\"SELF\"")
          ))
  )
