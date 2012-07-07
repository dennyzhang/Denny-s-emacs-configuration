;; -*- coding: utf-8 -*-
;; File: capture-setting.el -- easily capture and beautify various
;; information to knowledgebase of emacs org-mode
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-07-07 22:05:59>
;;
;; --8<-------------------------- separator ------------------------>8--
(require 'org-capture)
(define-key global-map "\C-cr" 'org-capture)
(setq org-capture-templates
      '(("d" "Diary" entry (file "diary.org") "* %T %?\n\n")
        ("m" "Mail" entry (file "current.org") (function capture-gnus-template))
        ("w" "Web" entry (file "current.org") (function capture-w3m-template))
        ("p" "Period" table-line (file+headline "contacts.org" "秀秀--周期") "| |%<%Y-%m-%d>|\n")
        ("c" "Contacts" entry (file "contacts.org")
         "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:")
        ))

(defun capture-gnus-template ()
  ;; "* %t %:subject :noexport:\n %s\n%?\n\n"
  (let ((content (buffer-string)))
    (setq content (replace-regexp-in-string "\n+$" "\n" content))
    (concat "* TODO mail: %:subject "
            (make-string 10 32) ":noexport:\n"
            "%a\n"
            "#+begin_example\n" content "\n#+end_example"))
  )

(defun capture-w3m-template ()
  (let ((content (buffer-string)))
    (setq content (replace-regexp-in-string "\n+$" "\n" content))
    (concat "* web page: " w3m-current-title (make-string 10 32) "\n"
            w3m-current-url "\n"
            "** webcontent " (make-string 20 32) ":noexport:\n#+begin_example\n" content "\n#+end_example"))
  )
;; --8<-------------------------- separator ------------------------>8--
;; File: capture-setting.el ends here
