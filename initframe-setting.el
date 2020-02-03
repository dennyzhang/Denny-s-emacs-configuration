;; -*- coding: utf-8 -*-
;; File: initframe-setting.el --- org-mode export css
;;
;; Author: Denny(https://www.dennyzhang.com/contact)
;;
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:47>
;;
;; --8<-------------------------- separator ------------------------>8--
(setq initial-frame-alist '((top . 100) (left . 100)))
(setq default-frame-alist
      (append
       '((width . 105)
         (height . 35)
         (foreground-color . "Wheat")
         (background-color . "DarkSlateGray")
         (cursor-color . "Orchid"))
       default-frame-alist))
