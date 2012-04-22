;; -*- coding: utf-8 -*-
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; File: diff-setting.el
;; Created: 2012-04-22
;; Updated: Time-stamp: <2012-04-22 14:51:36>
;; --8<-------------------------- §separator§ ------------------------>8--
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
;; --8<-------------------------- §separator§ ------------------------>8--
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
;; --8<-------------------------- §separator§ ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/magit"))
(require 'magit)
(eval-after-load 'magit
  '(progn
     (autoload 'mo-git-blame-file "mo-git-blame" nil t)
     (autoload 'mo-git-blame-current "mo-git-blame" nil t)
     (setq magit-diff-options "-w") ;; when comparing, ignore all white space
     ))
;; set face coloring
(eval-after-load 'magit
  '(progn
     (custom-set-faces
      '(magit-diff-add
        ((t (:foreground "lime green"))))
      '(magit-diff-del
        ((t (:foreground "tomato"))))
      ;; '(magit-item-highlight ((t (:background "gray25"))))
      `(magit-item-highlight
        ((t (:background ,(adjust-color (face-attribute 'default :background) 3)))))
      '(magit-log-head-label-patches
        ((t (:background "DarkGoldenrod1" :foreground "DarkOrange4" :box 1))))
      '(magit-log-tag-label
        ((t (:background "blue violet")))))
     (def-k-s magit-mode-map
       "M-4" delete-window
       "M-1" delete-other-windows
       "M-2" split-window-vertically
       "M-3" split-window-horizontally
       "M-0" other-window "M-o" other-window
       "1" magit-show-level-1-all
       "2" magit-show-level-2-all
       "3" magit-show-level-3-all
       "4" magit-show-level-4-all
       "C-1" magit-show-level-1
       "C-2" magit-show-level-2
       "C-3" magit-show-level-3
       "C-4" magit-show-level-4
       )
     ))
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "white"))))

;; when diff-mode, set buffers readonly
(add-hook 'diff-mode-hook (lambda () (view-mode)))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: diff-setting.el ends here
