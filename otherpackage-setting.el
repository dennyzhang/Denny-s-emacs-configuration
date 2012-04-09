;; -*- coding: utf-8 -*-
;; File: otherpackage-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-04-05 22:34:45>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
(eval-when-compile (require 'cl))
;; --8<-------------------------- §separator§ ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/jd-el/"))
(require 'google-maps)
(defun show-bbdb-loaction ()
  "put all my contacts stored into BBDB on a Google Maps' map"
  (interactive)
  (google-maps-static-show
   :markers
   (mapcar
    (lambda (address-entry)
      `((,(concat
           (mapconcat
            'identity
            (elt address-entry 1) ", ") ", "
            (elt address-entry 2) ", "
            (elt address-entry 3) ", "
            (elt address-entry 4) ", "
            (elt address-entry 5)))))
    (mapcan
     (lambda (record)
       ;; We need to copy the returned list, because mapcan will modify it later
       (copy-list (bbdb-record-addresses record)))
     (bbdb-records))))
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat EMACS_VENDOR "/keywiz/keywiz.el"))
;; --8<-------------------------- §separator§ ------------------------>8--
;;(appt-activate)
(setq appt-display-format 'window)
;;(setq appt-display-duration 3)
(setq appt-display-interval 10)
(setq appt-display-mode-line t)
;; --8<-------------------------- §separator§ ------------------------>8--
;;Find file recursively
(load-file (concat EMACS_VENDOR "/find-recursive/find-recursive.el"))
(require 'find-recursive)
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat EMACS_VENDOR "/log4j-mode/log4j-mode.el"))
(require 'log4j-mode)
(add-to-list 'auto-mode-alist '("\\.log" . log4j-mode))
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat EMACS_VENDOR "/dupwords/dupwords.el"))
(require 'dupwords)
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat EMACS_VENDOR "/hfyview/hfyview.el"))
(global-set-key [(meta p)(p)] 'hfyview-buffer)
(setq hfy-meta-tags
      (format "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=%s\" />" "utf-8"))
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat EMACS_VENDOR "/sl/sl.el"))
(require 'sl)
;; --8<-------------------------- §separator§ ------------------------>8--
(require 'desktop)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(add-to-list 'desktop-globals-to-save 'vc-comment-ring)
(setq desktop-buffers-not-to-save
      (concat "\\(" "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
	      "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
	      "\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'erc-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
(desktop-save-mode 1)
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: otherpackage-setting.el ends here
