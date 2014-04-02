;; -*- mode: EMACS-LISP; coding:utf-8; -*-
;;; ================================================================
;; Copyright © 2010-2011 Time-stamp: <2014-03-25 10:13:02>
;;; ================================================================

;;; File: family.el --- Setup for emacs-aggregation.el
;;;
;;; Author: Denny Zhang <filebat.mark@gmail.com>
;;

;;(load-file (concat EMACS_VENDOR "/emacs-aggregation/emacs-aggregation.el"))
(load-file (concat DENNY_CONF "/emacs_conf/emacs-aggregation/emacs-aggregation.el"))
(setq report-subject "Weekly Family Report -- Denny & Sophia")
;; (setq recipient-mail "filebat.mark@gmail.com filebat.mark@gmail.com sophiazhang8709@126.com")
(setq recipient-mail "249950670@qq.com 362552579@qq.com")
;;(setq recipient-mail "249950670@qq.com")
(setq aggregate-retrieve-data-fun-list nil)

(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-org-shopping-list)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-web)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-period)
(add-to-list 'aggregate-retrieve-data-fun-list 'retrieve-tailing-message)

(setq mail-attachment "; uuencode /tmp/sophia.png sophia_period.png")

(defun retrieve-org-shopping-list ()
  (cons " Shopping List " (retrieve-org-tags "Shopping" t)))

(defun retrieve-period ()
  (cons " Sophia周期曲线 " "详情见附件"))

(defun retrieve-web()
  (let (content)
    (setq content (format "Houston天气:%s

Boston天气:%s

长沙天气:%s

滨州天气:%s
"
                          (retrieve-html-content "http://www.baidu.com/s?wd=Houston+天气" "中国天气网" "中国气象局")
                          (retrieve-html-content "http://www.baidu.com/s?wd=Boston+天气" "中国天气网" "中国气象局")
                          (retrieve-html-content "http://www.baidu.com/s?wd=长沙+天气" "中国天气网" "op_weather4_twoicon")
                          (retrieve-html-content "http://www.baidu.com/s?wd=滨州+天气" "中国天气网" "op_weather4_twoicon")
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
(setq mobile-export-file-list '("current.org"
                                "contacts.org"
                                ))
;; File: family.el ends
