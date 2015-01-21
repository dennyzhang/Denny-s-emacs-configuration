;; -*- coding: utf-8 -*-
;; File: voice-setting.el --- screen reader, voice commander
;;
;; Author: Denny(denny.zhang001@gmail.com)
;;
;; Copyright 2015, http://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2015-01-21 11:03:45>
;;
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/festival/festival.el"))
(require 'festival)
(defun festival-read()
  "If region is selected, read region. Otherwise read current word."
  (interactive)
  (if (region-active-p)
      (festival-read-region (region-beginning) (region-end))
    (progn
     (let ((word (thing-at-point 'word)))
       (festival-say word)
       (message "Read: %s" word)))
    ))
;; --8<-------------------------- separator ------------------------>8--
;; File: voice-setting.el ends here
