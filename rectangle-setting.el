;; -*- coding: utf-8 -*-
;; File: rectangle-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-04-22 14:25:47>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
(define-key ctl-x-map "r\C-x" 'rm-kill-clean-region)
(define-key ctl-x-map "r\C-y" 'yank-rectangle-in-place)
(define-key ctl-x-map "r\C-m" 'mark-rectangle)
(defun mark-rectangle ()
  "Automatically mark a rectangle, when cursor is in the left corner"
  (interactive)
  (let ((rectangle-corner-ch "\+")
        (rectangle-vertical-ch "\|")
        column-num
        (start-point nil) (end-point nil))
    (when (search-forward-regexp rectangle-corner-ch nil t)
      (setq start-point (- (point) 1))
      ;; (search-forward-regexp "\\+ \\|\n" nil t)
      (when (search-forward-regexp
             (format "%s \\|\n" (regexp-quote rectangle-corner-ch)) nil t)
        (forward-char -2)
        (setq column-num (current-column))
        (forward-line 1)
        (forward-char column-num))
      ;; keep going downstair
      (while (= (char-after) (string-to-char rectangle-vertical-ch))
        (forward-line 1)
        (forward-char column-num))
      (if (= (char-after) (string-to-char rectangle-corner-ch))
          (setq end-point (+ (point) 1)))
      ;; mark the rectangle, if it's found
      (when (and start-point end-point)
        ;; (rm-deactivate-mark)
        (goto-char start-point)
        (rm-set-mark t)
        (goto-char end-point)
        (rm-exchange-point-and-mark t))
      )))

(defun rm-kill-clean-region (start end)
  "Cut a rectangle and clear the region
Like rm-kill-region except the rectangle is also cleared."
  (interactive "r")
  (rm-kill-ring-save start end)
  (clear-rectangle start end)
  (and (interactive-p)
       rm-mark-active
       (rm-deactivate-mark)))

(defun yank-rectangle-in-place ()
  "Like yank-rectangle except the change is
taken in place with no new characters created."
  (interactive)
  (let ((start (point)) end
        (start-column (current-column)) end-column
        rectangle-width
        kill-start kill-end)
    ;; yank rectangle
    (yank-rectangle)
    (setq end (point)
          end-column (current-column))
    (setq rectangle-width (- end-column start-column))
    ;; make sure this line has enough characters
    (save-excursion
      (move-end-of-line nil)
      (insert (list-to-string (make-list rectangle-width " "))))
    ;; remove useless rectangle, without saving
    (forward-char rectangle-width)
    (setq kill-end (point))
    (goto-char start)
    (forward-char rectangle-width)
    (setq kill-start (point))
    (delete-rectangle kill-start kill-end)))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: rectangle-setting.el ends here
