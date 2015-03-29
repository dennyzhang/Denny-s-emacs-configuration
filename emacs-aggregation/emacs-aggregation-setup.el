;; -*- mode: EMACS-LISP; coding:utf-8; -*-
;;; ================================================================
;; Copyright © 2010-2011 Time-stamp: <2015-03-29 16:42:53>
;;; ================================================================

;;; File: emacs-aggregation-setup.el --- Setup for emacs-aggregation.el
;;;
;;; Author: Denny Zhang <filebat.mark@gmail.com>
;;

;;(load-file (concat EMACS_VENDOR "/emacs-aggregation/emacs-aggregation.el"))
(load-file (concat DENNY_CONF "/emacs_conf/emacs-aggregation/emacs-aggregation.el"))
(setq report-subject (format "Emacs Daily Journal from %s" system-name))
;; (setq recipient-mail "filebat.mark@gmail.com filebat.mark@gmail.com sophiazhang8709@126.com")
(setq recipient-mail "249950670@qq.com")
(setq start-time "11:50am")
(setq repeat-interval 86400)
(setq aggregate-retrieve-data-fun-list nil)
(setq mail-attachment "")

(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-communication-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-recite-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-remind)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-web)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-shopping-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-habit-list)

(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-todo-list)

(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-tailing-message)

;; TODO remove the tailing functions
(defun retrieve-todo-list ()
  (cons " [TODO] DENNY TODO-List " (retrieve-org-todo-list)))

(defun retrieve-org-habit-list ()
  (cons " Habits to be formed " (retrieve-org-tags "Habit" t)))

(defun retrieve-org-recite-list ()
  (cons " Recite List " (retrieve-org-tags "Recite" t)))

(defun retrieve-org-shopping-list ()
  (cons " Shopping List " (retrieve-org-tags "Shopping" t)))

(defun retrieve-org-communication-list ()
  (cons " Communicate with friends " (retrieve-org-tags "Communication" t)))

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
    (setq content (format "Houston天气:%s

Boston天气:%s

长沙天气:%s
"
                          ;;(retrieve-html-content "http://www.baidu.com/s?wd=上海+天气" "中国天气网" "中国气象局")
                          (retrieve-html-content "http://www.baidu.com/s?wd=Houston+天气" "中国天气网" "中国气象局")
                          (retrieve-html-content "http://www.baidu.com/s?wd=Boston+天气" "中国天气网" "中国气象局")
                          (retrieve-html-content "http://www.baidu.com/s?wd=长沙+天气" "中国天气网" "op_weather4_twoicon")
                          ;;(retrieve-html-content "http://stock.stcn.com/sh/600435/" "北方导航600435" "净流量")
                          ;;(retrieve-html-content "http://stock.stcn.com/sh/600362/" "江西铜业600362" "净流量")
                          ))
    (cons " Internet information" content))
  )

(defun retrieve-tailing-message()
  (cons "=============" (retrieve-signature)))

;;(aggregation-timer)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat DENNY_CONF "/emacs_conf/emacs-aggregation/mobilize-orgfile.el"))
(setq org-export-html-style "")
(setq mobile-export-src-dir (concat DENNY_CONF "org_data"))
(setq mobile-export-publish-dir (concat DENNY_CONF "mobile_export"))
(setq mobile-export-file-list '("contacts.org"
                                ;;"project.org"
                                "career.org"
                                "wish.org"
                                "work.org"
                                "current.org"
                                "algorithm.org"
                                "org_share/music.org"
                                "english.org"
                                "life/wealth.org"
                                "learn.org"
                                "top.org"
                                "often.org"
                                "org_share/diary.org"
                                "org_share/question.org"
                                ))
;; update daily at 01:00am
;; (run-at-time "01:00am" 86400 'org-export-for-mobile)
;; File: emacs-aggregation-setup.el ends
