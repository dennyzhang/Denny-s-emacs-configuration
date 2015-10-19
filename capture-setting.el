;; -*- coding: utf-8 -*-
;; File: capture-setting.el -- easily capture and beautify various
;; information to knowledgebase of emacs org-mode
;;
;; Author: Denny Zhang(filebat.mark@gmail.com)
;; Copyright 2015, http://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2015-05-06 11:06:46>
;;
;; --8<-------------------------- separator ------------------------>8--
(require 'org-capture)
(define-key global-map "\C-cr" 'org-capture)
(setq org-capture-templates
      '(("m" "Mail" entry (file "current.org") (function capture-gnus-template))
        ("f" "Film" entry (file+headline "life.org" "Film -- 电影") "** TODO %?\n")
        ("w" "Web" entry (file "current.org") (function capture-w3m-template))
        ("s" "Shopping" entry (file+headline "life/life.org" "Shopping list")
         "** %?")
        ("l" "learn" entry (file "learn.org")
         "** %?")
        ("e" "English" entry (file+headline "life/english.org" "每日英文")
         "** %?")

        ("c" "Communicate" entry (file+headline "current.org" "Communicate")
         "** %?")
        ("i" "Myself postmortem" entry (file+headline "current.org" "iPostmortem")
         "** %<%Y-%m-%d>: %?")
        ("r" "Reading" entry (file+headline "life.org" "Reading -- 阅读")
         "** %?")
        ("t" "Talk" entry (file+headline "org_share/linux.org" "Questions I'm expecting discussion")
          (function capture-talk-template))
        ("d" "Diary" entry (file+headline "life/contacts.org"
                                               "Daily Journal -- 工作日志")
         "** %<%Y-%m-%d>: %?")

        ("h" "health" entry (file+headline "life/life.org" "Family Health")
         "** %<%Y-%m-%d>: %?")

        ("p" "Period" table-line
         (file+headline "life/contacts.org" "秀秀--周期")
         "| |%<%Y-%m-%d>|\n" :table-line-pos "I+1")
        ;;("r" "Read" entry (file+headline "life.org" "Book -- 阅读") "** TODO %?\n")

        ("j" "Job" entry (file+headline "top.org"
                                               "Continuous progress -- for job hunting")
         "** %<%Y-%m-%d>: %?")
        ))

(defun capture-talk-template ()
  (if (string= mode-name "Article")
      (progn
        (setq content (buffer-string))
        (setq content (replace-regexp-in-string "\n+$" "\n" content))
        ;; disable template substitution of org-capture, like %A, %t, etc
        (setq content (replace-regexp-in-string "%\\([a-zA-Z]\\)" "% \\1" content))
        (concat "** %<%Y-%m-%d>: [%?\n*** TODO mail: %:subject "
                (make-string 10 32) ":noexport:\n"
                "%a\n"
                "#+begin_example\n" content "\n#+end_example"))
    (setq content "** %<%Y-%m-%d>: [%?"))
  )

(defun capture-gnus-template ()
  ;; "* %t %:subject :noexport:\n %s\n%?\n\n"
  (let ((content (buffer-string)))
    (setq content (replace-regexp-in-string "\n+$" "\n" content))
    ;; disable template substitution of org-capture, like %A, %t, etc
    (setq content (replace-regexp-in-string "%\\([a-zA-Z]\\)" "% \\1" content))
    (concat "* TODO mail: %:subject "
            (make-string 10 32) ":noexport:\n"
            "%a\n"
            "#+begin_example\n" content "\n#+end_example"))
  )

(defun capture-w3m-template ()
  (let ((content (buffer-string)))
    (setq content (replace-regexp-in-string "\n+$" "\n" content))
    (setq content (replace-regexp-in-string "^\* " "# " content))
    ;; disable template substitution of org-capture, like %A, %t, etc
    (setq content (replace-regexp-in-string "%\\([a-zA-Z]\\)" "% \\1" content))
    (concat "* web page: " w3m-current-title (make-string 10 32) "\n"
            w3m-current-url "\n"
            "** webcontent " (make-string 20 32)
            ":noexport:\n#+begin_example\n" content "\n#+end_example"))
  )
;; --8<-------------------------- separator ------------------------>8--
;; File: capture-setting.el ends here
