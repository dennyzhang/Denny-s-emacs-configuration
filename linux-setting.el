;; -*- coding: utf-8 -*-
;; File: linux-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-03-11 00:56:45>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
(create-fontset-from-fontset-spec "-unknown-DejaVu Sans Mono-normal-normal-normal-*-16-*-*-*-m-0-fontset-startup")
(setq default-frame-alist
      (append
       '((font . "fontset-startup")
         (foreground-color . "Wheat")
         (background-color . "DarkSlateGray")
         (cursor-color . "Orchid")
         )
       default-frame-alist))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun fullscreen-toggle ()
  "Toggle fullscreen status."
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         ;; if first parameter is '2', can toggle fullscreen status. Otherwise, can't toggle.
                         '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(global-set-key [f11] 'fullscreen-toggle)
;; --8<-------------------------- §separator§ ------------------------>8--
;;gnuplot
(add-to-list 'load-path (concat CONTRIBUTOR_CONF "/gnuplot-mode.0.6.0"))
(load-file (concat CONTRIBUTOR_CONF "/org-plot/org-plot.el"))
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(add-to-list 'auto-mode-alist '("\\.gp$" . gnuplot-mode))
;;(global-set-key [(f9)] 'gnuplot-make-buffer)
;; --8<-------------------------- §separator§ ------------------------>8--
;;alt+p r: root edit current file
(define-key global-map (kbd "M-p r") 'open-current-file-as-root)
(defun open-current-file-as-root ()
  "Open the current buffer as unix root. This command works on unixes only."
  (interactive)
  (when buffer-file-name
    (if (string-match "/sudo:root@localhost.*" buffer-file-name)
        ;; If the file is already opened as root priveledge, revert the buffer
        (revert-buffer nil t)
      (if buffer-read-only
          ;; open file in root priveledge, if necessary
          (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))
        (revert-buffer nil t))
      )
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat CONTRIBUTOR_CONF "/anything/anything.el"))
(load-file (concat CONTRIBUTOR_CONF "/anything/anything-config.el"))
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
;; --8<-------------------------- §separator§ ------------------------>8--
;; (set-default-font "-bitstream-Bitstream Charter-normal-normal-normal-*-17-*-*-*-*-0-iso10646-1")
;; (setq sl/x-font-en "DejaVu Sans Mono"
;; sl/x-font-zh "文泉驿正黑"
;; ;;sl/x-font-zh "WenQuanYi Micro Hei"
;; sl/x-font-zh-size 13.5)

;; (defun sl/set-x-font ()
;; (interactive)
;; (let ((fontset "fontset-default")
;; (zh-font (font-spec :family sl/x-font-zh :size sl/x-font-zh-size)))
;; (set-default-font sl/x-font-en)
;; (set-fontset-font fontset
;; 'nil '("Courier New" . "unicode-bmp"))
;; (set-fontset-font fontset
;; 'nil '("Baekmuk Dotum" . "unicode-bmp"))
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;; (set-fontset-font fontset charset zh-font))))

;; (sl/set-x-font)
;; --8<-------------------------- §separator§ ------------------------>8--
;; show file size and free space left in device
;;(load-file (concat CONTRIBUTOR_CONF "/df-mode/df-mode.el"))
;;(df-mode 1)
;; --8<-------------------------- §separator§ ------------------------>8--
;;Usage:M-x ascii-on RET
(load-file (concat CONTRIBUTOR_CONF "/ascii/ascii.el"))
(require 'ascii)
;; --8<-------------------------- §separator§ ------------------------>8--
(add-to-list 'load-path (concat CONTRIBUTOR_CONF "/ess-5.14/lisp"))
;;(require 'ess-site) ;; TODO, it will always popup a *ESS* buffer
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))
(add-to-list 'auto-mode-alist '("\\.stata$" . stata-mode))
;;(org-defkey org-mode-map [(control meta ,)] 'org-shiftmetaleft)
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: linux-setting.el
