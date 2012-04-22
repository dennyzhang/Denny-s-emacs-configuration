;; -*- mode: EMACS-LISP; coding:utf-8; -*-
;;; ================================================================
;; Copyright © 2010-2011 Time-stamp: <2012-04-21 11:18:26>
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
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-target-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-holiday-remind)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-recite-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-web-weather-shanghai)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-shopping-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-habit-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-web-stock-zbjd)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-misc-list)
;;(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-web-weather-bingzhou)
;;(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-web-weather-changsha)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-delegation-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-todo-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-tailing-message)

(defun retrieve-todo-list ()
  (cons " [TODO] DENNY TODO-List " (retrieve-org-todo-list)))

(defun retrieve-org-shopping-list ()
  (cons " 超市采购清单 " (retrieve-org-tags "Shopping" t)))

(defun retrieve-org-habit-list ()
  (cons " 培养的习惯 " (retrieve-org-tags "Habit" t)))

(defun retrieve-org-target-list ()
  (cons " 第二象限 " (retrieve-org-tags "Target" t)))

(defun retrieve-org-delegation-list ()
  (cons " 委托事宜 " (retrieve-org-tags "Delegation" t)))

(defun retrieve-org-recite-list ()
  (cons " 背诵 " (retrieve-org-tags "Recite" t)))

(defun retrieve-org-misc-list ()
  (cons " org-mode misc  " (retrieve-org-tags "Misc" t)))

(defun retrieve-holiday-remind ()
  (cons " [提醒] 生日+节日 " (retrieve-diary-remind 4)))

(defun retrieve-web-weather-shanghai()
  (cons " [天气] 上海 " (retrieve-html-content "http://www.baidu.com/s?wd=上海+天气" "中国天气网" "中国气象局")))

(defun retrieve-web-weather-changsha()
  (cons " [天气] 长沙 " (retrieve-html-content "http://www.baidu.com/s?wd=长沙+天气" "中国天气网" "中国气象局")))

(defun retrieve-web-weather-bingzhou()
  (cons " [天气] 滨州 " (retrieve-html-content "http://www.baidu.com/s?wd=滨州+天气" "中国天气网" "中国气象局")))

(defun retrieve-web-stock-zbjd()
  (cons " [股票] 中兵光电 " (retrieve-html-content "http://stock.stcn.com/sh/600435/" "中兵光电600435" "净流量")))

(defun retrieve-tailing-message()
  (cons "=============" (retrieve-signature)))

(aggregation-timer)
;; File: emacs-aggregation-setup.el ends
