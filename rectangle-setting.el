;; -*- coding: utf-8 -*-
;; File: rectangle-setting.el
;;
;; Author: Denny Zhang(filebat.mark@gmail.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2013-09-09 14:01:37>
;;
;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
(defun boxquote-rectangle (b e)
  "Draw a box comment around the region but arrange for the region
to extend to at least the fill column. Place the point after the
comment box."
  (interactive "r")
  (let ((e (copy-marker e t)))
    (if (null comment-start) (setq comment-start "#"))
    (goto-char b)
    (end-of-line)
    (insert-char ? (- fill-column (current-column)))
    (comment-box b e 1)
    (goto-char e)
    (set-marker e nil)))
;; --8<-------------------------- separator ------------------------>8--
;; File: rectangle-setting.el ends here
