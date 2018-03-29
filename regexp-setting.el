;; -*- coding: utf-8 -*-
;; File: regexp-setting.el
;;
;; Author: Denny(https://www.dennyzhang.com/contact)
;;
;; Copyright 2015, https://DennyZhang.com
;; Created:2012-04-18
;; Updated: Time-stamp: <2018-03-29 09:57:57>
;; --8<-------------------------- separator ------------------------>8--
(set-default 'case-fold-search t);;Make searches case insensitive
;; --8<-------------------------- separator ------------------------>8--
(defun add-isearch-regexp-prefix (search-prefix)
  "Add regexp prefix for regexp searching."
  (progn
    (delete search-prefix regexp-search-ring)
    (setq regexp-search-ring
          (add-to-list 'regexp-search-ring search-prefix))
    (message "regexp search with prefix: %s" search-prefix)
    ))
(defun search-function ()
  "Searching functions for various programming mode."
  (interactive)
  (let ((mode-prefix '(("Python" . "^ *def")
                       ("Erlang" . "^[a-zA-Z]")
                       ("C++/l" . "^[a-zA-Z]")
                       ("Emacs-Lisp" . "^(defun ")
                       ("Lisp" . "^(defun ")
                       ("Shell" . "^function "))))
    (add-isearch-regexp-prefix (assoc-default mode-name mode-prefix))
    ))
(global-set-key (kbd "C-c C-f") 'search-function)
;;(define-key python-mode-map (kbd "C-c C-f") 'search-function)
;; --8<-------------------------- separator ------------------------>8--
(global-set-key (kbd "C-c c") 'beautify-region-by-mode)
(defun beautify-region-by-mode()
  (interactive)
  (save-excursion
    (let (cleanup-replace-rule-list)
      (cond
       ((string-equal mode-name "Org")
        (setq cleanup-replace-rule-list
              '(("\n\n+\\\*" "\n*")
                ("," ",")
                (";" ";")
                ("(" "(")
                (")" ")")
                )))
       ((string-equal mode-name "Ruby")
        (setq cleanup-replace-rule-list
              '(("\n\n+" "\n\n")
                )))
       (t
        (setq cleanup-replace-rule-list
              '(("\n\n+" "\n\n")
                (" +" " ")
                ("," ",")
                (";" ";")
                ("(" "(")
                (")" ")")
                )))
       )
      (clean-up-buffer-or-region cleanup-replace-rule-list)
      )))
(defun beautify-web-quotation ()
  (interactive)
  (when (string= mode-name "Org")
    (save-excursion
      (save-restriction
        (org-narrow-to-subtree)
        (goto-char (point-min))
        (while (re-search-forward "\n" nil t)
          (replace-match "\n\n" nil nil))
        (goto-char (point-min))
        (while (re-search-forward "\n\n" nil t)
          (fill-paragraph))
        (goto-char (point-min))
        (while (re-search-forward "\n\n" nil t)
          (replace-match "\n" nil nil)))
      )
    ))
;; --8<-------------------------- separator ------------------------>8--
;; File: regexp-setting.el ends here
