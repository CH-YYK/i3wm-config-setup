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

  (custom-set-faces   ;; set header face in org-mode
	 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
	 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
	 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
	 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
	 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
	 '(org-property-value ((t (:inherit fixed-pitch :height 0.8))))
	 )

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
           "* %? :SELF:NOTES:\nEntered on %U\n %l"
           :tree-type month
           :empty-lines 1
           )

					("di" "ideas or memorandum" entry (file+datetree "~/self_project/org-agenda-files/ideas.org" "Ideas")
					 "* %? :SELF:MEMO:\nCreated on %U\n %i\n "
					 :tree-type month
					 :kill-buffer t
					 :empty-lines 1)

          ("dl" "LeetCode notes" entry (file+headline "~/self_project/org-agenda-files/ideas.org" "LeetCode Challenges")
           "* %? :SELF:LeetCode: \n Created on %U \n %l"
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
