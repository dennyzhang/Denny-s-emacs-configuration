;; -*- coding: utf-8 -*-
;; File: python-setting.el --- utilities for developers
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2018-07-08 00:18:20>
;;
;; --8<-------------------------- separator ------------------------>8--
;; https://stackoverflow.com/questions/35565945/emacs-auto-complete-for-go-language
;; http://www.flycheck.org/en/latest/
(global-flycheck-mode)

;; enable flycheck
(add-hook 'python-mode-hook 'flycheck-mode)

(setq python-indent-offset 4)
;; File: python-setting.el ends here
