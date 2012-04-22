;; -*- coding: utf-8 -*-
;; File: signature-motto.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-04-22 14:25:21>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat DENNY_CONF "/emacs_conf/signature-ascii-picture.el"))
(setq common-tail-signature "Denny Zhang(张巍)
电话: 18621908421
邮箱: markfilebat@126.com
微博: http://weibo.com/1686664253
博客: https://github.com/DennyZhang
团队: http://blog.ec-ae.com/")
(defun get-motto()
  (let (signature-string (old-agenda-files org-agenda-files))
    ;;(make-variable-buffer-local 'org-agenda-files)
    (setq org-agenda-files (list (concat DENNY_CONF "/org_data/org_share/motto.org")))
    (setq signature-string (random-string (org-tags-view-list "Motto")))
    (with-temp-buffer
      (insert signature-string)
      (goto-char (point-min))
      (fill-paragraph)
      (setq signature-string (buffer-substring-no-properties (point-min) (point-max))))
    (setq org-agenda-files old-agenda-files)
    (concat common-tail-signature "\n\n" signature-string
            (random-string sign-ascii-picture))
    ))
(defun refresh-signature()
  "auto refresh mail signature"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (if (re-search-forward common-tail-signature nil t)
        (delete-region (- (point) (length common-tail-signature)) (point-max))
      (goto-char (point-max)))
    (insert (get-motto))))
(define-key message-mode-map (kbd "<f5>") 'refresh-signature)
(defun random-string (string-list)
  "get random string from a string-list"
  (let ((rn (random (length string-list))))
    (concat (nth rn string-list) "\n")))
;; (org-tags-view-list "Motto" '("Attitude"))
;; (org-tags-view-list "Attitude")
(defun org-tags-view-list (tag-name &optional filter-tag-list)
  (let (retrieve-content entry-list (orig-buffer (current-buffer)))
    (save-excursion
      (org-tags-view nil tag-name)
      (goto-char (point-min))
      (forward-line 2)
      ;; obtain and wash data
      (setq retrieve-content
            (buffer-substring-no-properties (point) (point-max)))
      (setq retrieve-content
            (replace-regexp-in-string "^ [^:]+: +" "" retrieve-content))
      (setq entry-list (split-string retrieve-content "\n"))
      ;; restore cursor location
      (kill-buffer org-agenda-buffer-name)
      (switch-to-buffer orig-buffer)
      (delete-other-windows)
      ;;(kill-buffer)
      ;; exclude entries of given tag list
      (dolist (filter-tag filter-tag-list)
        (setq entry-list
              (delq nil
                    (mapcar #'(lambda (x)
                                (if (string-match (format ":%s" filter-tag) x)
                                    nil x))
                            entry-list))))
      ;; remove tags from entry
      (setq entry-list
            (mapcar #'(lambda (x) (replace-regexp-in-string " *:[^ ]+$" "" x))
                    entry-list))
      ;; limit too short entry
      (setq entry-list
            (delq nil (mapcar #'(lambda (x)
                                  (if (> (length x ) 15)
                                      x nil))
                              entry-list)))
      )))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: signature-motto.el ends here
