;; -*- coding: utf-8 -*-
;; File: myemacs.el --- emacs Configuration entrance
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-03-02 05:48:06>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat DENNY_CONF "/emacs_conf/passwd.el"))
(load-file (concat DENNY_CONF "/emacs_conf/fundamental-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/clean-appearance-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/buffer-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/essentialpackage-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/dired-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/handyfunction-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/programming-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/facing-setting.el"))
;;(load-file (concat DENNY_CONF "/emacs_conf/flymake-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/calendar-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/largeessentialpackage-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/org-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/bbdb-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/ledger-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/gnus-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/online-search/online-search-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/web-browse-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/insertion-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/set-os-environment-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/set-file-mode-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/comint-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/rectangle-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/emacs-aggregation/emacs-aggregation-setup.el"))
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat DENNY_CONF "/emacs_conf/beta-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/otherpackage-setting.el"))
(cond
 ((string-equal system-type "gnu/linux")
  (load-file (concat DENNY_CONF "/emacs_conf/linux-setting.el"))
  (load-file (concat DENNY_CONF "/emacs_conf/multimediea-setting.el"))
  (load-file (concat DENNY_CONF "/emacs_conf/shell-setting.el"))
  (load-file (concat DENNY_CONF "/emacs_conf/voice-setting.el"))
  (load-file (concat DENNY_CONF "/emacs_conf/interoperation-setting.el")))
 ((string-equal system-type "windows-nt")
  (load-file (concat DENNY_CONF "/emacs_conf/windowsonly-setting.el")))
 ((string-equal system-type "cygwin")
  (load-file (concat DENNY_CONF "/emacs_conf/cygwin-setting.el")))
 )
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat DENNY_CONF "/emacs_conf/postfundamental-setting.el"))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: myemacs.el ends here
