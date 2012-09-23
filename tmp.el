;; -*- coding: utf-8 -*-
;; File: tmp.el -- tentatively try new features/configuration with limited impact
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-09-17 22:50:38>
;; --8<-------------------------- separator ------------------------>8--
;; (defun save-information ()
;; (dolist (func kill-emacs-hook)
;; (unless (memq func '(exit-gnus-on-exit server-force-stop))
;; (funcall func)))
;; (unless (eq 'listen (process-status server-process))

;; (run-with-idle-timer 300 t 'save-information)
;; --8<-------------------------- separator ------------------------>8--
;;(load-file (concat EMACS_VENDOR "/auctex-11.85-e22.3-msw/site-lisp/tex-site.el"))
;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/ecb-2.40/"))
;;(require 'ecb)
;; --8<-------------------------- separator ------------------------>8--
;;(setq latex-run-command "/cygdrive/d/Program\ Files/MiKTeX\ 2.8/miktex/bin/pdflatex.exe")
;;(load "context")
;;(setq tex-default-mode 'context-mode)
;;(setq tex-output-extension ".pdf")
;;(setq tex-dvi-view-command "start \"acrobat\" *")
;; --8<-------------------------- separator ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/second-sel/second-sel.el"))
;; (require 'second-sel)
;; (global-set-key [(control meta ?y)] 'secondary-dwim)
;; (define-key esc-map "y" 'yank-pop-commands)
;; (define-key isearch-mode-map "\C-\M-y" 'isearch-yank-secondary)
;; ;; --8<-------------------------- separator ------------------------>8--
;; ;;(setq list-matching-lines-default-context-lines 4)
;; (defun grep-find-more ()
;; (interactive)
;; (make-local-variable 'list-matching-lines-default-context-lines)
;; (setq list-matching-lines-default-context-lines 3)
;; (grep-find nil)
;; )
;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/extraedit/"))
;;(require 'extraedit)
;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/speedbar-0.14beta4"))
;;(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
;;(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
;;(define-key-after (lookup-key global-map [menu-bar tools])
;; [speedbar] '("Speedbar" . speedbar-frame-mode) [calendar])
;;(global-set-key [(f4)] 'speedbar-get-focus)
;; --8<-------------------------- separator ------------------------>8--
;; (setq max-mini-window-height 1) ;;Maximum height for resizing mini-windows.
;; --8<-------------------------- separator ------------------------>8--
;; (add-to-list 'load-path (concat EMACS_VENDOR "/emacs-wiki-2.72/"))
;; (load-file (concat EMACS_VENDOR "/journal/journal.el"))
;; (require 'journal)
;; ;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
;; (add-to-list 'load-path (concat EMACS_VENDOR "/iedit"))
;; (require 'iedit)
;; --8<-------------------------- separator ------------------------>8--
;;ruby-electric
;;(require 'ruby-electric)
;;rails
;;(setq load-path (cons (concat EMACS_VENDOR "/emacs-rails" load-path)))
;;(require 'rails)
;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
;; ;; Rinari
;; (add-to-list 'load-path (concat EMACS_VENDOR "rinari"))
;; (require 'rinari)
;; --8<-------------------------- separator ------------------------>8--
;; woman手册查询
;; (setq woman-default-indent 7 ;缩进格式
;; woman-fill-frame t ;填充满屏幕
;; woman-use-own-frame nil ;同一个frame
;; woman-cache-level 3) ;缓存级别, 最快
;; --8<-------------------------- separator ------------------------>8--
;;(type-break-mode) ;; notify to take a break after certain keystrokes or time
;; --8<-------------------------- separator ------------------------>8--
;; Use time stamps
;; (add-hook 'write-file-hooks 'time-stamp)
;; (setq time-stamp-active t)
;; (setq time-stamp-format "%:u %04y-%02m-%02d %02H:%02M:%02S")
;; (setq time-stamp-end: "\n")
;; --8<-------------------------- separator ------------------------>8--
;;(define-key minibuffer-local-map " " nil)
;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/versor/lisp"))
;; (add-to-list 'load-path "/home/wei/backup/tmp/emacs-versor/lisp")
;; (require 'versor)
;; (require 'languide)
;; (versor-setup)
;; --8<-------------------------- separator ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/tea-time/tea-time.el"))
;; (require 'tea-time)
;; ;;(setq tea-time-sound "path-to-sound-file")
;; (define-key global-map "\C-ct" 'tea-time)
;; --8<-------------------------- separator ------------------------>8--
;; ;; tell more about how to recognize words
;; (modify-syntax-entry ?_ "w")
;; (modify-syntax-entry ?[ "w")
;; (modify-syntax-entry ?] "w")
;; --8<-------------------------- separator ------------------------>8--
(defun eshell-spawn-external-command (beg end)
  "Parse and expand any history references in current input."
  (save-excursion
    (goto-char end)
    (when (looking-back "&!" beg)
      (delete-region (match-beginning 0) (match-end 0))
      (goto-char beg)
      (insert "spawn "))))

(add-hook 'eshell-expand-input-functions 'eshell-spawn-external-command)
;; --8<-------------------------- separator ------------------------>8--
(defun elint-current-buffer ()
  (interactive)
  (elint-initialize)
  (elint-current-buffer))

(eval-after-load "elint"
  '(progn
     (add-to-list 'elint-standard-variables 'current-prefix-arg)
     (add-to-list 'elint-standard-variables 'command-line-args-left)
     (add-to-list 'elint-standard-variables 'buffer-file-coding-system)
     (add-to-list 'elint-standard-variables 'emacs-major-version)
     (add-to-list 'elint-standard-variables 'window-system)))
;; --8<-------------------------- separator ------------------------>8--
(defun my-elisp-indent-or-complete (&optional arg)
  (interactive "p")
  (call-interactively 'lisp-indent-line)
  (unless (or (looking-back "^\\s-*")
              (bolp)
              (not (looking-back "[-A-Za-z0-9_*+/=<>!?]+")))
    (call-interactively 'lisp-complete-symbol)))

(defun my-lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
    (call-interactively 'slime-indent-and-complete-symbol)))

(defvar slime-mode nil)

(defun my-lisp-mode-hook (&optional emacs-lisp-p)
  (auto-fill-mode 1)
  ;;(paredit-mode 1)
  ;;(redshank-mode 1)

  ;;(column-marker-1 79)
  (let (mode-map)
    (if emacs-lisp-p
        (progn
          (require 'edebug)

          (setq mode-map emacs-lisp-mode-map)

          (define-key mode-map [(meta return)] 'outline-insert-heading)
          (define-key mode-map [tab] 'my-elisp-indent-or-complete)
          (define-key mode-map [tab] 'yas/expand))

      ;;(turn-on-cldoc-mode)

      (setq mode-map lisp-mode-map)

      (define-key mode-map [tab] 'my-lisp-indent-or-complete)
      (define-key mode-map [(meta ?q)] 'slime-reindent-defun)
      (define-key mode-map [(meta ?l)] 'slime-selector))))

(mapc (lambda (hook)
        (add-hook hook 'my-lisp-mode-hook))
      '(lisp-mode-hook inferior-lisp-mode-hook slime-repl-mode-hook))

(add-hook 'emacs-lisp-mode-hook (function (lambda () (my-lisp-mode-hook t))))
;; --8<-------------------------- separator ------------------------>8--
(defun tidy-xml-buffer ()
  (interactive)
  (save-excursion
    (call-process-region (point-min) (point-max) "tidy" t t nil
                         "-xml" "-i" "-wrap" "0" "-omit" "-q")))

(eval-after-load "nxml-mode"
  '(define-key nxml-mode-map [(control shift ?h)] 'tidy-xml-buffer))
;; --8<-------------------------- separator ------------------------>8--
(defun ido-smart-select-text ()
  "Select the current completed item. Do NOT descend into directories."
  (interactive)
  (when (and (or (not ido-require-match)
                 (if (memq ido-require-match
                           '(confirm confirm-after-completion))
                     (if (or (eq ido-cur-item 'dir)
                             (eq last-command this-command))
                         t
                       (setq ido-show-confirm-message t)
                       nil))
                 (ido-existing-item-p))
             (not ido-incomplete-regexp))
    (when ido-current-directory
      (setq ido-exit 'takeprompt)
      (unless (and ido-text (= 0 (length ido-text)))
        (let ((match (ido-name (car ido-matches))))
          (throw 'ido
                 (setq ido-selected
                       (if match
                           (replace-regexp-in-string "/\\'" "" match)
                         ido-text)
                       ido-text ido-selected
                       ido-final-text ido-text)))))
    (exit-minibuffer)))

(add-hook 'ido-minibuffer-setup-hook
          (lambda ()
            (define-key ido-file-completion-map "\C-m"
              'ido-smart-select-text)))
;; --8<-------------------------- separator ------------------------>8--
;; (eval-after-load "magit"
;; '(progn
;; (require 'magit-topgit)
;; (require 'rebase-mode)

;; (defun start-git-monitor ()
;; (interactive)
;; (start-process "git-monitor" (current-buffer) "~/bin/git-monitor"))

;; ;;(add-hook 'magit-status-mode-hook 'start-git-monitor)
;; ))
;; (require 'inf-ruby)
;; (require 'ruby-electric)
;; (require 'yari)

;; (defun my-ruby-smart-return ()
;; (interactive)
;; (when (memq (char-after) '(?\| ?\" ?\'))
;; (forward-char))
;; (call-interactively 'newline-and-indent))

;; (defun my-ruby-mode-hook ()
;; (ruby-electric-mode)
;; (inf-ruby-keys)

;; (define-key ruby-mode-map [return] 'my-ruby-smart-return)
;; (define-key ruby-mode-map [(control ?h) (control ?i)] 'yari-anything)

;; (set (make-local-variable 'yas/fallback-behavior)
;; '(apply ruby-indent-command . nil))
;; (define-key ruby-mode-map [tab] 'yas/expand-from-trigger-key))

;; (add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
;; --8<-------------------------- separator ------------------------>8--
;;(add-hook 'mail-citation-hook 'sc-cite-original)
;; --8<-------------------------- separator ------------------------>8--
(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
    (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))
;; --8<-------------------------- separator ------------------------>8--
;;(add-hook 'sh-set-shell-hook 'flymake-shell-load)
;; --8<-------------------------- separator ------------------------>8--
;; (defconst my-mode-line-buffer-identification
;; (list
;; '(:eval
;; (let ((host-name
;; (if (file-remote-p default-directory)
;; (tramp-file-name-host
;; (tramp-dissect-file-name default-directory))
;; (system-name))))
;; (if (string-match "^[^0-9][^.]*\\(\\..*\\)" host-name)
;; (substring host-name 0 (match-beginning 1))
;; host-name)))
;; ": %12b"))

;; (setq-default
;; mode-line-buffer-identification
;; my-mode-line-buffer-identification)

;; (add-hook
;; 'dired-mode-hook
;; #'(lambda ()
;; (setq
;; mode-line-buffer-identification
;; my-mode-line-buffer-identification)))
;; --8<-------------------------- separator ------------------------>8--
(defun rgrau-erc-oops (txt)
  (when (member txt '("ls" "xb" "cd"))
    (setq erc-send-this nil)))

(add-to-list 'erc-send-pre-hook 'rgrau-erc-oops)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/screenshot/screenshot.el"))
(setq screenshot-default-scheme "local")
;; --8<-------------------------- separator ------------------------>8--
;; Specifies whether the desktop should be loaded if locked.
;;(setq desktop-load-locked-desktop t)
;; --8<-------------------------- separator ------------------------>8--
(require 'nnir)
(setq nnir-search-engine 'namazu)
(setq nnir-namazu-index-directory (expand-file-name "~/.namazu-mail"))
(setq nnir-namazu-remove-prefix (expand-file-name "/home/denny/backup/essential/Dropbox/private_data/gnus_data/Mail"))
(setq nnir-mail-backend gnus-select-method)
;; --8<-------------------------- separator ------------------------>8--
(defun nuke-unmodified-buffers (&optional list)
  "For each buffer in LIST, kill it if unmodified."
  (interactive)
  (if (null list)
      (setq list (buffer-list)))
  (dolist (buffer list)
    (if (and (not (member (buffer-name buffer)
                          '("" "*Message*" "*buffer-selection*"
                            "*Shell Command Output*" "*scratch*"
                            "*nav*" "*imenu-tree*")))
             (not (buffer-modified-p buffer)))
        (kill-buffer buffer))))
;; --8<-------------------------- separator ------------------------>8--
(defun wcy-shell-mode-kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))

(add-hook 'shell-mode-hook
          (lambda ()
            (set-process-sentinel (get-buffer-process (current-buffer))
                                  #'wcy-shell-mode-kill-buffer-on-exit)))
;; --8<-------------------------- separator ------------------------>8--
(defun sh-mode-face-settings ()
  "Face settings for `sh-mode'."
  (custom-set-faces
   '(sh-heredoc
     ((((min-colors 88) (class color)
        (background dark))
       (:foreground "deeppink"))
      (((class color)
        (background dark))
       (:foreground "deeppink"))
      (((class color)
        (background light))
       (:foreground "tan1" ))
      (t
       (:weight bold))))))

(eval-after-load "sh-script"
  `(sh-mode-face-settings))
;; --8<-------------------------- separator ------------------------>8--
(defun svn-face-settings ()
  "Face settings for `psvn'."
  (custom-set-faces
   '(svn-status-filename-face
     ((((type tty)) :bold t :foreground "yellow")
      (t :foreground "yellow")))))

(eval-after-load "psvn" `(svn-face-settings))
;; --8<-------------------------- separator ------------------------>8--
;;(setq w3m-use-mule-ucs t)
;; --8<-------------------------- separator ------------------------>8--
(defun w3m-save-current-buffer ()
  "Save current w3m buffer."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (call-interactively 'copy-region-as-kill-nomark))
  (with-temp-buffer
    (call-interactively 'yank)
    (call-interactively 'write-file)))
;; --8<-------------------------- separator ------------------------>8--
;; (defun man-face-settings ()
;;   "Face settings for `man'."
;;   (setq Man-overstrike-face 'yellow-face)
;;   (setq Man-underline-face 'underline-green-face)
;;   (setq Man-reverse-face 'red-face))

;; (eval-after-load "man" `(man-face-settings))
;; --8<-------------------------- separator ------------------------>8--
(defun diff-face-settings ()
  "Face settings for `diff'."
  (custom-set-faces '(diff-header ((((class color)) :foreground "green"))))
  (custom-set-faces '(diff-hunk-header ((((type tty pc)) :bold t :foreground "green")
                                        (t :foreground "OliveDrab1"))))
  (custom-set-faces '(diff-index ((((class color)) :foreground "cyan"))))
  (custom-set-faces '(diff-file-header ((((class color)) :foreground "magenta"))))
  (custom-set-faces '(diff-removed ((((class color)) :foreground "red"))))
  (custom-set-faces '(diff-indicator-removed ((((type tty pc)) :foreground "yellow" :background "red")
                                              (t :foreground "yellow" :background "red"))))
  (custom-set-faces '(diff-added ((((type tty pc)) :foreground "yellow")
                                  ;; (t :foreground "deep pink"))))
                                  (t :foreground "aquamarine"))))
  (custom-set-faces '(diff-indicator-added ((((type tty pc)) :foreground "red" :background "white")
                                            (t :foreground "red" :background "white"))))
  (custom-set-faces '(diff-changed ((((type tty pc)) :foreground "red" :background "blue")
                                    (t :foreground "deep pink"))))
  (custom-set-faces '(diff-refine-change ((((type tty pc)) :foreground "white" :background "blue")
                                          (t :foreground "dark orchid"))))
  (custom-set-faces '(diff-context
                      ((((class grayscale) (background light)) (:foreground "LightGray" :weight bold))
                       (((class grayscale) (background dark)) (:foreground "DimGray" :weight bold))
                       (((class color) (min-colors 88) (background light)) (:foreground "Orchid"))
                       (((class color) (min-colors 88) (background dark)) (:foreground "cornflower blue"))
                       (((class color) (min-colors 16) (background light)) (:foreground "Orchid"))
                       (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue"))
                       (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
                       (t (:weight bold))))))

(eval-after-load "diff-mode"
  `(diff-face-settings))
;; --8<-------------------------- separator ------------------------>8--
(defun ediff-face-settings ()
  "Face settings for `ediff'."
  (progn
    (custom-set-faces
     '(ediff-current-diff-face-B
       ((((class color) (background dark)) (:background "yellow")))))
    (set-face-foreground 'ediff-fine-diff-face-A "white")
    (set-face-background 'ediff-fine-diff-face-A "#555753")
    (set-face-foreground 'ediff-current-diff-face-B "red")
    (set-face-foreground 'ediff-fine-diff-face-B "red")
    (set-face-background 'ediff-fine-diff-face-B "#555753"))
  (custom-set-faces '(ediff-current-diff-A
                      ((((type tty)) :background "yellow" :foreground "blue")
                       (t :background "DarkSeaGreen3" :foreground "blue violet"))))
  (custom-set-faces '(ediff-fine-diff-A
                      ((((type tty)) :background "blue" :foreground "white")
                       (t :background "gold1" :foreground "red"))))
  (custom-set-faces '(ediff-current-diff-B
                      ((((type tty)) :background "yellow" :foreground "black")
                       (t :background "DodgerBlue1" :foreground "gray11"))))
  (custom-set-faces '(ediff-fine-diff-B
                      ((((type tty)) :background "cyan" :foreground "red")
                       (t :background "chocolate2" :foreground "dark slate blue")))))

(eval-after-load "ediff"
  `(ediff-face-settings))
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/psvn"))
(require 'psvn)
(setq svn-status-verbose nil)
(defsubst svn-status-interprete-state-mode-color (stat)
  "Interpret vc-svn-state symbol to mode line color"
  (case stat
    ('up-to-date "GreenYellow")
    ('edited "tomato")
    ('unknown "gray")
    ('added "blue")
    ('deleted "red")
    ('unmerged "purple")
    (t "black")))
;; --8<-------------------------- separator ------------------------>8--
(add-hook 'autoconf-mode-hook 'flyspell-prog-mode)
(add-hook 'autotest-mode-hook 'flyspell-prog-mode)
(add-hook 'c++-mode-hook 'flyspell-prog-mode)
(add-hook 'c-mode-hook 'flyspell-prog-mode)
(add-hook 'cperl-mode-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'makefile-mode-hook 'flyspell-prog-mode)
(add-hook 'nxml-mode-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'sh-mode-hook 'flyspell-prog-mode)
;; --8<-------------------------- separator ------------------------>8--
;; (require 'midnight)
;; (midnight-delay-set 'midnight-delay "0:10am")
;; (add-hook 'midnight-hook
;; (lambda
;; (with-current-buffer "*midnight*"
;; (org-agenda-list)
;; )))
;; (setq midnight-period 28800)
;; --8<-------------------------- separator ------------------------>8--
;; (setq ido-create-new-buffer (quote never)
;; ido-enable-last-directory-history nil
;; ido-enable-regexp nil
;; ido-max-directory-size 300000
;; ido-max-file-prompt-width 0.3
;; ;; ido-use-filename-at-point (quote guess)
;; ido-use-url-at-point t
;; ido-auto-merge-work-directories-length 0
;; ido-use-virtual-buffers t)

;; ;; Allow the same buffer to be open in different frames
;; (setq ido-default-buffer-method 'selected-window)
;; --8<-------------------------- separator ------------------------>8--
(defun remove-last-file-name-history ()
  "Add to server-switch-hook to omit emacsclient's temporary filenames from the history."
  (setq file-name-history (cdr file-name-history)))
(add-hook 'server-switch-hook 'remove-last-file-name-history)
;; --8<-------------------------- separator ------------------------>8--
(setq comint-scroll-to-bottom-on-input t) ; always insert at the bottom
(setq comint-scroll-to-bottom-on-output nil) ; always add output at the bottom
(setq comint-scroll-show-maximum-output t) ; scroll to show max possible output
(setq comint-input-ignoredups t) ; no duplicates in command history
(setq comint-buffer-maximum-size 20000) ; max length of the buffer in lines
(setq comint-input-ring-size 5000) ; max shell history size
;; --8<-------------------------- separator ------------------------>8--
;; (setq tramp-remote-process-environment
;; (cons (format "PAGER=/bin/cat")
;; tramp-remote-process-environment))
;; --8<-------------------------- separator ------------------------>8--
(setq history-delete-duplicates t)
(setq use-dialog-box nil)
;; --8<-------------------------- separator ------------------------>8--
(defun svn-my-diff ()
  "For current svn directory, automatically generate command of 'svn diff -r A:B''"
  (interactive)
  (let (revision
        (revision-cmd "svn info | grep '^Revision:' | awk -F' ' '{print $2}'")
        (svn-url-cmd "svn info | grep '^URL:' | awk -F' ' '{print $2}'")
        svn-url)
    (setq revision (shell-command-to-string revision-cmd))
    (setq revision (substring revision 0 (- (length revision) 1)))
    (setq revision (parse-integer revision))
    (setq svn-url (shell-command-to-string svn-url-cmd))
    (setq svn-url (substring svn-url 0 (- (length svn-url) 1)))
    (insert (format "svn diff -r %d:%d %s" (- revision 1) revision
                    svn-url))
    ))
;; --8<-------------------------- separator ------------------------>8--
(setq warning-suppress-types nil) ;; TODO, suspicious configuration
;; --8<-------------------------- separator ------------------------>8--
;; ignore case for finding files
(setq read-file-name-completion-ignore-case t)
;; --8<-------------------------- separator ------------------------>8--
;; (font-lock-add-keywords 'sh-mode '(
;;                                    ("\\<--\\w+\\>" (0 font-lock-keyword-face))
;;                                    ("[-{}()<>=;:+[.]\\|\\]" (0 font-lock-keys-face))
;;                                    ("\\\\$" (0 font-lock-warning-face))
;;                                    ))
;; --8<-------------------------- separator ------------------------>8--
(setq mail-personal-alias-file (concat DENNY_CONF "emacs_data/filebat.mailrc"))
;; --8<-------------------------- separator ------------------------>8--
;; Display string in large, friendly, letters
(setq initial-scratch-message
      (propertize "Try some elisp\n"
                  'font-lock-face '(:height 2.5 :inherit variable-pitch))
      inhibit-startup-screen t)
;; --8<-------------------------- separator ------------------------>8--
(setq require-final-newline nil)
(setq recentf-exclude '("/TAGS"
			"/TAGS$"
			"/var/tmp/"
			".emacs-places"
			".emacs.bmk"
			".emacs~"
			".ido.last"
			".recentf"
			".recentf~"))
;; --8<-------------------------- separator ------------------------>8--
(define-key view-mode-map "j" 'ido-dired)
(define-key view-mode-map "n" 'scroll-up-command)
(define-key view-mode-map "p" 'scroll-down-command)
;; --8<-------------------------- separator ------------------------>8--
;;(load-file (concat EMACS_VENDOR "/unicad/unicad.el"))
;; --8<-------------------------- separator ------------------------>8--
;;(add-hook 'gnus-after-getting-new-news-hook 'gnus-notifications)
;; --8<-------------------------- separator ------------------------>8--
;; File: tmp.el ends here
