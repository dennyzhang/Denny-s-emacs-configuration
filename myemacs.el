;; -*- coding: utf-8 -*-
;; File: myemacs.el --- the entrance point for various emacs configuration files
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-05-08 22:50:10>
;;
;; --8<-------------------------- separator ------------------------>8--
(defconst EMACS_VENDOR "~/backup/essential/emacs_vendor/")
(defconst DENNY_CONF "~/backup/essential/Dropbox/private_data/emacs_stuff/")
(setq emacs-load-start-time (current-time))
(when (< emacs-major-version 22)
  (error "Configuration not supported on Emacs < 22."))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat DENNY_CONF "/emacs_conf/fundamental-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/clean-appearance-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/buffer-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/essentialpackage-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/dired-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/handyfunction-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/diff-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/regexp-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/magic-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/programming-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/facing-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/flymake-setting.el"))
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
  (load-file (concat DENNY_CONF "/emacs_conf/cygwin-setting.el"))))
(load-file (concat DENNY_CONF "/emacs_conf/postfundamental-setting.el"))
(load-file (concat DENNY_CONF "/emacs_conf/passwd.el"))
(load-file (concat DENNY_CONF "/emacs_conf/tmp.el"))
;; --8<-------------------------- separator ------------------------>8--
(unless (server-running-p) (server-start))
;; caculate how long it takes for emacs start
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds." (time-to-seconds (time-since emacs-load-start-time))))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: myemacs.el ends here
