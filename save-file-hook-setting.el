;; -*- coding: utf-8 -*-
;; File: save-file-hook-setting.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2018-07-08 00:14:06>
;;
;; --8<-------------------------- separator ------------------------>8--
;;Make script files executable automatically
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
;; --8<-------------------------- separator ------------------------>8--
;; evaluate file buffer
;; https://gist.github.com/psstoev/2287777
(defun save_wordpres_elisp ()
  (let ((current-file-name (file-name-nondirectory buffer-file-name)))
    (if (string-prefix-p "wordpress-" current-file-name)
        (progn
          (message "Run eval-buffer: %s" current-file-name)
          (eval-buffer)
          )
      )))

(defun save_golang_file ()
  (let ((current-file-name (file-name-nondirectory buffer-file-name)))
    (progn
      (message "golangci-lint run %s" current-file-name)
      ;; TODO: enable this
      ;; (shell-command (format "/usr/local/Cellar/go/1.10.3/bin/golangci-lint run %s" buffer-file-name))
      ;; https://stackoverflow.com/questions/4858975/in-emacs-lisp-what-is-the-correct-way-to-use-call-process-on-an-ls-command
      ;; (call-process "/usr/local/Cellar/go/1.10.3/bin/golangci-lint" nil t nil "run" buffer-file-name)
    )))

(add-hook 'after-save-hook
          (lambda ()
            (if (stringp mode-name)
                (cond
                 ((string= mode-name "Emacs-Lisp")
                  (save_wordpres_elisp))
                 ((string= mode-name "Go")
                  (save_golang_file))
                 )
              )
            ))
;; --8<-------------------------- separator ------------------------>8--
;; File: save-file-hook-setting.el
