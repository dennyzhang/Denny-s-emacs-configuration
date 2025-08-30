;; -*- coding: utf-8 -*-
;; File: mac-setting.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2025-08-25 09:45:15>
;;
;; --8<-------------------------- separator ------------------------>8--

;; (setenv "PATH" "/usr/local/google-cloud-sdk/bin:/usr/bin:/bin:/usr/sbin:/sbin:/:/usr/local/texlive/2013/bin/universal-darwin/:/opt/local/bin::/usr/local/Cellar/go/1.10.3/bin:://usr/local/Cellar/go/1.10.3/libexec/bin:/Library/TeX/texbin")
(setq exec-path (append exec-path '("/usr/local/bin" "/opt/local/bin" "/usr/local/opt/go/libexec/bin" "~/homebrew/bin/")))

(setq split-width-threshold nil)

;;(set-default-font "-apple-Courier-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1")

(set-face-attribute 'default nil :height 160)
(set-frame-parameter nil 'fullscreen 'fullboth)
(set-face-foreground 'default "#996633")

;; (defun qiang-font-existsp (font)
;;   (if (null (x-list-fonts font)) nil t))
;; 
;; (defvar font-list '("宋体" "新宋体" "Microsoft Yahei" "文泉驿等宽微米黑" "黑体" ))
;; 
;; (require 'cl) ;; find-if is in common list package
;; (find-if #'qiang-font-existsp font-list)
;; 
;; (defun qiang-make-font-string (font-name font-size)
;;   (if (and (stringp font-size)
;;            (equal ":" (string (elt font-size 0))))
;;       (format "%s%s" font-name font-size)
;;     (format "%s %s" font-name font-size)))
;; 
;; (defun qiang-set-font (english-fonts
;;                        english-font-size
;;                        chinese-fonts
;;                        &optional chinese-font-size)
;;   "english-font-size could be set to \":pixelsize=18\" or a integer.
;; If set/leave chinese-font-size to nil, it will follow english-font-size"
;;   (require 'cl) ; for find if
;;   (let ((en-font (qiang-make-font-string
;;                   (find-if #'qiang-font-existsp english-fonts)
;;                   english-font-size))
;;         (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
;;                             :size chinese-font-size)))
;;     (message "Set English Font to %s" en-font)
;;     (set-face-attribute
;;      'default nil :font en-font)
;;     (message "Set Chinese Font to %s" zh-font)
;;     (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;       (set-fontset-font (frame-parameter nil 'font)
;;                         charset
;;                         zh-font))))
;; (qiang-set-font '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=19" '("宋体" "新宋体" "Microsoft Yahei" "文泉驿等宽微米黑" "黑体" ))
;; --8<-------------------------- separator ------------------------>8--
;; File: mac-setting.el
