;; -*- mode: EMACS-LISP; coding:utf-8; -*-
;;; ================================================================
;; Copyright © 2010-2011 Time-stamp: <2012-04-21 11:11:45>
;;; ================================================================

;;; File: emacs-aggregation.el --- A plug-in system for information aggregation of daily life
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
;; This module enable us to automatically aggregate daily information,
;; - agenda, like shopping list, delegation list, todo list, etc.
;; - information from internet, like stock, weather, product price etc.
;; - mail notification
;; - etc
;;
;; There are the ways to display the result: w3m mode and plain text mode.
;; Normally, we use w3m, displaying result in a *w3m* buffer.
;; However, w3m is not widely available in Windows OS.
;; Thus, users to downgrade to plain text, by configure the variable of is-w3m-enable

;;; INSTALLATION =====================================================
;;
;; TODO:
;;
;; § -------------------------- separator --------------------------

;;; FLY TRY =====================================================
;; TODO:

;;; Code:

(defvar aggregate-retrieve-data-fun-list nil
  "Plug-in for data retrieval")

(defvar report-subject nil
  "subject for the summary report, which is typically the subject of report mail")

(defvar recipient-mail nil
  "email address for the recipient")

(defvar aggregation-timer nil)

(defvar start-time "09:00am")

(defvar repeat-interval 86400
  "Repeat the action every REPEAT seconds")

(defun aggregation-timer ()
  "Reapt aggregation by a timer"
  (unless aggregation-timer
    (setq aggregation-timer (run-at-time start-time repeat-interval 'aggregation))))

(defun aggregation ()
  "aggregate various information to a global view"
  (interactive)
  (let (retrieve-data-list)
    (setq retrieve-data-list (aggregate-retrieve-data))
    (aggregate-report-result retrieve-data-list)))

(defun aggregate-retrieve-data ()
  "retrieve data.
Typical data includes:
- sections of web pages like stock information, weather, product price, etc
- org-mode agenda
- mail notification "
  (interactive)
  (let ((retrieve-data-list '()) list-ret)
    (dolist (retrieve-fun aggregate-retrieve-data-fun-list)
      (add-to-list 'retrieve-data-list (apply retrieve-fun nil)))
    (setq list-ret retrieve-data-list)))

(defun aggregate-report-result (retrieve-data-list)
  "send summary report"
  (interactive)
  (let (send-mail-command (content "")
                          mail-content
                          (from-mail "markfilebat@126.com"))
    (dolist (item retrieve-data-list)
      (unless (string= (cdr item) "")
        (setq content (format "%s===%s===\n%s\n\n"
                              content (car item) (cdr item)))))
    (setq content (replace-regexp-in-string "\n\n$" "\n" content))
    ;; (setq mail-content (format "Subject: %s\nFrom: %s\n\n%s"
    ;; report-subject from-mail content))
    (setq mail-content (format "To: %s\nSubject: %s\nFrom: %s\n\n%s"
                               (replace-regexp-in-string " " "," recipient-mail)
                               (concat (format-time-string "[%Y-%m-%d] " (current-time)) report-subject)
                               from-mail content))
    ;; escape special characters
    (setq mail-content (replace-regexp-in-string "\"" "“" mail-content))
    (setq mail-content (replace-regexp-in-string "%" "％" mail-content))
    ;; send mail
    (setq send-mail-command
          (format "echo \"%s\" | /usr/bin/msmtp -d -f %s %s" mail-content from-mail recipient-mail))
    (shell-command send-mail-command)
    ))

;; --8<-------------------------- §separator§ ------------------------>8--
(defun retrieve-org-todo-list ()
  (let (retrieve-content)
    (setq retrieve-content "")
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(defun retrieve-org-tags (tag-name &optional include-all-p)
  (let (retrieve-content)
    (save-excursion
      (with-temp-buffer
        (if include-all-p
            (org-tags-view nil tag-name)
          (org-tags-view t tag-name))
        (goto-char (point-min))
        (forward-line 2)
        (setq retrieve-content (buffer-substring-no-properties (point) (point-max)))
        ;; wash data
        (setq retrieve-content (replace-regexp-in-string "^ [^:]+: +" "" retrieve-content))
        (setq retrieve-content (replace-regexp-in-string "^TODO " "- " retrieve-content))
        (setq retrieve-content (replace-regexp-in-string " *:[^ ]+$" "" retrieve-content))
        (setq retrieve-content (replace-regexp-in-string "\n+" "\n" retrieve-content))
        (setq retrieve-content (replace-regexp-in-string "\n$" "" retrieve-content))
        ))))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun retrieve-html-content (url start-anchor-str end-anchor-str)
  (let (retrieve-content)
    (with-temp-buffer
      (url-insert-file-contents url)
      (wash-html-content)
      (limit-html-content start-anchor-str end-anchor-str)
      (setq retrieve-content (buffer-substring-no-properties (point-min) (point-max)))
      )))

(defun wash-html-content ()
  "Wash content by remove or replace useless characters"
  (let ((replace-rule-list
         '(("<[^>]+>" "") ("&nbsp;" " ")
           ("\r" "") (" +$" "") ("^$\r" "\r")
            (" +" " ")
            ("	+" " ")
            ("^ +" "")
            ("\n+" "\n")
           )))
    (goto-char (point-min))
    (let ((case-fold-search t) replace-rule)
      ;; limit content
      ;; (when (re-search-forward "</form>" nil t)
      ;;   (delete-region (point-min) (match-beginning 0)))
      (goto-char (point-max))
      (when (re-search-backward "</pre>" nil t)
        (delete-region (point-max) (match-beginning 0)))
      ;; wash content by replacing
      (while (> (length replace-rule-list) 0)
        (progn
          (setq replace-rule (pop replace-rule-list))
          (goto-char (point-min))
          (while (re-search-forward (nth 0 replace-rule) nil t)
            (replace-match (nth 1 replace-rule) t))))
      )))

(defun limit-html-content(start-anchor-str end-anchor-str)
  (goto-char (point-min))
  (when (re-search-forward start-anchor-str nil t)
    (delete-region (point-min) (+ (match-beginning 0) (length start-anchor-str))))
  (when (re-search-forward end-anchor-str nil t)
    (delete-region (- (point) (length end-anchor-str))(point-max))))
;; --8<-------------------------- §separator§ ------------------------>8--
(require 'calendar)
(defun retrieve-diary-remind(prefetch-days)
  (let (retrieve-content (old-buffer (current-buffer)))
    (if (null (diary-list-entries (calendar-current-date) prefetch-days nil))
        ""
      (switch-to-buffer "*Fancy Diary Entries*")
      (setq retrieve-content (buffer-substring-no-properties (point-min) (point-max)))
      (holidays)
      (switch-to-buffer "*Holidays*")
      (setq retrieve-content
            (concat retrieve-content "\n----------------\n"
                    (buffer-substring-no-properties (point-min) (point-max))))
      (switch-to-buffer old-buffer)
      ;; wash data
      (setq retrieve-content (replace-regexp-in-string "Org-mode dummy$" "" retrieve-content))
      (setq retrieve-content (replace-regexp-in-string "^=+$" "" retrieve-content))
      (setq retrieve-content (replace-regexp-in-string "\n+" "\n" retrieve-content))
      )))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun retrieve-signature()
  (let (retrieve-content)
    (setq retrieve-content
          (if (fboundp 'get-common-sig-string)
              (get-common-sig-string)
            (with-temp-buffer
              (message-insert-signature)
              (buffer-substring-no-properties (point-min) (point-max))
              ))
          )
    ))
(provide 'emacs-aggregation)
;; File: emacs-aggregation.el ends
