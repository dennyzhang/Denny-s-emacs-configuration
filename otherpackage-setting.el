;; -*- coding: utf-8 -*-
;; File: otherpackage-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-08-11 14:52:56>
;;
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/keywiz/keywiz.el"))
(load-file (concat EMACS_VENDOR "/regex-tool/regex-tool.el"))
;; --8<-------------------------- separator ------------------------>8--
;;(appt-activate)
(setq appt-display-format 'window)
;;(setq appt-display-duration 3)
(setq appt-display-interval 10)
(setq appt-display-mode-line t)
;; --8<-------------------------- separator ------------------------>8--
;;Find file recursively
(load-file (concat EMACS_VENDOR "/find-recursive/find-recursive.el"))
(require 'find-recursive)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/log4j-mode/log4j-mode.el"))
(require 'log4j-mode)
(add-to-list 'auto-mode-alist '("\\.log" . log4j-mode))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/dupwords/dupwords.el"))
(require 'dupwords)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/sl/sl.el"))
(require 'sl)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/anything/anything.el"))
(load-file (concat EMACS_VENDOR "/anything/anything-config.el"))
(require 'anything)
(require 'anything-config)
(setq anything-candidate-number-limit 10000) ;候选数量限制
(global-set-key (kbd "C-M-x") 'anything)
(setq anything-sources
      '(
        ;; Buffer:
        anything-c-source-buffers
        anything-c-source-buffer-not-found
        anything-c-source-buffers+
        ;; File:
        anything-c-source-file-name-history
        anything-c-source-files-in-current-dir
        anything-c-source-files-in-current-dir+
        anything-c-source-file-cache
        anything-c-source-locate
        anything-c-source-recentf
        anything-c-source-ffap-guesser
        anything-c-source-ffap-line
        ;; Help:
        ;;anything-c-source-man-pages ;;TODO: doesn't work, if enabled
        ;;anything-c-source-info-pages ;;TODO: doesn't work, if enabled
        ;;anything-c-source-info-elisp ;;TODO: doesn't work, if enabled
        ;;anything-c-source-info-cl ;;TODO: doesn't work, if enabled
        ;; Command:
        anything-c-source-complex-command-history
        anything-c-source-extended-command-history
        anything-c-source-emacs-commands
        ;; Function:
        anything-c-source-emacs-functions
        anything-c-source-emacs-functions-with-abbrevs
        ;; Variable:
        anything-c-source-emacs-variables
        ;; Bookmark:
        anything-c-source-bookmarks
        anything-c-source-bookmark-set
        anything-c-source-bookmarks-ssh
        anything-c-source-bookmarks-su
        anything-c-source-bookmarks-local
        ;; Library:
        anything-c-source-elisp-library-scan
        ;; Programming:
        anything-c-source-imenu
        anything-c-source-ctags
        anything-c-source-semantic
        ;;anything-c-source-simple-call-tree-functions-callers ;;TODO: doesn't work, if enabled
        ;;anything-c-source-simple-call-tree-callers-functions ;;TODO: doesn't work, if enabled
        anything-c-source-commands-and-options-in-file
        ;; Color and Face:
        anything-c-source-customize-face
        anything-c-source-colors
        ;; Search Engine:
        anything-c-source-tracker-search
        anything-c-source-mac-spotlight
        ;; Kill ring:
        anything-c-source-kill-ring
        ;; Mark ring:
        ;;anything-c-source-global-mark-ring ;;TODO: doesn't work, if enabled
        ;; Register:
        anything-c-source-register
        ;; Headline Extraction:
        anything-c-source-fixme
        anything-c-source-rd-headline
        anything-c-source-oddmuse-headline
        anything-c-source-emacs-source-defun
        anything-c-source-emacs-lisp-expectations
        anything-c-source-emacs-lisp-toplevels
        anything-c-source-org-headline
        anything-c-source-eev-anchor
        ;; Misc:
        anything-c-source-evaluation-result
        anything-c-source-calculation-result
        anything-c-source-google-suggest
        anything-c-source-call-source
        anything-c-source-occur
        anything-c-source-create
        anything-c-source-minibuffer-history
        ;; System:
        anything-c-source-emacs-process))
;; --8<-------------------------- separator ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/stopwatch/stopwatch.el"))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/command-frequency/command-frequency.el"))
(command-frequency-mode 1)
(defvar cf-frequence-threshrold 1 "*When generating reports, only show commands over given threshrold")
(defvar cf-stat-self-insert-command nil "*Non-nil means also statistic `self-insert-command'")
(defvar cf-buffer-name "*command frequence*" "the name of buffer command frequence")

(defvar cf-command-history nil "command frequency history")

(defun cf-add-command ()
  (when (and last-command
             (or cf-stat-self-insert-command (not (equal last-command 'self-insert-command))))
    (let ((cmd (assoc last-command cf-command-history)))
      (if cmd
          (setcdr cmd (1+ (cdr cmd)))
        (add-to-list 'cf-command-history (cons last-command 1))))))

(defun command-frequence ()
  (interactive)
  (with-current-buffer (get-buffer-create cf-buffer-name)
    (linum-mode t)
    (View-quit)
    (erase-buffer)
    (let ((cmds (copy-sequence cf-command-history)) (all 0))
      (dolist (c cmds)
        (setq all (+ all (cdr c))))
      (insert (format "Total count of commands: %d. " all))
      (unless cf-stat-self-insert-command
        (insert "(exclude `self-insert-command')"))
      (insert "\n\n")
      (insert (format "%-5s %-5s %-30s %s\n" "Count" "Frequency" "Command" "Key"))
      (dolist (c (sort cmds (lambda (c1 c2) (> (cdr c1) (cdr c2)))))
        (unless (< (cdr c) cf-frequence-threshrold)
          (insert (format "%-5d %.3f %-30S %s\n" (cdr c) (/ (cdr c) (float all)) (car c)
                          (mapconcat 'key-description (where-is-internal (car c)) ", ")))))
      (goto-char (point-min))
      (setq major-mode 'emacs-lisp-mode)
      (setq mode-name "Emacs-Lisp")
      (use-local-map emacs-lisp-mode-map)
      (view-mode t)
      (switch-to-buffer (current-buffer)))))

(defun cf-clear-command-history ()
  "Clear command history"
  (interactive)
  (setq cf-command-history nil))

(add-hook 'post-command-hook 'cf-add-command)
(add-to-list 'desktop-globals-to-save 'cf-command-history)
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/weibo/"))
(require 'weibo)
(setq weibo-directory (concat EMACS_VENDOR "/weibo/.t.weibo.emacs.d"))
;; --8<-------------------------- separator ------------------------>8--
;; File: otherpackage-setting.el ends here
