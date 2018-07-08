;; -*- coding: utf-8 -*-
;; File: golang-setting.el --- utilities for developers
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2018-07-02 22:44:02>
;;
;; --8<-------------------------- separator ------------------------>8--
;; https://stackoverflow.com/questions/35565945/emacs-auto-complete-for-go-language
;; http://www.flycheck.org/en/latest/
(global-flycheck-mode)

(add-hook 'go-mode-hook (lambda ()
                          ;; use tab for indent
                          (set (make-local-variable 'indent-tabs-mode) t)
                          ;; enable company mode for autocompletion
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
;; enable flycheck
(add-hook 'go-mode-hook 'flycheck-mode)
;; File: golang-setting.el ends here
