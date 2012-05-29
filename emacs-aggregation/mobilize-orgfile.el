;; -*- mode: EMACS-LISP; coding:utf-8; -*-
;;; ================================================================
;; Copyright © 2010-2011 Time-stamp: <2012-05-29 21:19:48>
;;; ================================================================

;;; File: mobilize-orgfile.el --- A plug-in system for information aggregation of daily life
;;;
;;; Author: Denny Zhang <markfilebat@126.com>
;;; Keywords: aggregation
;;; Version: 0.1
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, ShangHai, China
;;
;; Please send suggestions and bug reports to
;; <markfilebat@126.com>. The latest version of this package
;; should be available from
;;
;; <URL:http://www.emacswiki.org/emacs// TODO>

;;; Overview ==========================================================
;;
;; This module is target to enable us to utilize org-mode files better.
;;
;; It enables us to do selective publishing

;;; INSTALLATION =====================================================
;;
;; TODO:
;;
;; -------------------------- separator --------------------------

;;; FLY TRY =====================================================
;; TODO:

;;; Code:

(defvar mobile-export-src-dir nil
  "")

(defvar mobile-export-publish-dir nil
  "")

(defvar mobile-export-file-list nil
  "")

(setq mobile-export-src-dir "/home/denny/backup/essential/Dropbox/private_data/emacs_stuff/org_data")
(setq mobile-export-publish-dir "/tmp/mobile/")
(setq mobile-export-file-list '("contacts.org"
                                ;;"project.org"
                                "career.org"
                                "wish.org"
                                "work.org"
                                "current.org"
                                "wealth.org"
                                "learn.org"
                                "diary.org"
                                "top.org"
                                "often.org"
                                "org_share/connection.org"
                                ))

(defun org-export-for-mobile ()
  (interactive)
  (dolist (org-file mobile-export-file-list)
    (org-export-file-for-mobile
     (format "%s/%s" mobile-export-src-dir org-file))
    )
  )

(defun org-export-file-for-mobile (org-file)
  (interactive)
  (let ((org-mobile-level 3)
        (opt-plist '(:tasks ("DONE", "TODO"))))
    (find-file org-file)
    (org-export-as-html org-mobile-level t opt-plist nil nil mobile-export-publish-dir)
    )
  )
(provide 'mobilize-orgfile)
;; File: mobilize-orgfile.el ends
