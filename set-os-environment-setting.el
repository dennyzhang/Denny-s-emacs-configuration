;; -*- coding: utf-8 -*-
;; File: set-os-environment-setting.el --- Set os related environment parameters
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2011-12-04 23:03:25>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
;; set environment variables for different OS
(if (string= "windows-nt" system-type)
    (progn
      (setenv "LEDGER" "~/myemacs/nonelisp-tool/ledger/ledger.exe")
      (setenv "LEDGER_FILE" "e:/Dropbox/private_data/emacs_stuff/bank/filebat.ledger")
      (setenv "EMACS_BIN" "~/bin/emacs.exe")
      ))
(if (string= "cygwin" system-type)
    (progn
      (setenv "LEDGER" "/usr/bin/ledger")
      (setenv "LEDGER_FILE" "e:/Dropbox/private_data/emacs_stuff/bank/filebat.ledger")
      (setenv "EMACS_BIN" "~/bin/emacs.exe")
      )
  )
(if (string= "gnu/linux" system-type)
    (progn
      (setenv "LEDGER" "/usr/bin/ledger")
      (setenv "LEDGER_FILE" "~/backup/essential/Dropbox/private_data/emacs_stuff/bank/filebat.ledger")
      (setenv "EMACS_BIN" "/usr/local/bin/emacs")
      )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
;;(setq exec-path (append exec-path '(concat DENNY_CONF "emacs_data/"))) ;;Change binary path
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: set-os-environment-setting.el ends here