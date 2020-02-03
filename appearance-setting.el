;; -*- coding: utf-8 -*-
;; File: appearance-setting.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:48>
;;
;; --8<-------------------------- separator ------------------------>8--
;;color-theme
;;(load-file (concat CONF-EMACS-VENDOR "/color-theme/color-theme.el"))
(require 'color-theme)
;; TODO denny
(defun plist-to-alist (plist)
  "Convert property list PLIST into the equivalent association-list form.
The alist is returned. This converts from

\(a 1 b 2 c 3)

into

\((a . 1) (b . 2) (c . 3))

The original plist is not modified. See also `destructive-plist-to-alist'."

  (let (alist)
    (while plist
      (setq alist (cons (cons (car plist) (cadr plist)) alist))
      (setq plist (cddr plist)))
    (nreverse alist)))

;; (color-theme-initialize)
;; (color-theme-dark-blue) ;; TODO: conflict theme

;; (color-theme-bharadwaj-slate)
;;(load-theme 'light-blue t)
;;(load-theme 'tango-dark t)
;; --8<-------------------------- separator ------------------------>8-- :noexport:
;; (set-face-background 'modeline "#5f9ea0") ;; set color of modeline ;; TODO denny
(set-face-attribute 'mode-line nil :height 100)
(defun toggle-mode-line ()
  "toggles the modeline on and off"
  (interactive)
  (let ((normal-height 100) (minimum-height 1))
    (if (= normal-height (face-attribute 'mode-line :height))
        (set-face-attribute 'mode-line nil :height minimum-height)
      (set-face-attribute 'mode-line nil :height normal-height))))
(global-set-key [M-f12] 'toggle-mode-line)
;; --8<-------------------------- separator ------------------------>8--
;; when cursor and mouse is close, automatically move mouse away
(mouse-avoidance-mode 'animate)
(setq mouse-avoidance-threshold 10)
;; enable mouse wheel support
;;(mouse-wheel-mode 1) ;; TODO denny
;; --8<-------------------------- separator ------------------------>8--
(defun emacs-clean ()
  ;; let's have a clean world
  (interactive)
  ;;(set-scroll-bar-mode 'right) ;;scroll bar ;; TODO denny
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; Hide toolbar
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) ;;Hide menubar
  (setq inhibit-startup-message t
        ;; prevent showing initial information in draft buffer
        initial-scratch-message nil
        visible-bell t ;;no bell when error
        initial-scratch-message
        (purecopy "\
;; In sandbox
"))
  (set-frame-parameter nil 'scroll-bar-width 10)
  )
(emacs-clean)
;; --8<-------------------------- separator ------------------------>8--
(global-set-key (kbd "<C-f10>") 'toggle-transparency)
(set-frame-parameter (selected-frame) 'alpha '(97 97))
(defun toggle-transparency ()
  (interactive)
  (let* ((transparency-list '(10 97))
         (transparency (cadr (find 'alpha (frame-parameters nil) :key #'car)))
         (transparency-count (length transparency-list))
         (pos (position transparency transparency-list :test #'equal))
         (next-pos (mod (+ pos 1) transparency-count))
         (transparency-new (nth next-pos transparency-list)))
    (set-frame-parameter nil 'alpha (cons transparency-new transparency-new))
    ))
;; --8<-------------------------- separator ------------------------>8--
(setq initial-buffer-choice (concat CONF-SHARE-DIR "/org_data/life/question.org"))
;; --8<-------------------------- separator ------------------------>8--
(defun add-custom-global-font-locking ()
  "Hilight some keywords globally."
  (interactive)
  (unless (member mode-name '("Org"))
    (font-lock-add-keywords
     nil
     '(("\\<\\(FIXME\\)" 0 font-lock-warning-face t)
       ("\\<\\(fixme\\)" 0 font-lock-warning-face t)
       ("\\<\\(HACK\\)" 0 font-lock-warning-face t)
       ("\\<\\(REFACTOR\\)" 0 font-lock-warning-face t)
       ("\\<\\(TODO\\)" 0 font-lock-warning-face t)
       ("\\<\\(todo\\)" 0 font-lock-warning-face t)
       ("\\<\\(Todo\\)" 0 font-lock-warning-face t)))
    (font-lock-mode 1)))
(add-hook 'find-file-hook 'add-custom-global-font-locking)
;; --8<-------------------------- separator ------------------------>8--
(defvar message-filter-regexp-list
  '("^Starting new Ispell process \\[.+\\] \\.\\.\\.$"
    "^Ispell process killed$")
  "filter formatted message string to remove noisy messages")
;; --8<-------------------------- separator ------------------------>8--
;; (load-file (concat CONF-EMACS-VENDOR "/hide-comnt/hide-comnt.el")); TODO
;; (require 'newcomment nil t)
;;(require 'hide-comnt)
;; (global-set-key [(meta p)(t)] 'hide/show-comments-toggle)
;; --8<-------------------------- separator ------------------------>8--
(defun toggle-outline()
  (interactive)
  (if (null selective-display)
      (set-selective-display 6)
    (set-selective-display nil)))
(global-set-key [(meta p)(o)] 'toggle-outline)
;; --8<-------------------------- separator ------------------------>8--
;; (defun compile-face-settings ()
;;   "Face settings for `compile'."
;;   (custom-set-faces '(compilation-info
;;                       ((((type tty)) :bold t :foreground "green")
;;                        (t :foreground "green"))))
;;   (setq compilation-message-face nil)
;;   (custom-set-faces '(compilation-warning
;;                       ((((class color)) :foreground "red" :bold nil))))
;;   (custom-set-faces '(compilation-info
;;                       ((((type tty pc)) :foreground "magenta") (t (:foreground "magenta")))))
;;   (setq compilation-enter-directory-face 'beautiful-blue-face)
;;   (setq compilation-leave-directory-face 'magenta-face))

;; (eval-after-load "compile" `(compile-face-settings))
;; --8<-------------------------- separator ------------------------>8--
(defun fullscreen-toggle ()
  "Toggle fullscreen status."
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   ;; if first parameter is '2', can toggle fullscreen status. Otherwise, can't toggle.
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(global-set-key [f11] 'fullscreen-toggle)
;; --8<-------------------------- separator ------------------------>8--
(global-set-key [(control meta ?=)] 'frame-width-increase)
(global-set-key [(control meta ?-)] 'frame-width-decrease)
(defun frame-width-increase (&optional delta)
  (interactive)
  (let ((old-frame-width (window-width))
        next-frame-width)
    (if (null delta)
        (setq delta 5))
    (setq next-frame-width (+ delta old-frame-width))
    (set-frame-width (selected-frame) next-frame-width)
    )
  )
(defun frame-width-decrease ()
  (interactive)
  (frame-width-increase -5)
  )
