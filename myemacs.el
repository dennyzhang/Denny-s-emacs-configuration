;; -*- coding: utf-8 -*-
;; File: myemacs.el --- the entrance point for various emacs configuration files
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2018-07-01 20:21:19>
;; --8<-------------------------- separator ------------------------>8--
;; (load-file "~/Dropbox/Denny-s-emacs-configuration/myemacs.el")
;; --8<-------------------------- separator ------------------------>8--
(defconst EMACS_VENDOR "~/Dropbox/private_data/emacs_vendor/")
(defconst EMACS_DATA "~/Dropbox/private_data/emacs_data")
(defconst SHARE_DIR "~/Dropbox/")
(defconst DENNY_EMACS "~/Dropbox/Denny-s-emacs-configuration/")
(defconst GITHUB_DIR "~/git_code/github")

;; Load 3rd packages
(load-file (concat DENNY_EMACS "/packages.el"))
(require 'ox-html)

(setq emacs-load-start-time (current-time))
(when (< emacs-major-version 22)
  (error "Configuration not supported on Emacs < 22."))
;; ;; --8<-------------------------- separator ------------------------>8--
(mapc #'(lambda(emacs-file)
         (load-file
	  (expand-file-name emacs-file DENNY_EMACS)))
      '(
        "bbdb-setting.el"
        "fundamental-setting.el"
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
        "programming-setting.el"
        "facing-setting.el"
        "calendar-setting.el"

        ;;"flymake-setting.el" ;; TODO denny
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
        "voice-setting.el"
        "mac-setting.el"
        "interoperation-setting.el"
        "postfundamental-setting.el"
        "passwd.el"
        "tmp.el"
        ))

;; loading sensitive configurations
;;(load-file (concat DENNY_EMACS "/secrets.el.gpg"))
(load-file (concat DENNY_EMACS "/org-publish/org-publish-to-wordpress.el"))
;; --8<-------------------------- separator ------------------------>8--
;;(Unless (server-running-p) (server-start))
;; calculate how long it takes for emacs start
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))
;; --8<-------------------------- separator ------------------------>8--
;; File: myemacs.el ends here
