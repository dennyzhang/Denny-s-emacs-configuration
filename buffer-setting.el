;; -*- coding: utf-8 -*-
;; File: buffer-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-04-27 11:51:37>
;;
;; --8<-------------------------- separator ------------------------>8--
(defun next-user-buffer ()
  "Switch to the next user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(defun next-emacs-buffer ()
  "Switch to the next emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-emacs-buffer ()
  "Switch to the previous emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(global-set-key (kbd "<C-tab>") 'previous-user-buffer) ; Ctrl+Tab
(global-set-key (kbd "<C-S-iso-lefttab>") 'next-user-buffer) ; Ctrl+Shift+Tab
(global-set-key (kbd "<C-S-prior>") 'previous-emacs-buffer) ; Ctrl+Shift+PageUp
(global-set-key (kbd "<C-S-next>") 'next-emacs-buffer) ; Ctrl+Shift+PageDown
;; --8<-------------------------- separator ------------------------>8--
;; Remember buffer positions per-window, not per buffer
(load-file (concat EMACS_VENDOR "/winpoint/winpoint.el"))
(winpoint-mode t)
;; --8<-------------------------- separator ------------------------>8--
;;alt+p k: kill all other buffers except current buffer
;; TODO: more elegant way to do this
(global-set-key [(meta p)(k)] 'kill-other-buffers)
(defun kill-other-buffers (&optional arg)
  (interactive "P")
  (let ((curbuf (buffer-name))
        (buflist (mapcar (function buffer-name) (buffer-list))))
    (dolist (buf buflist)
      (unless (string= curbuf buf) (kill-buffer buf))
      ))
  )
;; --8<-------------------------- separator ------------------------>8--
;; TODO enhance this
(defun widen-all-buffers ()
  "If some buffer are in narrow status, emacs may fail to exit
Thus widen each buffer, before emacs exit"
  (interactive)
  (dolist (buffer (buffer-list))
    (switch-to-buffer buffer)
    (widen)
    ))
(add-hook 'kill-emacs-hook 'widen-all-buffers)
;; --8<-------------------------- separator ------------------------>8--
;; File: buffer-setting.el ends here
