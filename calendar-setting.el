;; -*- coding: utf-8 -*-
;; File: calendar-setting.el -- calendar and event reminders
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2013-01-13 14:51:53>
;;
;; --8<-------------------------- separator ------------------------>8--
(setq warning-suppress-types nil)
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1) ;; week start with Monday
;; mark dates with diary entries
(setq calendar-mark-diary-entries-flag t)
(setq calendar-view-holidays-initially-flag nil)
(setq calendar-date-style (quote iso))
;; mark today when opening calendar
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)
(setq calendar-chinese-all-holidays-flag t)
;; mark dates of holidays in the calendar
(setq mark-holidays-in-calendar t)
(setq calendar-date-display-form '(year "-" month "-" day))
(setq calendar-time-display-form
      '(24-hours ":" minutes
                 (if time-zone " (") time-zone (if time-zone ")")))
(setq calendar-view-diary-initially-flag t)
(add-hook 'diary-display-hook 'diary-fancy-display)
;; --8<-------------------------- separator ------------------------>8--
(display-time-mode 1)
(setq display-time-24hr-format t
      display-time-day-and-date t
      display-time-interval 60
      display-time-format " [%m-%d %H:%M]")
;; --8<-------------------------- separator ------------------------>8--
;;set the latitude/longitude
(setq calendar-latitude +31.11)
(setq calendar-longitude +121.29)
(setq calendar-location-name "Shanghai")

;; set color for calendar
(setq calendar-load-hook
      #'(lambda ()
         (set-face-foreground 'diary-face "skyblue")
         (set-face-background 'holiday-face "slate blue")
         (set-face-foreground 'holiday-face "white")
         (set-face-background 'holiday-solar-term "green")
         (set-face-background 'holiday-lunar "blue")))
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
(setq holiday-bahai-holidays nil)
;; --8<-------------------------- separator ------------------------>8--
;; Friends' birthdays are a little sensitive, which will be loaded by a gpg encrypted file
;; --8<-------------------------- separator ------------------------>8--
;; File: calendar-setting.el ends here
