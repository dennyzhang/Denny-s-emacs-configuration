;; -*- mode: EMACS-LISP; coding:utf-8; -*-
;;; ================================================================
;; Copyright © 2010-2011 Time-stamp: <2013-01-13 02:45:20>
;;; ================================================================

;;; File: emacs-aggregation-setup.el --- Setup for emacs-aggregation.el
;;;
;;; Author: Denny Zhang <markfilebat@126.com>
;;

;;(load-file (concat EMACS_VENDOR "/emacs-aggregation/emacs-aggregation.el"))
(load-file (concat DENNY_CONF "/emacs_conf/emacs-aggregation/emacs-aggregation.el"))
(setq report-subject (format "Emacs Daily Journal from %s" system-name))
;; (setq recipient-mail "markfilebat@126.com filebat.mark@gmail.com sophiazhang8709@126.com")
(setq recipient-mail "markfilebat@126.com filebat.mark@gmail.com")
(setq start-time "11:50am")
(setq repeat-interval 86400)
(setq aggregate-retrieve-data-fun-list nil)

(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-remind)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-web)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-recite-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-habit-list)

(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-todo-list)

(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-tailing-message)
(defun retrieve-todo-list ()
  (cons " [TODO] DENNY TODO-List " (retrieve-org-todo-list)))

(defun retrieve-org-habit-list ()
  (cons " Habits to be formed " (retrieve-org-tags "Habit" t)))

(defun retrieve-org-recite-list ()
  (cons " Recite List " (retrieve-org-tags "Recite" t)))

(defun retrieve-remind ()
  (let (content)
    (setq content (format "%s\n%s"
                          (retrieve-org-tags "Remind" t)
                          (retrieve-diary-remind 4)
                          ))
    (cons " Remind List " content)
    )
  )

(defun retrieve-web()
  (let (content)
    (setq content (format "上海天气:%s

长沙天气:%s

江西铜业:%s"
                          (retrieve-html-content "http://www.baidu.com/s?wd=上海+天气" "中国天气网" "中国气象局")
                          (retrieve-html-content "http://www.baidu.com/s?wd=长沙+天气" "中国天气网" "中国气象局")
                          ;;(retrieve-html-content "http://stock.stcn.com/sh/600435/" "北方导航600435" "净流量")
                          (retrieve-html-content "http://stock.stcn.com/sh/600362/" "江西铜业600362" "净流量")
                          ))
    (cons " Internet information" content))
  )

(defun retrieve-tailing-message()
  (cons "=============" (retrieve-signature)))

;;(aggregation-timer)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat DENNY_CONF "/emacs_conf/emacs-aggregation/mobilize-orgfile.el"))
(setq org-export-html-style "")
(setq mobile-export-src-dir "/home/denny/backup/essential/Dropbox/private_data/emacs_stuff/org_data")
(setq mobile-export-publish-dir "/home/denny/backup/essential/Dropbox/private_data/temp/mobile_export/")
(setq mobile-export-file-list '("contacts.org"
                                ;;"project.org"
                                "career.org"
                                "wish.org"
                                "work.org"
                                "current.org"
                                "algorithm.org"
                                "org_share/music.org"
                                "english.org"
                                "wealth.org"
                                "learn.org"
                                "top.org"
                                "often.org"
                                "org_share/diary.org"
                                "org_share/myself.org"
                                "org_share/connection.org"
                                "org_share/question.org"
                                ))
;; update daily at 01:00am
;; (run-at-time "01:00am" 86400 'org-export-for-mobile)
;; File: emacs-aggregation-setup.el ends
