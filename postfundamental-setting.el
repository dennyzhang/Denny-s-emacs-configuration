;; -*- coding: utf-8 -*-
;; File: postfundamental-setting.el --- fundamental setting as the last step, for all emacs configurations
;;
;; Author: Denny(denny.zhang001@gmail.com)
;;
;; Copyright 2015, http://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2016-05-14 14:38:15>
;;
;; --8<-------------------------- separator ------------------------>8--
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
;; --8<-------------------------- separator ------------------------>8--
;;diary
(global-set-key [f4] 'calendar)
(setq diary-file (concat DENNY_EMACS "emacs_data/filebat.diary"))
(display-time)
(require 'appt)
(add-hook 'diary-hook 'appt-make-list)
;;Generate the diary window for 2 days starting with the current date.
(diary)
;; --8<-------------------------- separator ------------------------>8--
(global-set-key "\M-." 'smart-locate)
(defun smart-locate ()
  "Smart locate files.
 - If current position is org-mode file, call occur-org-title,
 which only search in titles of org-mode entires.
 - If current position has no words, call my-find-name-dired, which is somewhat find-name-dired.
 - Otherwise, call etags-select-find-tag.
"
  (interactive)
  (if (string-equal mode-name "Org")
      (occur-org-title)
    (let ((bounds (bounds-of-thing-at-point 'word)))
      (if (null bounds)
          (my-find-name-dired)
        (etags-select-find-tag)
        ))
    ))

(defun my-find-name-dired ()
  (interactive)
  (let (pattern)
    (setq pattern (read-shell-command "Find-name (filename wildcard): " nil nil))
    (find-dired default-directory
                (concat find-name-arg " " (shell-quote-argument pattern)))
    ))

(defun occur-org-title()
  "when regexp search, only search title of org-mode entries"
  (interactive)
  (let (regexp)
    (setq regexp
          (read-string "Search org entries whose title matching regexp: " "^\\\*+ .*"))
    (occur-1 regexp 0 (list (current-buffer)))))
;; --8<-------------------------- separator ------------------------>8--
;;(set-language-environment 'Chinese-GB)
;;(set-keyboard-coding-system 'chinese-iso-8bit-unix)
;; --8<-------------------------- separator ------------------------>8--
;; (set-buffer-file-coding-system 'utf-8)
;; (setq safe-local-variable-values
;; '(
;; (encoding . utf-8)
;; (encoding . utf-8-unix)
;; (encoding . utf-8-emacs-UNIX)
;; ))
;; --8<-------------------------- separator ------------------------>
(add-hook 'flyspell-prog-mode-hook
          #'(lambda ()
              (define-key flyspell-mode-map [(control ?\.)]
                'grep-find-with-querystring-quoted)))
;; --8<-------------------------- separator ------------------------>8--
;; File: postfundamental-setting.el ends here
