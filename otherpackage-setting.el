;; -*- coding: utf-8 -*-
;; File: otherpackage-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2013-03-23 23:02:26>
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
(add-to-list 'load-path (concat EMACS_VENDOR "/anything/"))
(require 'anything-config)
;; (load-file (concat EMACS_VENDOR "/anything/anything.el"))
;; (load-file (concat EMACS_VENDOR "/anything/anything-config.el"))
;; (require 'anything)
;; (require 'anything-config)
;; (setq anything-candidate-number-limit 10000) ;候选数量限制
;; (global-set-key (kbd "C-M-x") 'anything)
;; (setq anything-sources
;;       '(
;;         ;; Buffer:
;;         anything-c-source-buffers
;;         anything-c-source-buffer-not-found
;;         anything-c-source-buffers+
;;         ;; File:
;;         anything-c-source-file-name-history
;;         anything-c-source-files-in-current-dir
;;         anything-c-source-files-in-current-dir+
;;         anything-c-source-file-cache
;;         anything-c-source-locate
;;         anything-c-source-recentf
;;         anything-c-source-ffap-guesser
;;         anything-c-source-ffap-line
;;         ;; Help:
;;         ;;anything-c-source-man-pages ;;TODO: doesn't work, if enabled
;;         ;;anything-c-source-info-pages ;;TODO: doesn't work, if enabled
;;         ;;anything-c-source-info-elisp ;;TODO: doesn't work, if enabled
;;         ;;anything-c-source-info-cl ;;TODO: doesn't work, if enabled
;;         ;; Command:
;;         anything-c-source-complex-command-history
;;         anything-c-source-extended-command-history
;;         anything-c-source-emacs-commands
;;         ;; Function:
;;         anything-c-source-emacs-functions
;;         anything-c-source-emacs-functions-with-abbrevs
;;         ;; Variable:
;;         anything-c-source-emacs-variables
;;         ;; Bookmark:
;;         anything-c-source-bookmarks
;;         anything-c-source-bookmark-set
;;         anything-c-source-bookmarks-ssh
;;         anything-c-source-bookmarks-su
;;         anything-c-source-bookmarks-local
;;         ;; Library:
;;         anything-c-source-elisp-library-scan
;;         ;; Programming:
;;         anything-c-source-imenu
;;         anything-c-source-ctags
;;         anything-c-source-semantic
;;         ;;anything-c-source-simple-call-tree-functions-callers ;;TODO: doesn't work, if enabled
;;         ;;anything-c-source-simple-call-tree-callers-functions ;;TODO: doesn't work, if enabled
;;         anything-c-source-commands-and-options-in-file
;;         ;; Color and Face:
;;         anything-c-source-customize-face
;;         anything-c-source-colors
;;         ;; Search Engine:
;;         anything-c-source-tracker-search
;;         anything-c-source-mac-spotlight
;;         ;; Kill ring:
;;         anything-c-source-kill-ring
;;         ;; Mark ring:
;;         ;;anything-c-source-global-mark-ring ;;TODO: doesn't work, if enabled
;;         ;; Register:
;;         anything-c-source-register
;;         ;; Headline Extraction:
;;         anything-c-source-fixme
;;         anything-c-source-rd-headline
;;         anything-c-source-oddmuse-headline
;;         anything-c-source-emacs-source-defun
;;         anything-c-source-emacs-lisp-expectations
;;         anything-c-source-emacs-lisp-toplevels
;;         anything-c-source-org-headline
;;         anything-c-source-eev-anchor
;;         ;; Misc:
;;         anything-c-source-evaluation-result
;;         anything-c-source-calculation-result
;;         anything-c-source-google-suggest
;;         anything-c-source-call-source
;;         anything-c-source-occur
;;         anything-c-source-create
;;         anything-c-source-minibuffer-history
;;         ;; System:
;;         anything-c-source-emacs-process))
;; --8<-------------------------- separator ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/stopwatch/stopwatch.el"))
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/weibo/"))
(require 'weibo)
(setq weibo-directory (concat EMACS_VENDOR "/weibo/.t.weibo.emacs.d"))
;; --8<-------------------------- separator ------------------------>8--
;; File: otherpackage-setting.el ends here
