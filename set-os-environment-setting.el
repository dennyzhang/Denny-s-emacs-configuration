;; -*- coding: utf-8 -*-
;; File: set-os-environment-setting.el --- Set os related environment parameters
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact);; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-07-03 21:31:08>
;;
;; --8<-------------------------- separator ------------------------>8--
;; set environment variables for different OS
(setenv "LEDGER_FILE" (concat CONF-SHARE-DIR "private_data/emacs_data/bank/filebat.ledger"))

(if (string= "darwin" system-type)
    (progn
      (setenv "LEDGER" "~/homebrew/bin/ledger")
      (setenv "EMACS_BIN" "/usr/local/bin/emacs")
      )
  )
(if (string= "gnu/linux" system-type)
    (progn
      (setenv "LEDGER" "/usr/bin/ledger")
      (setenv "EMACS_BIN" "/usr/local/bin/emacs")
      )
  )
;; --8<-------------------------- separator ------------------------>8--
;;(setq exec-path (append exec-path '(concat CONF-EMACS-DATA "/"))) ;;Change binary path
(setenv "LC_ALL" "en_US.UTF-8")
;; --8<-------------------------- separator ------------------------>8--
;; File: set-os-environment-setting.el ends here
