;; -*- coding: utf-8 -*-
;; File: interoperation-setting.el --- Interoperation with emacs and various tools/utilities
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-08-20 08:23:41>
;;
;; --8<-------------------------- separator ------------------------>8--
;;(load-file (concat EMACS_VENDOR "top-mode/top-mode.el"))
;; --8<-------------------------- separator ------------------------>8--
(defun lock-screen ()
  "Lock screen using (zone) and xtrlock
calls M-x zone on all frames and runs xtrlock.
To use this extension, you need install xtrlock in your system."
  (interactive)
  (save-excursion
    ;; Don't burn LCD power.
    (shell-command "xset dpms force off && sleep 1")
    ;; Lock screen.
    (set-process-sentinel
     (start-process "xtrlock" nil "xtrlock")
     '(lambda (process event)
        (zone-leave-me-alone)))
    (zone)))
;; --8<-------------------------- separator ------------------------>8--
;; File: interoperation-setting.el ends here
