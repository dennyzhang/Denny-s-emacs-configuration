;; -*- coding: utf-8 -*-
;; File: windowsonly-setting.el --- Settings only valid for Windows OS
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2011-11-26 10:49:47>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
(global-set-key [f11] 'w32-maximize-frame)
(global-set-key [C-f11] 'w32-restore-frame)
(defun w32-restore-frame (&optional arg)
  "Restore a minimized frame"
  (interactive)
 (if (string-equal system-type "windows-nt")
     (w32-send-sys-command 61728 arg)))
(defun w32-maximize-frame (&optional arg)
  "Maximize the current frame"
  (interactive)
  (if (string-equal system-type "windows-nt")
      (w32-send-sys-command 61488 arg)))
;; --8<-------------------------- §separator§ ------------------------>8--
(require 'printing) ; load printing package
(setenv "GS_LIB" "d:/Program Files/gs/gs8.64/lib;");;TODO enhance here
(setq ps-lpr-command "d:/Program Files/gs/gs8.64/bin/gswin32c.exe")
(setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH" "-sDEVICE=mswinpr2"))
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat CONTRIBUTOR_CONF "/fontset-win/fontset-win.el"))
(if (string-equal system-type "windows-nt")
    (huangq-fontset-courier 16))
;; --8<-------------------------- §separator§ ------------------------>8--
;; (set-default-coding-systems 'chinese-iso-8bit-unix)
;; (set-buffer-file-coding-system 'chinese-iso-8bit-unix)
;; (set-terminal-coding-system 'chinese-iso-8bit-unix)
;; (setq default-process-coding-system '(chinese-iso-8bit-unix . chinese-iso-8bit-unix))
;; (set-clipboard-coding-system 'chinese-iso-8bit-unix)
;; (set-selection-coding-system 'chinese-iso-8bit-unix)
;; (modify-coding-system-alist 'process "*" 'chinese-iso-8bit-unix)
;; (setq-default pathname-coding-system 'chinese-iso-8bit-unix)
;; (set-file-name-coding-system 'chinese-iso-8bit-unix)
;; (setq ansi-color-for-comint-mode t)
;; --8<-------------------------- §separator§ ------------------------>8--
;; (set-language-environment 'utf-8)
;; (set-keyboard-coding-system 'utf-8-unix)
;; (set-default-coding-systems 'utf-8-unix)
;; (set-buffer-file-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (setq default-process-coding-system '(utf-8 . utf-8))
;; (set-clipboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (modify-coding-system-alist 'process "*" 'utf-8)
;; (setq-default pathname-coding-system 'utf-8)
;; (set-file-name-coding-system 'utf-8)
;; (setq ansi-color-for-comint-mode t)
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: windowsonly-setting.el ends here