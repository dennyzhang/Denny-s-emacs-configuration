;; -*- coding: utf-8 -*-
;; File: diff-setting.el
;;
;; Author: Denny(https://www.dennyzhang.com/contact)
;;
;; Copyright 2015, https://DennyZhang.com
;; Created:2012-04-22
;; Updated: Time-stamp: <2018-03-29 09:57:58>
;; --8<-------------------------- separator ------------------------>8--
;; compare vertically in ediff
(require 'ediff)
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-merge-split-window-function 'split-window-horizontally)
;; do everything in one frame, instead of multiframe
(setq ediff-window-setup-function (quote ediff-setup-windows-plain))
;; when comparing, ignore all white space, and output the unified context
(setq diff-switches "-u -w")
(setq diff-default-read-only t)
;; set face coloring
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))
;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/magit"))
;;(require 'magit)
;;(eval-after-load 'magit
;;  '(progn
;;     (autoload 'mo-git-blame-file "mo-git-blame" nil t)
;;     (autoload 'mo-git-blame-current "mo-git-blame" nil t)
;;     (setq magit-diff-options "-w") ;; when comparing, ignore all white space
;;     ))

;; set face coloring
(eval-after-load 'magit
  '(progn
     (custom-set-faces
      '(magit-diff-add
        ((t (:foreground "lime green"))))
      '(magit-diff-del
        ((t (:foreground "tomato"))))
      ;; '(magit-item-highlight ((t (:background "gray25"))))
      '(magit-log-head-label-patches
        ((t (:background "DarkGoldenrod1" :foreground "DarkOrange4" :box 1))))
      '(magit-log-tag-label
        ((t (:background "blue violet")))))
     ))
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "white"))))

(defun git-commit-changes ()
  (start-process "*git commit*" nil "git" "commit" "-a" "-m" "changes"))

;; TODO
;; when diff-mode, set buffers readonly
;;(add-hook 'diff-mode-hook (lambda () (view-mode)))
;;(define-key view-mode-map "j" 'ido-dired)
;;(define-key view-mode-map "n" 'scroll-up-command)
;;(define-key view-mode-map "p" 'scroll-down-command)
;; --8<-------------------------- separator ------------------------>8--
(defun ediff-sequent-lines ()
  "Compare two sequent lines in the same buffer, by calling ediff-regions-internal"
  (interactive)
  (let ((fc (current-frame-configuration)))
    (eval
     `(defun rfc ()
        (set-frame-configuration ',fc)
        (remove-hook 'ediff-after-quit-hook-internal 'rfc)))
    (add-hook 'ediff-after-quit-hook-internal 'rfc)
    (ediff-regions-internal
     (current-buffer) (line-beginning-position) (line-end-position)
     (current-buffer) (line-beginning-position 2) (line-end-position 2)
     nil 'ediff-windows-wordwise 'word-mode nil)))
;; --8<-------------------------- separator ------------------------>8--
(defun keep-mine ()
  (interactive)
  (beginning-of-line)
  (assert (or (looking-at "<<<<<<")
              (re-search-backward "^<<<<<<" nil t)
              (re-search-forward "^<<<<<<" nil t)))
  (goto-char (match-beginning 0))
  (let ((beg (point))
        (hashes (re-search-forward "^#######" (+ (point) 10000) t)))
    (forward-line)
    (delete-region beg (point))
    (re-search-forward (if hashes "^>>>>>>>" "^======="))
    (setq beg (match-beginning 0))
    (re-search-forward (if hashes "^=======" "^>>>>>>>"))
    (forward-line)
    (delete-region beg (point))))

(defun keep-theirs ()
  (interactive)
  (beginning-of-line)
  (assert (or (looking-at "<<<<<<")
              (re-search-backward "^<<<<<<" nil t)
              (re-search-forward "^<<<<<<" nil t)))
  (goto-char (match-beginning 0))
  (let ((beg (point))
        (hashes (re-search-forward "^#######" (+ (point) 10000) t)))
    (re-search-forward (if hashes "^>>>>>>>" "^======="))
    (forward-line)
    (delete-region beg (point))
    (re-search-forward (if hashes "^#######" "^>>>>>>>"))
    (beginning-of-line)
    (setq beg (point))
    (when hashes
      (re-search-forward "^=======")
      (beginning-of-line))
    (forward-line)
    (delete-region beg (point))))

(defun keep-both ()
  (interactive)
  (beginning-of-line)
  (assert (or (looking-at "<<<<<<")
              (re-search-backward "^<<<<<<" nil t)
              (re-search-forward "^<<<<<<" nil t)))
  (beginning-of-line)
  (let ((beg (point)))
    (forward-line)
    (delete-region beg (point))
    (re-search-forward "^>>>>>>>")
    (beginning-of-line)
    (setq beg (point))
    (forward-line)
    (delete-region beg (point))
    (re-search-forward "^#######")
    (beginning-of-line)
    (setq beg (point))
    (re-search-forward "^=======")
    (beginning-of-line)
    (forward-line)
    (delete-region beg (point))))
;; --8<-------------------------- separator ------------------------>8--
;; File: diff-setting.el ends here
