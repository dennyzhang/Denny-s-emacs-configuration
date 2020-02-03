;; -*- coding: utf-8 -*-
;; File: myemacs.el --- the entrance point for various emacs configuration files
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:47>
;; --8<-------------------------- separator ------------------------>8--
;; (load-file "~/Dropbox/Denny-s-emacs-configuration/myemacs.el")
;; --8<-------------------------- separator ------------------------>8--
(defconst CONF-EMACS-VENDOR "~/Dropbox/private_data/emacs_vendor/")
(defconst CONF-EMACS-DATA "~/Dropbox/private_data/emacs_data")
(defconst CONF-SHARE-DIR "~/Dropbox/")
(defconst CONF-DENNY-EMACS "~/Dropbox/Denny-s-emacs-configuration/")
(defconst CONF-GITHUB-DIR "~/git_code/github")

;; Load 3rd packages
(load-file (concat CONF-DENNY-EMACS "/packages.el"))
(require 'ox-html)

(setq emacs-load-start-time (current-time))
(when (< emacs-major-version 22)
  (error "Configuration not supported on Emacs < 22."))
;; ;; --8<-------------------------- separator ------------------------>8--
(mapc #'(lambda(emacs-file)
         (load-file
	  (expand-file-name emacs-file CONF-DENNY-EMACS)))
      '(
        "bbdb-setting.el"
        "fundamental-setting.el"
        "shortcut.el"
        "appearance-setting.el"
        "buffer-setting.el"

        "essentialpackage-setting.el"
        "org-setting.el"
        "gnus-setting.el"
        "web-setting.el"
        "dired-setting.el"
        "handyfunction-setting.el"
        "regexp-setting.el"
        "magic-setting.el"
        "otherpackage-setting.el"
        ;; programming
        "programming/programming-setting.el"

        "facing-setting.el"
        "calendar-setting.el"
        "largeessentialpackage-setting.el"
        "online-search/online-search-setting.el"
        "insertion-setting.el"
        "set-os-environment-setting.el"
        "set-file-mode-setting.el"
        "save-file-hook-setting.el"
        "comint-setting.el"
        "rectangle-setting.el"
        "capture-setting.el"
        "sns-setting.el"
        "latex-setting.el"

        "diff-setting.el"
        "web-setting.el"
        "linux-setting.el"
        "shell-setting.el"
        "mac-setting.el"
        "interoperation-setting.el"
        "postfundamental-setting.el"
        "passwd.el"
        "tmp.el"
        ))

;; loading sensitive configurations
;;(load-file (concat CONF-DENNY-EMACS "/secrets.el.gpg"))
(load-file (concat CONF-DENNY-EMACS "/org-publish/org-publish-to-wordpress.el"))
;; --8<-------------------------- separator ------------------------>8--
;;(Unless (server-running-p) (server-start))
;; calculate how long it takes for emacs start
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))
