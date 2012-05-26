;; -*- coding: utf-8 -*-
;; File: calendar-setting.el -- calendar and event reminders
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-05-23 00:11:24>
;;
;; --8<-------------------------- separator ------------------------>8--
(setq warning-suppress-types nil)
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)
;; mark dates with diary entries
(setq calendar-mark-diary-entries-flag t)
(setq calendar-view-holidays-initially-flag nil)
(setq calendar-date-style (quote iso))
;; mark today when opening calendar
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)
(setq calendar-chinese-all-holidays-flag t)
;; --8<-------------------------- separator ------------------------>8--
(display-time-mode 1)
(setq display-time-24hr-format t
      display-time-day-and-date t
      display-time-format " %Y-%m-%d %H:%M %A")
;; --8<-------------------------- separator ------------------------>8--
;;set the latitude/longitude
(setq calendar-latitude +31.11)
(setq calendar-longitude +121.29)
(setq calendar-location-name "Shanghai")

;; set color for calendar
(setq calendar-load-hook
      '(lambda ()
         (set-face-foreground 'diary-face "skyblue")
         (set-face-background 'holiday-face "slate blue")
         (set-face-foreground 'holiday-face "white")))
;; --8<-------------------------- separator ------------------------>8--
;; set lunar calendar stuff
(setq calendar-chinese-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq calendar-chinese-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])
;; --8<-------------------------- separator ------------------------>8--
;; remove unrelated holidays
(setq holiday-hebrew-holidays nil)
(setq holiday-islamic-holidays nil)
(setq holiday-solar-holidays nil)
;; --8<-------------------------- separator ------------------------>8--
(setq calendar-holidays
      '((holiday-chinese 12 9 "爸爸生日") ;; 1954
        (holiday-chinese 2 26 "妈妈生日") ;; 1956
        (holiday-chinese 7 15 "大姐生日")
        (holiday-chinese 7 19 "二姐生日")
        (holiday-chinese 6 21 "Denny生日")
        (holiday-fixed 9 14 "秀秀生日") ;; 1987
        (holiday-chinese 8 18 "秀秀爸爸生日") ;; 1963-10-5
        (holiday-chinese 12 20 "秀秀妈妈生日") ;; 1962-2-24
        (holiday-chinese 9 10 "杨明哲生日") ;;2011
        ;; --8<-------------------------- separator ------------------------>8--
        (holiday-fixed 6 14 "张伟智生日")
        (holiday-chinese 12 11 "四姨生日")
        (holiday-fixed 11 8 "任全生日")
        (holiday-fixed 3 7 "陈赞生日")
        ;; --8<-------------------------- separator ------------------------>8--
        (holiday-fixed 4 1 "赵曜生日")
        (holiday-fixed 8 10 "吉嘉生日")
        (holiday-fixed 11 8 "尹光宗生日")
        (holiday-fixed 11 29 "刘云晕生日")
        (holiday-fixed 7 7 "林宏生生日")
        (holiday-fixed 5 18 "郑平生日")
        (holiday-fixed 10 12 "李建军生日")
        (holiday-fixed 10 15 "麦向东生日")
        (holiday-fixed 1 1 "郑彦树生日")
        (holiday-fixed 10 1 "周宁生日")
        (holiday-fixed 11 30 "吴杰生日")
        (holiday-fixed 7 1 "彭丽仪生日")
        (holiday-fixed 9 7 "杨志明生日")
        (holiday-fixed 12 3 "杨晓亮生日")
        (holiday-fixed 4 15 "肖建泽生日")
        (holiday-fixed 12 18 "陈莹生日")
        (holiday-chinese 8 21 "程恒生日")
        (holiday-fixed 11 26 "刘小溪生日")
        ;; --8<-------------------------- separator ------------------------>8--
        (holiday-chinese-new-year)
        (holiday-chinese-winter-solstice)
        (holiday-fixed 1 1 "[节日] -- 元旦节")
        (holiday-chinese 7 7 "[节日] -- 七夕节")
        (holiday-fixed 2 14 "[节日] -- 情人节")
        (holiday-fixed 3 14 "[节日] -- 白色情人节")
        (holiday-fixed 4 1 "[节日] -- 愚人节")
        (holiday-fixed 5 1 "[节日] -- 劳动节")
        (holiday-float 5 0 2 "[节日] -- 母亲节")
        (holiday-fixed 6 1 "[节日] -- 儿童节")
        (holiday-fixed 4 5 "[节日] -- 清明节")
        (holiday-chinese 8 15 "[节日] -- 中秋节")
        (holiday-chinese 9 9 "[节日] -- 重阳节")
        (holiday-float 6 0 3 "[节日] -- 父亲节")
        (holiday-chinese 1 15 "[节日] -- 元宵节")
        (holiday-fixed 7 1 "[节日] -- 建党节")
        (holiday-fixed 8 1 "[节日] -- 建军节")
        (holiday-fixed 9 10 "[节日] -- 教师节")
        (holiday-fixed 10 1 "[节日] -- 国庆节")
        (holiday-chinese 5 5 "[节日] -- 端午节")
        (holiday-fixed 3 8 "[节日] -- 妇女节")
        (holiday-fixed 5 1 "[节日] -- 青年节")
        (holiday-fixed 10 31 "[节日] -- 万圣节")
        (holiday-float 11 4 4 "[节日] -- 感恩节")
        (holiday-fixed 12 25 "[节日] -- 圣诞节")
        (holiday-fixed 3 13 "[节日] -- 杭州纪念日")
        ))
;; --8<-------------------------- seperator ------------------------>8--
;; File: calendar-setting.el ends here
