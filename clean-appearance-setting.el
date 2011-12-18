;; -*- coding: utf-8 -*-
;; File: clean-appearance-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2011-12-09 10:52:59>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
(set-face-background 'modeline "#5f9ea0") ;; set color of modeline
(set-face-attribute 'mode-line nil :height 100)
(defun toggle-mode-line ()
  "toggles the modeline on and off"
  (interactive)
  (let ((normal-height 100) (minimum-height 1))
    (if (= normal-height (face-attribute 'mode-line :height))
        (set-face-attribute 'mode-line nil :height minimum-height)
        (set-face-attribute 'mode-line nil :height normal-height))))
(global-set-key [M-f12] 'toggle-mode-line)
;; --8<-------------------------- §separator§ ------------------------>8--
(mouse-avoidance-mode 'animate)
(mouse-wheel-mode);; enable mouse wheel support
;; --8<-------------------------- §separator§ ------------------------>8--
;; let's have a clean world
(progn
  (set-scroll-bar-mode 'right) ;;scroll bar
  (tool-bar-mode -1) ;;Hide toolbar
  (menu-bar-mode -1) ;;Hide menubar
  (setq inhibit-startup-message t)
  (setq visible-bell t) ;;no bell when error
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(setq initial-scratch-message nil) ;; prevent showing initial information in draft buffer
;; --8<-------------------------- §separator§ ------------------------>8--
(set-frame-parameter (selected-frame) 'alpha '(97 97))
(defun toggle-transparency ()
  (interactive)
  (if (/=
         (cadr (find 'alpha (frame-parameters nil) :key #'car))
         100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(97 97))))
;; --8<-------------------------- §separator§ ------------------------>8--
(setq initial-buffer-choice (concat DENNY_CONF "emacs_data/filebat.splashscreen"))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: clean-appearance-setting.el ends here
