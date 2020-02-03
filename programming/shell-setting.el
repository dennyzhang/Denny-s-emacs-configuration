;; -*- coding: utf-8 -*-
;; File: shell-setting.el --- utilities for developers
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:43>
;;
;; --8<-------------------------- separator ------------------------>8--
;; https://stackoverflow.com/questions/35565945/emacs-auto-complete-for-go-language
;; http://www.flycheck.org/en/latest/
(global-flycheck-mode)

;; M-x flycheck-list-errors
;; enable flycheck
(add-hook 'shell-mode-hook 'flycheck-mode)
;; File: shell-setting.el ends here
