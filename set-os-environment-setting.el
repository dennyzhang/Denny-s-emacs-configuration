;; -*- coding: utf-8 -*-
;; File: set-os-environment-setting.el --- Set os related environment parameters
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact);; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2017-11-13 11:17:02>
;;
;; --8<-------------------------- separator ------------------------>8--
;; set environment variables for different OS
(if (string= "darwin" system-type)
    (progn
      (setenv "LEDGER" "/usr/local/bin/ledger")
      (setenv "LEDGER_FILE" (concat SHARE_DIR "private_data/emacs_stuff/bank/filebat.ledger"))
      (setenv "EMACS_BIN" "/usr/local/bin/emacs")
      )
  )
(if (string= "gnu/linux" system-type)
    (progn
      (setenv "LEDGER" "/usr/bin/ledger")
      (setenv "LEDGER_FILE" (concat SHARE_DIR "private_data/emacs_stuff/bank/filebat.ledger"))
      (setenv "EMACS_BIN" "/usr/local/bin/emacs")
      )
  )
;; --8<-------------------------- separator ------------------------>8--
;;(setq exec-path (append exec-path '(concat EMACS_DATA "/"))) ;;Change binary path
(setenv "LC_ALL" "en_US.UTF-8")
;; --8<-------------------------- separator ------------------------>8--
;; File: set-os-environment-setting.el ends here
