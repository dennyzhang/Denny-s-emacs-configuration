;; -*- coding: utf-8 -*-
;; File: save-file-hook-setting.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2018-07-01 01:14:39>
;;
;; --8<-------------------------- separator ------------------------>8--
;;Make script files executable automatically
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
;; --8<-------------------------- separator ------------------------>8--
;; evaluate file buffer
;; https://gist.github.com/psstoev/2287777
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (add-hook 'after-save-hook
                      (lambda ()
                        (let (file-name (file-name-nondirectory buffer-file-name))
                          (if (string-prefix-p "wordpress-" file-name)
                              (progn
                                (message "Run eval-buffer for %s" file-name)
                                (eval-buffer))
                            (message "Not matched")
                            )
                          ))
                      )))
;; --8<-------------------------- separator ------------------------>8--
;; File: save-file-hook-setting.el
