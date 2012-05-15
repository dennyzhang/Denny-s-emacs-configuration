;; -*- coding: utf-8 -*-
;; File: myemacs.el --- the entrance point for various emacs configuration files
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-05-15 23:49:46>
;;
;; --8<-------------------------- separator ------------------------>8--
(defconst EMACS_VENDOR "~/backup/essential/emacs_vendor/")
(defconst DENNY_CONF "~/backup/essential/Dropbox/private_data/emacs_stuff/")
(setq emacs-load-start-time (current-time))
(when (< emacs-major-version 22)
  (error "Configuration not supported on Emacs < 22."))
;; --8<-------------------------- separator ------------------------>8--
(defun my-load-file (emacs-file)
  (load-file (concat (expand-file-name DENNY_CONF) "/emacs_conf/" emacs-file))
  )
(mapc 'my-load-file
      '("fundamental-setting.el"
        "clean-appearance-setting.el"
        "buffer-setting.el"
        "essentialpackage-setting.el"
        "dired-setting.el"
        "handyfunction-setting.el"
        "diff-setting.el"
        "regexp-setting.el"
        "magic-setting.el"
        "programming-setting.el"
        "facing-setting.el"
        ;;"flymake-setting.el"
        "calendar-setting.el"
        "largeessentialpackage-setting.el"
        "org-setting.el"
        "bbdb-setting.el"
        "ledger-setting.el"
        "gnus-setting.el"
        "online-search/online-search-setting.el"
        "web-browse-setting.el"
        "insertion-setting.el"
        "set-os-environment-setting.el"
        "set-file-mode-setting.el"
        "comint-setting.el"
        "rectangle-setting.el"
        "emacs-aggregation/emacs-aggregation-setup.el"
        "beta-setting.el"
        "otherpackage-setting.el"))
(cond
 ((string-equal system-type "gnu/linux")
  (mapc 'my-load-file
        '("linux-setting.el" "multimediea-setting.el"
          "shell-setting.el" "voice-setting.el"
          "interoperation-setting.el")))
 ((string-equal system-type "windows-nt")
  (load-file (concat DENNY_CONF "/emacs_conf/windowsonly-setting.el")))
 ((string-equal system-type "cygwin")
  (load-file (concat DENNY_CONF "/emacs_conf/cygwin-setting.el"))))
(mapc 'my-load-file
      '("postfundamental-setting.el" "passwd.el" "tmp.el"))
;; --8<-------------------------- separator ------------------------>8--
(unless (server-running-p) (server-start))
;; caculate how long it takes for emacs start
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds." (time-to-seconds (time-since emacs-load-start-time))))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: myemacs.el ends here
