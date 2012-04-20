;; -*- coding: utf-8 -*-
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; File: magic-setting.el
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-04-20 10:08:15>
;; --8<-------------------------- §separator§ ------------------------>8--
(defun show-interest ()
  "Show interesting information for my daily life.
These information is probably retrieved from internet. "
  (interactive)
  (cn-weather-today)
  (cn-weather-forecast)
  )

;;M-p i: show interesting information for current file or directory
;;C-u M-p i: show short file name of current buffer
(define-key global-map (kbd "M-p i") 'show-magic-info)
(define-key comint-mode-map (kbd "M-p") 'show-magic-info)
(defun show-magic-info(show-short-info-p)
  "show interesting information for current file or directory
 - If current position is dired, show lines counts for misc programming lanuages.
 - If current position is a file, show file name and line counts
 - If current position is in *w3m*, show current web title
 - If current positioin is in Article mail mode, show the url under current cursor
 If show-short-info-p is not null, the default behaviour is showing the short filename with extension removed.
 "
  (interactive "P")
  (let ((output_str buffer-file-name))
    (if (and output_str show-short-info-p)
        (setq output_str (file-name-sans-extension (file-name-nondirectory output_str))))
    (cond
     ((string-equal mode-name "w3m") (setq output_str (w3m-current-title)))
     ((string-match "Dired" mode-name)
      (setq output_str (count-code-lines-in-directory default-directory)))
     ((string-equal mode-name "Article") (setq output_str (w3m-print-this-url)))
     (t (if (null output_str) (setq output_str (buffer-name))))
     )
    (when output_str
      ;; display the result
      (message output_str)
      ;; send the result to kill-string
      (kill-new output_str))
    ))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: handyfunction-setting.el ends here
