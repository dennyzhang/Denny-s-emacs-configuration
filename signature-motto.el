;; -*- coding: utf-8 -*-
;; File: signature-motto.el
;;
;; Author: Denny Zhang(filebat.mark@gmail.com)
;; Copyright 2015, http://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2016-02-04 22:49:54>
;;
;; --8<-------------------------- separator ------------------------>8--
(setq common-tail-signature "Denny Zhang(张巍)
Email: denny.zhang001@gmail.com
Website: http://www.dennyzhang.com/")
(defun get-mail-signature ()
  (format "%s\n\n%s" common-tail-signature (generate-mail-signature)))
(defun get-short-mail-signature ()
  (format "%s\n\n%s" "Denny Zhang(张巍)" (generate-mail-signature)))

(defun generate-mail-signature()
  (let* (signature-string cowsay-file command-string)
    (if (member mode-name '("Message" "Article"))
        ;; if in the buffer of sending mail, conditionally pick English motto
        (save-excursion
          (goto-char (point-min))
          (if (search-forward-regexp
               "From: .*\\(@shopex.cn\\|@qq.com\\|@163.com\\|@126.com\\)"
               nil t )
              (setq signature-string (get-motto))
            ;; only English motto
            (setq signature-string (get-motto 't)))
          )
      (setq signature-string (get-motto)))
    ;; cowsay doesn't support Unicode in release version
    ;; see http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=254557
    (if (and (member (detect-coding-string signature-string)
                '((undecided-unix) (undecided)))
             (unless (null (executable-find "cowthink"))))
        (progn
          (setq cowsay-file (get-random-cowsay ".*.cow"))
          (setq command-string (format "cowthink -f %s \"%s\""
                                       cowsay-file
                                       (decode-coding-string
                                        signature-string (intern
                                                          "utf-8"))
                                       ))
          (format "%s" (shell-command-to-string command-string)))
      ;; for Unicode like Chinese, just render cowsay with empty content
      (progn
        (with-temp-buffer
          (insert signature-string)
          (goto-char (point-min))
          (fill-paragraph)
          (setq signature-string
                (buffer-substring-no-properties (point-min) (point-max))))
        (setq cowsay-file (get-random-cowsay ".*.txt"))
        (format "%s\n%s" signature-string 
                (with-temp-buffer
                  (insert-file-contents cowsay-file)
                  (buffer-string)))
        )
      )
    ))

(defun get-random-cowsay (match)
  (let ((files (directory-files (concat DENNY_CONF "/emacs_conf/cowsay") t match)))
    (nth (random (length files)) files)))

(defun get-all-motto ()
  (let ((old-agenda-files org-agenda-files) signature-list)
    (setq org-agenda-files (list (concat DENNY_CONF "/org_data/life/motto.org")))
    (setq signature-list (org-tags-view-list "Motto"))
    (setq org-agenda-files old-agenda-files)
    (setq signature-list signature-list) ;; TODO more graceful way to return value
    ))

(setq motto-list (get-all-motto)) ;; variable to hold all motto

(defun get-motto(&optional englishp &optional max-length)
  (let (signature-string (signature-list motto-list))
    (if (null englishp) (setq englishp nil))
    (if (null max-length) (setq max-length 500))
    ;; remove item longer than max-length
    (setq signature-list
          (remove-if #'(lambda(x) (> (length x) max-length)) signature-list))
    ;; remove item for non-English
    (if englishp
      (setq signature-list
            (remove-if #'(lambda(x)
                           (not (equal '(undecided)
                                       (detect-coding-string x)))) signature-list)))
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
