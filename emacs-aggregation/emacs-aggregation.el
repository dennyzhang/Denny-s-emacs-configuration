;; -*- mode: EMACS-LISP; coding:utf-8; -*-
;;; ================================================================
;; Copyright © 2010-2011 Time-stamp: <2013-01-08 22:08:09>
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
;; -------------------------- separator --------------------------

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

;; (aggregation-export-to-html "/home/denny/backup/essential/Dropbox/private_data/emacs_stuff/emacs_conf/emacs-aggregation/daily_journal_template.html" "/home/denny/backup/essential/Dropbox/private_data/emacs_stuff/emacs_conf/emacs-aggregation/daily_journal.html")
(defun aggregation-export-to-html (template-file dst-file)
  "aggregate various information to a global view, and export it to a html file"
  (let (retrieve-data-list)
    (setq retrieve-data-list (aggregate-retrieve-data))
    (find-file dst-file)
    (erase-buffer)
    (setq index 1)
    (setq section-template "\n<div class=\"span6\">\n<h2>%s</h2>\n<p>%s</p>\n<p>\n<a class=\"btn\" href=\"#\">View details &raquo;</a></p></div>\n")
    (insert-file-contents template-file)
    ;; replace variable
    (goto-char (point-min))
    (perform-replace "current_time"
                     (format-time-string "%Y-%m-%d %H:%M" (current-time))
                     nil nil nil)
    (goto-char (point-max))
    ;; append tailing content
    (dolist (item retrieve-data-list)
      (unless (or (string= (cdr item) "") (string= (car item) "============="))
        (setq title (car item)
              content (cdr item))
        (setq content (replace-regexp-in-string "\n\n$" "\n" content))
        (setq content (replace-regexp-in-string "\n" "<br/>\n" content))
        (goto-char (point-max))
        (if (evenp index)
            (insert (format section-template title content) "</div><hr>\n")
          (insert "<div class='row-fluid'>" (format section-template title content))
         )
        (setq index (+ index 1))
        )
      )
    (insert "

      <footer>
        <p>&copy; DennyZhang 2012, markfilebat@126.com</p>
      </footer>

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/jquery.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-transition.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-alert.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-modal.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-dropdown.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-scrollspy.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-tab.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-tooltip.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-popover.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-button.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-collapse.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-carousel.js'></script>
    <script src='http://blog.ec-ae.com/wp-content/denny/twitter-bootstrap/docs/assets/js/bootstrap-typeahead.js'></script>

  </body>
</html>
")
    (save-buffer 0)
    (kill-buffer)
    )
  )

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

;; --8<-------------------------- separator ------------------------>8--
(defun retrieve-org-todo-list ()
  (let (retrieve-content)
    (setq retrieve-content "")
    )
  )
;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
(defun retrieve-html-content (url start-anchor-str end-anchor-str)
  (let (retrieve-content)
    (with-temp-buffer
      (url-insert-file-contents url)
      (wash-html-content)
      (limit-html-content start-anchor-str end-anchor-str)
      (setq retrieve-content (buffer-substring-no-properties (point-min) (point-max)))
      (setq retrieve-content (replace-regexp-in-string " *:[^ ]+$" "" retrieve-content))
      (setq retrieve-content (replace-regexp-in-string "\n+" "\n" retrieve-content))
      ;; remove the blank line at the end
      (setq retrieve-content (replace-regexp-in-string "\n\'" "" retrieve-content))
      )))

(defun wash-html-content ()
  "Wash content by remove or replace useless characters"
  (let ((replace-rule-list
         '(("<[^>]+>" "") ("&nbsp;" " ")
           ("\r" "") (" +$" "") ("^$\r" "\r")
           (" +" " ")
           ("\t+" " ")
           ("     +" " ")
           ("^ +" "")
           ("\n+" "\n")
           )))
    (goto-char (point-min))
    (let ((case-fold-search t) replace-rule)
      ;; limit content
      ;; (when (re-search-forward "</form>" nil t)
      ;; (delete-region (point-min) (match-beginning 0)))
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
;; --8<-------------------------- separator ------------------------>8--
(defun list-nex-month-holiday ()
  (interactive)
  (let*
      ((now-date (calendar-current-date))
       (displayed-year (calendar-extract-year now-date))
       (displayed-month (calendar-extract-month now-date))
       (now-month displayed-month)
       (now-year displayed-year)
       (now-day (calendar-extract-day now-date))
       (next-month displayed-month)
       (holiday-list (calendar-list-holidays))
       (res '())
       )
    (calendar-increment-month next-month now-year 1)
    (reverse
     (dolist (var holiday-list res)
       (let ((date (car var)))
         (when (and (calendar-date-compare (list date) (list (list next-month now-day now-year)))
                    (calendar-date-compare (list now-date) (list date)))
           (add-to-list 'res var)
           ))))
    ))

(require 'calendar)
(defun retrieve-diary-remind(prefetch-days)
  (let ((retrieve-content "") (old-buffer (current-buffer)))
    (if (null (diary-list-entries (calendar-current-date) prefetch-days nil))
        ""
      ;; diary
      (switch-to-buffer "*Fancy Diary Entries*")
      (setq retrieve-content (format "%s\n%s\n"
                                     retrieve-content
                                     (buffer-substring-no-properties (point-min) (point-max))))
      (setq retrieve-content (replace-regexp-in-string "\n=======+\n" "" retrieve-content))
      (setq retrieve-content (replace-regexp-in-string "\n+" "\n" retrieve-content))

      ;; holiday
      (dolist (var (list-nex-month-holiday))
        (let* ((date (car var))
               (holiday-name (car (cdr var))))
          (setq retrieve-content (format "%s\n%s-%s-%s %s"
                                         retrieve-content
                                         (calendar-extract-year date)
                                         (calendar-extract-month date)
                                         (calendar-extract-day date)
                                         holiday-name))
          ))
      ;; wash data
      (setq retrieve-content (replace-regexp-in-string "Org-mode dummy$" "" retrieve-content))
      (setq retrieve-content (replace-regexp-in-string "\n\n+" "\n\n" retrieve-content))
      )))
;; --8<-------------------------- separator ------------------------>8--
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
