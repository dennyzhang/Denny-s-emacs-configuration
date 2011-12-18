;; -*- coding: utf-8 -*-
;; File: voice-setting.el --- screen reader, voice commander
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2011-10-30 21:35:35>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat CONTRIBUTOR_CONF "/festival/festival.el"))
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
(global-set-key [(control c) (r)] 'festival-read)
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: voice-setting.el ends here