;; -*- coding: utf-8 -*-
;; File: beta-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-03-17 22:42:22>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
;;(load-file (concat EMACS_VENDOR "/auctex-11.85-e22.3-msw/site-lisp/tex-site.el"))
;; --8<-------------------------- §separator§ ------------------------>8--
;; C/C++/Java/C# Mode
;;(defun my-c-mode-common-hook ()
;; (c-set-offset 'substatement-open 0)
;; (c-set-offset 'statement-cont 4)
;; (c-set-offset 'topmost-intro-cont 0)
;; (c-set-offset 'block-open 0)
;; (c-set-offset 'arglist-intro 4)
;; (c-set-offset 'arglist-cont-nonempty 4)
;; )
;;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;;(defun my-csharp-mode-hook ()
;; (progn
;; (turn-on-font-lock)
;; (auto-fill-mode)
;; (setq tab-width 4)
;; (define-key csharp-mode-map "\t" 'c-tab-indent-or-complete)))
;;(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)
;; --8<-------------------------- §separator§ ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/ecb-2.40/"))
;;(require 'ecb)
;; --8<-------------------------- §separator§ ------------------------>8--
;;(setq latex-run-command "/cygdrive/d/Program\ Files/MiKTeX\ 2.8/miktex/bin/pdflatex.exe")
;;(load "context")
;;(setq tex-default-mode 'context-mode)
;;(setq tex-output-extension ".pdf")
;;(setq tex-dvi-view-command "start \"acrobat\" *")
;; --8<-------------------------- §separator§ ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/second-sel/second-sel.el"))
;; (require 'second-sel)
;; (global-set-key [(control meta ?y)] 'secondary-dwim)
;; (define-key esc-map "y" 'yank-pop-commands)
;; (define-key isearch-mode-map "\C-\M-y" 'isearch-yank-secondary)
;; ;; --8<-------------------------- §separator§ ------------------------>8--
;; ;;(setq list-matching-lines-default-context-lines 4)
;; (defun grep-find-more ()
;; (interactive)
;; (make-local-variable 'list-matching-lines-default-context-lines)
;; (setq list-matching-lines-default-context-lines 3)
;; (grep-find nil)
;; )
;; --8<-------------------------- §separator§ ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/extraedit/"))
;;(require 'extraedit)
;; --8<-------------------------- §separator§ ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/speedbar-0.14beta4"))
;;(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
;;(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
;;(define-key-after (lookup-key global-map [menu-bar tools])
;; [speedbar] '("Speedbar" . speedbar-frame-mode) [calendar])
;;(global-set-key [(f4)] 'speedbar-get-focus)
;; --8<-------------------------- §separator§ ------------------------>8--
;; (setq max-mini-window-height 1) ;;Maximum height for resizing mini-windows.
;; --8<-------------------------- §separator§ ------------------------>8--
;; (add-to-list 'load-path (concat EMACS_VENDOR "/emacs-wiki-2.72/"))
;; (load-file (concat EMACS_VENDOR "/journal/journal.el"))
;; (require 'journal)
;; ;; --8<-------------------------- §separator§ ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/ansi/ansi.el"))
;; (require 'ansi)
;; ;; Color text
;; (with-ansi
;; (red "foo")
;; (blue "bar"))

;; ;; Color background
;; (with-ansi
;; (on-red "foo")
;; (on-blue "bar"))

;; ;; Add style
;; (with-ansi
;; (bold "foo")
;; (blink "bar"))
;; --8<-------------------------- §separator§ ------------------------>8--
;; (add-to-list 'load-path (concat EMACS_VENDOR "/iedit"))
;; (require 'iedit)
;; --8<-------------------------- §separator§ ------------------------>8--
;;ruby-electric
;;(require 'ruby-electric)
;;rails
;;(setq load-path (cons (concat EMACS_VENDOR "/emacs-rails" load-path)))
;;(require 'rails)
;; --8<-------------------------- §separator§ ------------------------>8--
;; (setq gnus-important-group-level nil)
;; (defun gnus-new-important-mail (&optional level)
;; "Return t there is any new mail/news in groups at or below
;; level LEVEL (defaults to gnus-important-group-level)."
;; (or level (setq level gnus-important-group-level))
;; (let ((newmail nil))
;; (save-window-excursion
;; (if (and (file-exists-p display-time-mail-file)
;; (> (nth 7 (file-attributes display-time-mail-file)) 0))
;; (gnus-group-get-new-news level))
;; (switch-to-buffer gnus-group-buffer)
;; (gnus-group-list-groups level)
;; (let ((groups (gnus-group-listed-groups)) group)
;; (while (setq group (pop groups))
;; (unless newmail
;; (gnus-group-goto-group group)
;; ;; Doesn't handle the unread count is *
;; (setq newmail (> (gnus-group-group-unread) 0)))))
;; (gnus-group-list-groups gnus-level-subscribed))
;; newmail))
;; (setq display-time-mail-function 'gnus-new-important-mail)
;; --8<-------------------------- §separator§ ------------------------>8--
;; ;; Rinari
;; (add-to-list 'load-path (concat EMACS_VENDOR "rinari"))
;; (require 'rinari)
;; --8<-------------------------- §separator§ ------------------------>8--
;; woman手册查询
;; (setq woman-default-indent 7 ;缩进格式
;;       woman-fill-frame t ;填充满屏幕
;;       woman-use-own-frame nil ;同一个frame
;;       woman-cache-level 3) ;缓存级别, 最快
;; --8<-------------------------- §separator§ ------------------------>8--
;;(type-break-mode) ;; notify to take a break after certain keystrokes or time
;; --8<-------------------------- §separator§ ------------------------>8--
;; Use time stamps
;; (add-hook 'write-file-hooks 'time-stamp)
;; (setq time-stamp-active t)
;; (setq time-stamp-format "%:u %04y-%02m-%02d %02H:%02M:%02S")
;; (setq time-stamp-end: "\n")
;; --8<-------------------------- §separator§ ------------------------>8--
;;(define-key minibuffer-local-map " " nil)
;; --8<-------------------------- §separator§ ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/versor/lisp"))
;; (add-to-list 'load-path "/home/wei/backup/tmp/emacs-versor/lisp")
;; (require 'versor)
;; (require 'languide)
;; (versor-setup)
;; --8<-------------------------- §separator§ ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/tea-time/tea-time.el"))
;; (require 'tea-time)
;; ;;(setq tea-time-sound "path-to-sound-file")
;; (define-key global-map "\C-ct" 'tea-time)
;; --8<-------------------------- §separator§ ------------------------>8--
(require 'desktop)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(add-to-list 'desktop-globals-to-save 'vc-comment-ring)
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'erc-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(setq desktop-files-not-to-save "\\(^/[^/:]*:\\|bbdb\\)")
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: beta-setting.el
