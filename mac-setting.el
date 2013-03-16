;; -*- coding: utf-8 -*-
;; File: mac-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2013-03-16 11:02:57>
;;
;; --8<-------------------------- separator ------------------------>8--
(setq mac-command-modifier 'meta) 
(setq mac-control-modifier 'control) 
(setq mac-option-modifier 'alt)

(setenv "PATH" "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/")
(add-to-list 'exec-path "/usr/local/bin")


(setq split-width-threshold nil)

(set-default-font "-apple-Courier-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1")
(set-frame-parameter nil 'fullscreen 'fullboth)
;; --8<-------------------------- separator ------------------------>8--
;; File: mac-setting.el
