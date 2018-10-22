;; -*- coding: utf-8 -*-
;; File: capture-setting.el -- easily capture and beautify various
;; information to knowledgebase of emacs org-mode
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2018-10-01 17:03:13>
;;
;; --8<-------------------------- separator ------------------------>8--
(require 'org-capture)
(define-key global-map "\C-cr" 'org-capture)
(setq org-capture-templates
      '(("m" "Mail" entry (file "current.org") (function capture-gnus-template))
        ("d" "Diary" entry (file+headline "~/Dropbox/git_code/www.dennyzhang.com/life/today-learning/README.org" "Latest")
         "** [Denny Today] %<%Y-%m-%d>, Palo Alto, CA
#+BEGIN_EXAMPLE
%?
#+END_EXAMPLE
")
        ("w" "Web" entry (file "current.org") (function capture-w3m-template))
        ("l" "learn" entry (file "life/learn.org")
         "** %?")
        ("e" "English" entry (file+headline "life/english.org" "每日英文")
         "** %?")
        ("c" "Communicate" entry (file+headline "current.org" "Communicate")
         "** %?")
        ("i" "Myself postmortem" entry (file+headline "current.org" "iPostmortem")
         "** %<%Y-%m-%d>: %?")
        ("r" "Reading" entry (file+headline "life.org" "Reading -- 阅读")
         "** %?")
        ("h" "health" entry (file+headline "life/life.org" "Family Health")
         "** %<%Y-%m-%d>: %?")

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
