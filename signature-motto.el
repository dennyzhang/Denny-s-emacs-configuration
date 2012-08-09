;; -*- coding: utf-8 -*-
;; File: signature-motto.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-07-30 16:16:27>
;;
;; --8<-------------------------- separator ------------------------>8--
(setq common-tail-signature "Denny Zhang(张巍)
邮箱: markfilebat@126. com
微博: http://weibo.com/1686664253
博客: http://blog.ec-ae.com/")
(defun get-mail-signature ()
  (format "%s\n\n%s" common-tail-signature (generate-mail-signature)))
(defun get-short-mail-signature ()
  (format "%s\n\n%s" "Denny Zhang(张巍)" (generate-mail-signature)))
(defun generate-mail-signature()
  (let* ((signature-string (get-motto))
         cowsay-file
         command-string)
    ;; cowsay doesn't support Unicode in release version
    ;; see http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=254557
    (if (member (detect-coding-string signature-string)
                '((undecided-unix) (undecided)))
        (progn
          (setq cowsay-file (get-random-cowsay ".*.cow"))
          (setq command-string (format "cowthink -f %s \"%s\""
                                       cowsay-file
                                       (decode-coding-string
                                        signature-string (intern
                                                          "utf-8"))
                                       ))
          (format "%s\n\n%s" common-tail-signature
                  (shell-command-to-string command-string)))
      ;; for Unicode like Chinese, just render cowsay with empty content
      (progn
        (with-temp-buffer
          (insert signature-string)
          (goto-char (point-min))
          (fill-paragraph)
          (setq signature-string
                (buffer-substring-no-properties (point-min) (point-max))))
        (setq cowsay-file (get-random-cowsay ".*.txt"))
        (format "%s\n%s" signature-string (org-get-file-contents cowsay-file))
        )
      )))

(defun get-random-cowsay (match)
  (let ((files (directory-files (concat DENNY_CONF "/emacs_conf/cowsay") t match)))
    (nth (random (length files)) files)))

(defun get-all-motto ()
  (let ((old-agenda-files org-agenda-files) signature-list)
    (setq org-agenda-files (list (concat DENNY_CONF "/org_data/org_share/motto.org")))
    (setq signature-list (org-tags-view-list "Motto"))
    (setq org-agenda-files old-agenda-files)
    (setq signature-list signature-list) ;; TODO more graceful way to return value
    ))

(setq motto-list (get-all-motto)) ;; variable to hold all motto

(defun get-motto(&optional max-length)
  (let (signature-string (signature-list motto-list))
    ;; set default threshold
    (if (null max-length) (setq max-length 500))
    ;; remove item longer than max-length
    (setq signature-list
          (remove-if #'(lambda(x) (> (length x) max-length)) signature-list))
    (setq signature-string (random-string signature-list))
    (eval signature-string)
    ))
(defun refresh-signature()
  "auto refresh mail signature"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (if (re-search-forward common-tail-signature nil t)
        (delete-region (- (point) (length common-tail-signature)) (point-max))
      (goto-char (point-max)))
    (insert (get-mail-signature))))
(define-key message-mode-map (kbd "<f5>") 'refresh-signature)
(defun random-string (string-list)
  "get random string from a string-list"
  (let ((rn (random (length string-list))))
    (concat (nth rn string-list) "\n")))

(defun cowsay-quote-region (begin end)
  "Quote a region with a cowsay figure."
  (interactive "r")
  (let ((content (buffer-substring-no-properties begin end)))
    (if (member (detect-coding-string content) '((undecided-unix) (undecided)))
        (progn
          (setq command-string (format "cowthink -f %s -W %d \"%s\""
                                       (get-random-cowsay ".*.cow")
                                       (max-line-length begin end)
                                       content))
          (shell-command command-string))
      (message "Error: don't supported for Unicode characters")
      )))
;; --8<-------------------------- separator ------------------------>8--
;; File: signature-motto.el ends here
