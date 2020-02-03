;; -*- coding: utf-8 -*-
;; File: facing-setting.el
;;
;; Author: Denny(https://www.dennyzhang.com/contact)
;;
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:48>
;;
;; --8<-------------------------- separator ------------------------>8--
;; define customized face
(defface font-lock-denny-face
  '((((class color) (min-colors 88) (background light))
     (:foreground "magenta"))
    (t (:inverse-video t :weight bold :underline t)))
  "Font Lock mode face used to highlight warnings."
  :group 'font-lock-faces)

(defvar font-lock-denny-face 'font-lock-denny-face)

;; (dolist (mode programming-mode-list)
;;   (font-lock-add-keywords mode
;;                           ;; If one line matches specific keywords, highlight and underline it with customized face
;;                           '(("\\<\\(TODO.*\\|todo.*\\|Todo.*\\|FIXME.*\\|fixme.*\\)" 1 font-lock-denny-face)
;;                             ("\\<\\(denny.*\\)" 1 font-lock-denny-face)
;;                             )))

;; (dolist (mode '(shell-mode eshell-mode))
;;   (font-lock-add-keywords mode
;;                           '(("\\<\\(error.*\\)" 1 font-lock-denny-face)
;;                             ("\\<\\(Permission denied.*\\)" 1 font-lock-denny-face)
;;                             )))

;; font-lock-keywords
(font-lock-add-keywords 'erlang-mode
                        '(("\\<\\(TODO.*\\|todo.*\\|Todo.*\\|FIXME.*\\|fixme.*\\)"
                           1 font-lock-denny-face)
                          ("\\<\\(denny.*\\)" 1 font-lock-denny-face)
                          ("\\(sophia.*\\)" 1 font-lock-denny-face)
                          )
                        t)
