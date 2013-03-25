;; -*- coding: utf-8 -*-
;; File: tmp.el -- tentatively try new features/configuration with limited impact
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2013-03-25 16:48:43>
;; --8<-------------------------- separator ------------------------>8--
(defun gb2312_to_utf8 ()
  "convert current buffer from gb2312 to utf8"
  (interactive)
  (let* ((current-file (buffer-file-name (current-buffer)))
         (bak-file (format "%s_%s_bak" current-file (random 100)))
         (convert-command (format "iconv -f gb2312 -t utf-8 %s > %s"
                                  current-file bak-file))
         )
    (with-temp-buffer
      (message convert-command)
      (shell-command convert-command t)
      (find-file bak-file))
    ))
;; --8<-------------------------- separator ------------------------>8--
(defun tidy-xml-buffer ()
  (interactive)
  (save-excursion
    (call-process-region (point-min) (point-max) "tidy" t t nil
                         "-xml" "-i" "-wrap" "0" "-omit" "-q")))

(eval-after-load "nxml-mode"
  '(define-key nxml-mode-map [(control shift ?h)] 'tidy-xml-buffer))
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
;; (defun eshell-spawn-external-command (beg end)
;; "Parse and expand any history references in current input."
;; (save-excursion
;; (goto-char end)
;; (when (looking-back "&!" beg)
;; (delete-region (match-beginning 0) (match-end 0))
;; (goto-char beg)
;; (insert "spawn "))))
;; (add-hook 'eshell-expand-input-functions 'eshell-spawn-external-command)
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
;; (defun my-elisp-indent-or-complete (&optional arg)
;; (interactive "p")
;; (call-interactively 'lisp-indent-line)
;; (unless (or (looking-back "^\\s-*")
;; (bolp)
;; (not (looking-back "[-A-Za-z0-9_*+/=<>!?]+")))
;; (call-interactively 'lisp-complete-symbol)))

;; (defun my-lisp-indent-or-complete (&optional arg)
;; (interactive "p")
;; (if (or (looking-back "^\\s-*") (bolp))
;; (call-interactively 'lisp-indent-line)
;; (call-interactively 'slime-indent-and-complete-symbol)))

;; (defvar slime-mode nil)

;; (defun my-lisp-mode-hook (&optional emacs-lisp-p)
;; (auto-fill-mode 1)
;; ;;(paredit-mode 1)
;; ;;(redshank-mode 1)

;; ;;(column-marker-1 79)
;; (let (mode-map)
;; (if emacs-lisp-p
;; (progn
;; (require 'edebug)

;; (setq mode-map emacs-lisp-mode-map)

;; (define-key mode-map [(meta return)] 'outline-insert-heading)
;; (define-key mode-map [tab] 'my-elisp-indent-or-complete)
;; (define-key mode-map [tab] 'yas/expand))

;; ;;(turn-on-cldoc-mode)

;; (setq mode-map lisp-mode-map)

;; (define-key mode-map [tab] 'my-lisp-indent-or-complete)
;; (define-key mode-map [(meta ?q)] 'slime-reindent-defun)
;; (define-key mode-map [(meta ?l)] 'slime-selector))))

;; (mapc (lambda (hook)
;; (add-hook hook 'my-lisp-mode-hook))
;; '(lisp-mode-hook inferior-lisp-mode-hook slime-repl-mode-hook))

;; (add-hook 'emacs-lisp-mode-hook (function (lambda () (my-lisp-mode-hook t))))
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
(setq nnir-namazu-remove-prefix (expand-file-name "~/backup/essential/Dropbox/private_data/gnus_data/Mail"))
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
;; "Face settings for `man'."
;; (setq Man-overstrike-face 'yellow-face)
;; (setq Man-underline-face 'underline-green-face)
;; (setq Man-reverse-face 'red-face))

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
;; (defun ediff-face-settings ()
;; "Face settings for `ediff'."
;; (progn
;; (custom-set-faces
;; '(ediff-current-diff-face-B
;; ((((class color) (background dark)) (:background "yellow")))))
;; (set-face-foreground 'ediff-fine-diff-face-A "white")
;; (set-face-background 'ediff-fine-diff-face-A "#555753")
;; (set-face-foreground 'ediff-current-diff-face-B "red")
;; (set-face-foreground 'ediff-fine-diff-face-B "red")
;; (set-face-background 'ediff-fine-diff-face-B "#555753"))
;; (custom-set-faces '(ediff-current-diff-A
;; ((((type tty)) :background "yellow" :foreground "blue")
;; (t :background "DarkSeaGreen3" :foreground "blue violet"))))
;; (custom-set-faces '(ediff-fine-diff-A
;; ((((type tty)) :background "blue" :foreground "white")
;; (t :background "gold1" :foreground "red"))))
;; (custom-set-faces '(ediff-current-diff-B
;; ((((type tty)) :background "yellow" :foreground "black")
;; (t :background "DodgerBlue1" :foreground "gray11"))))
;; (custom-set-faces '(ediff-fine-diff-B
;; ((((type tty)) :background "cyan" :foreground "red")
;; (t :background "chocolate2" :foreground "dark slate blue")))))

;; (eval-after-load "ediff"
;; `(ediff-face-settings))
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
(setq python-indent-offset 4)
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
;; ("\\<--\\w+\\>" (0 font-lock-keyword-face))
;; ("[-{}()<>=;:+[.]\\|\\]" (0 font-lock-keys-face))
;; ("\\\\$" (0 font-lock-warning-face))
;; ))
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
(setq mode-require-final-newline nil)
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
;;(load-file (concat EMACS_VENDOR "/unicad/unicad.el"))
;; --8<-------------------------- separator ------------------------>8--
(defadvice tramp-maybe-open-connection (before tramp-set-connection-property activate)
  (setenv "LC_ALL" "en_US.UTF-8")
  )
;; --8<-------------------------- separator ------------------------>8--
;;(add-hook 'gnus-after-getting-new-news-hook 'gnus-notifications)
;; --8<-------------------------- separator ------------------------>8--
(defun sum-column (start end arg)
  "Add up (presumed) numbers in the column defined by START and END.
Insert if ARG."
  (interactive "r\nP")
  (if (< end start) (let (tmp)
                      (setq tmp start)
                      (setq start end)
                      (setq end tmp)))
  (save-excursion
    (goto-char start)
    (let ((numcol (current-column))
          (numend (save-excursion (goto-char end) (current-column)))
          (sum 0))
      (while (< (point) end)
        (setq sum (+ sum (string-to-number
                          (buffer-substring (point)
                                            (progn
                                              (move-to-column numend t)
                                              (point))))))
        (beginning-of-line 2)
        (move-to-column numcol t))
      (if arg (insert (number-to-string sum)))
      (message "Total: %.2f" sum))))
;; --8<-------------------------- separator ------------------------>8--
(savehist-mode 1)
(url-handler-mode 1) ; Allow to open URL
;;(ffap-bindings) ; Use ffap
;; (setq message-confirm-send t)
(setq mm-inline-large-images 'resize)
(setq org-email-link-description-format "Email %c (%d): %.30s")
(setq read-mail-command 'gnus)
(setq compilation-auto-jump-to-first-error t)
(setq compilation-scroll-output 'first-error)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
(setq safe-local-variable-values '((encoding . utf-8)))
(setq backup-by-copying t)
(setq version-control t)
(setq org-agenda-span 14)
(add-to-list 'auto-mode-alist '("\\.zsh$" . sh-mode))
;;(set-default 'indicate-empty-lines t) ;; Show me empty lines after buffer end
;;(global-subword-mode 1) ;; Easily navigate sillycased words

;; --8<-------------------------- separator ------------------------>8--
;; (add-to-list 'load-path (concat EMACS_VENDOR "/yasnippet-bundle"))
;; (require 'yasnippet-bundle)
;; (yas/load-directory (expand-file-name "snippets/" (concat DENNY_CONF "emacs_conf")))
;; (yas/initialize)
;; (defun yas/new-snippet (&optional choose-instead-of-guess)
;; (interactive "P")
;; (let ((guessed-directories (yas/guess-snippet-directories)))
;; (switch-to-buffer "*new snippet*")
;; (erase-buffer)
;; (kill-all-local-variables)
;; (snippet-mode)
;; (set (make-local-variable 'yas/guessed-modes)
;; (mapcar #'(lambda (d)
;; (intern (yas/table-name (car d))))
;; guessed-directories))
;; (unless (and choose-instead-of-guess
;; (not (y-or-n-p "Insert a snippet with useful headers? ")))
;; (yas/expand-snippet "\
;; # -*- mode: snippet -*-
;; # name: $1
;; # --
;; $0"))))
;; --8<-------------------------- separator ------------------------>8--
(setq org-export-html-style
      "<style type=\"text/css\">
@media all
{
 body {
 background-color: whitesmoke;
 font:0.9em serif;
 max-width: 95%;
 margin: auto;
 background-image: url(http://orgmode.org/worg-unicorn.png);
 background-repeat: no-repeat;
 }
 body #content {
 padding-top: 45px;
 }
 body .title {
 margin-left: 120px;
 }

 /* TOC inspired by http://jashkenas.github.com/coffee-script */
 #table-of-contents {
 font-size: 10pt;
 position: fixed;
 right: 7em;
 top: 8em;
 background: white;
 -webkit-box-shadow: 0 0 1em #777777;
 -moz-box-shadow: 0 0 1em #777777;
 -webkit-border-bottom-left-radius: 5px;
 -moz-border-radius-bottomleft: 5px;
 text-align: right;
 /* ensure doesn't flow off the screen when expanded */
 max-height: 80%;
 overflow: auto; }
 #table-of-contents h2 {
 font-size: 11pt;
 max-width: 8em;
 font-weight: normal;
 padding-left: 0.5em;
 padding-right: 0.5em;
 padding-top: 0.05em;
 padding-bottom: 0.05em; }
 #table-of-contents #text-table-of-contents {
 display: none;
 text-align: left; }
 #table-of-contents:hover #text-table-of-contents {
 display: block;
 padding: 0.5em;
 margin-top: -1.5em; }
 #license {
 padding: .3em;
 border: 1px solid grey;
 background-color: #eeeeee;
 }

 h1 {
 font-family:Sans;
 font-size:2.1em;
 font-weight:bold;
 padding:0 0 30px 0;
 margin-top: 10px;
 margin-bottom: 10px;
 margin-right: 7%;
 }

/*
 h2:before {
 content: \"* \"
 }

 h3:before {
 content: \"** \"
 }

 h4:before {
 content: \"*** \"
 }

 h5:before {
 content: \"**** \"
 }

 h6:before {
 content: \"**** \"
 }
*/

 h2 {
 font-family:Arial,sans-serif;
 font-size:1.45em;
 font-weight:bold;
 line-height:16px;
 padding:7px 0 0 0;
 color: #7C0000;
 }

 .outline-text-2 {
 margin-left: 0.1em
 }

 .title {

 }

 h3 {
 font-family:Arial,sans-serif;
 font-size:1.3em;
 font-weight:bold;
 color: #00046E;
 margin-left: 0.6em;
 }

 .outline-text-3 {
 margin-left: 0.9em;
 }

 h4 {
 font-family:Arial,sans-serif;
 font-size:1.2em;
 font-weight:bold;
 margin-left: 1.2em;
 color: #00574F;
 }

 .outline-text-4 {
 margin-left: 1.45em;
 }

 h5 {
 font-family:Arial,sans-serif;
 font-size:1.2em;
 font-weight:bold;
 margin-left: 1.8em;
 color: #5f9ea0;
 }

 .outline-text-5 {
 margin-left: 2.05em;
 }

 h6 {
 font-family:Arial,sans-serif;
 font-size:1.0em;
 font-weight:bold;
 margin-left: 2.4em;
 color: #5f9ea0;
 }

 .outline-text-6 {
 margin-left: 2.65em;
 }

 a {
 text-decoration: none;
 }

 a:visited {
 text-decoration: none;
 }

 a:hover {

 }

 .todo {
 color: #CA0000;
 }

 .done {
 color: #006666;
 }

 .timestamp-kwd {
 color: #444;
 }

 .tag {

 }

 li {
 margin: .4em;
 }

 table {
 border: 1px solid grey;
 }

 td {
 border: none;
 }

 th {
 border: none;
 }

 code {
 font-size: 100%;
 }

 img {
 border: none;
 }

 .share img {
 opacity: .4;
 -moz-opacity: .4;
 filter: alpha(opacity=40);
 }

 .share img:hover {
 opacity: 1;
 -moz-opacity: 1;
 filter: alpha(opacity=100);
 }

 /* pre {border: 1px solid #555; */
 /* background: #EEE; */
 /* font-size: 9pt; */
 /* padding: 1em; */
 /* } */

 /* pre { */
 /* color: #e5e5e5; */
 /* background-color: #000000; */
 /* padding: 1.4em; */
 /* border: 2px solid grey; */
 /* } */

 /* pre { */
 /* background-color: #2b2b2b; */
 /* border: 4px solid grey; */
 /* color: #EEE; */
 /* overflow: auto; */
 /* padding: 1em; */
 /* } */

 pre {
 color: black;
 background-color: #efefef;
 padding: 1.0em;
 border: 1.5px solid #dddddd;
 overflow: auto;
 font-family:Arial,sans-serif;
 font-size:0.9em;
 white-space: pre-wrap; /* css-3 */
 white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
 white-space: -pre-wrap; /* Opera 4-6 */
 white-space: -o-pre-wrap; /* Opera 7 */
 word-wrap: break-word; /* Internet Explorer 5.5+ */
 width:700px; /* set width */
 }

 .org-info-box {
 clear:both;
 margin-left:auto;
 margin-right:auto;
 padding:0.7em;
 /* border:1px solid #CCC; */
 /* border-radius:10px; */
 /* -moz-border-radius:10px; */
 }
 .org-info-box img {
 float:left;
 margin:0em 0.5em 0em 0em;
 }
 .org-info-box p {
 margin:0em;
 padding:0em;
 }

 .builtin {
 /* font-lock-builtin-face */
 color: #f4a460;
 }
 .comment {
 /* font-lock-comment-face */
 color: #737373;
 }
 .comment-delimiter {
 /* font-lock-comment-delimiter-face */
 color: #666666;
 }
 .constant {
 /* font-lock-constant-face */
 color: #db7093;
 }
 .doc {
 /* font-lock-doc-face */
 color: #b3b3b3;
 }
 .function-name {
 /* font-lock-function-name-face */
 color: #5f9ea0;
 }
 .headline {
 /* headline-face */
 color: #ffffff;
 background-color: #000000;
 font-weight: bold;
 }
 .keyword {
 /* font-lock-keyword-face */
 color: #4682b4;
 }
 .negation-char {
 }
 .regexp-grouping-backslash {
 }
 .regexp-grouping-construct {
 }
 .string {
 /* font-lock-string-face */
 color: #ccc79a;
 }
 .todo-comment {
 /* todo-comment-face */
 color: #ffffff;
 background-color: #000000;
 font-weight: bold;
 }
 .variable-name {
 /* font-lock-variable-name-face */
 color: #ff6a6a;
 }
 .warning {
 /* font-lock-warning-face */
 color: #ffffff;
 background-color: #cd5c5c;
 font-weight: bold;
 }
 pre.a {
 color: inherit;
 background-color: inherit;
 font: inherit;
 text-decoration: inherit;
 }
 pre.a:hover {
 text-decoration: underline;
 }

 /* Styles for org-info.js */

 .org-info-js_info-navigation
 {
 border-style:none;
 }

 #org-info-js_console-label
 {
 font-size:10px;
 font-weight:bold;
 white-space:nowrap;
 }

 .org-info-js_search-highlight
 {
 background-color:#ffff00;
 color:#000000;
 font-weight:bold;
 }

 #org-info-js-window
 {
 border-bottom:1px solid black;
 padding-bottom:10px;
 margin-bottom:10px;
 }

 .org-info-search-highlight
 {
 background-color:#adefef; /* same color as emacs default */
 color:#000000;
 font-weight:bold;
 }

 .org-bbdb-company {
 /* bbdb-company */
 font-style: italic;
 }
 .org-bbdb-field-name {
 }
 .org-bbdb-field-value {
 }
 .org-bbdb-name {
 /* bbdb-name */
 text-decoration: underline;
 }
 .org-bold {
 /* bold */
 font-weight: bold;
 }
 .org-bold-italic {
 /* bold-italic */
 font-weight: bold;
 font-style: italic;
 }
 .org-border {
 /* border */
 background-color: #000000;
 }
 .org-buffer-menu-buffer {
 /* buffer-menu-buffer */
 font-weight: bold;
 }
 .org-builtin {
 /* font-lock-builtin-face */
 color: #da70d6;
 }
 .org-button {
 /* button */
 text-decoration: underline;
 }
 .org-c-nonbreakable-space {
 /* c-nonbreakable-space-face */
 background-color: #ff0000;
 font-weight: bold;
 }
 .org-calendar-today {
 /* calendar-today */
 text-decoration: underline;
 }
 .org-comment {
 /* font-lock-comment-face */
 color: #b22222;
 }
 .org-comment-delimiter {
 /* font-lock-comment-delimiter-face */
 color: #b22222;
 }
 .org-constant {
 /* font-lock-constant-face */
 color: #5f9ea0;
 }
 .org-cursor {
 /* cursor */
 background-color: #000000;
 }
 .org-default {
 /* default */
 color: #000000;
 background-color: #ffffff;
 }
 .org-diary {
 /* diary */
 color: #ff0000;
 }
 .org-doc {
 /* font-lock-doc-face */
 color: #bc8f8f;
 }
 .org-escape-glyph {
 /* escape-glyph */
 color: #a52a2a;
 }
 .org-file-name-shadow {
 /* file-name-shadow */
 color: #7f7f7f;
 }
 .org-fixed-pitch {
 }
 .org-fringe {
 /* fringe */
 background-color: #f2f2f2;
 }
 .org-function-name {
 /* font-lock-function-name-face */
 color: #ffffff;
 }
 .org-header-line {
 /* header-line */
 color: #333333;
 background-color: #e5e5e5;
 }
 .org-help-argument-name {
 /* help-argument-name */
 font-style: italic;
 }
 .org-highlight {
 /* highlight */
 background-color: #b4eeb4;
 }
 .org-holiday {
 /* holiday */
 background-color: #ffc0cb;
 }
 .org-info-header-node {
 /* info-header-node */
 color: #a52a2a;
 font-weight: bold;
 font-style: italic;
 }
 .org-info-header-xref {
 /* info-header-xref */
 color: #0000ff;
 text-decoration: underline;
 }
 .org-info-menu-header {
 /* info-menu-header */
 font-weight: bold;
 }
 .org-info-menu-star {
 /* info-menu-star */
 color: #ff0000;
 }
 .org-info-node {
 /* info-node */
 color: #a52a2a;
 font-weight: bold;
 font-style: italic;
 }
 .org-info-title-1 {
 /* info-title-1 */
 font-size: 172%;
 font-weight: bold;
 }
 .org-info-title-2 {
 /* info-title-2 */
 font-size: 144%;
 font-weight: bold;
 }
 .org-info-title-3 {
 /* info-title-3 */
 font-size: 120%;
 font-weight: bold;
 }
 .org-info-title-4 {
 /* info-title-4 */
 font-weight: bold;
 }
 .org-info-xref {
 /* info-xref */
 color: #0000ff;
 text-decoration: underline;
 }
 .org-isearch {
 /* isearch */
 color: #b0e2ff;
 background-color: #cd00cd;
 }
 .org-italic {
 /* italic */
 font-style: italic;
 }
 .org-keyword {
 /* font-lock-keyword-face */
 color: #a020f0;
 }
 .org-lazy-highlight {
 /* lazy-highlight */
 background-color: #afeeee;
 }
 .org-link {
 /* link */
 color: #0000ff;
 text-decoration: underline;
 }
 .org-link-visited {
 /* link-visited */
 color: #8b008b;
 text-decoration: underline;
 }
 .org-match {
 /* match */
 background-color: #ffff00;
 }
 .org-menu {
 }
 .org-message-cited-text {
 /* message-cited-text */
 color: #ff0000;
 }
 .org-message-header-cc {
 /* message-header-cc */
 color: #191970;
 }
 .org-message-header-name {
 /* message-header-name */
 color: #6495ed;
 }
 .org-message-header-newsgroups {
 /* message-header-newsgroups */
 color: #00008b;
 font-weight: bold;
 font-style: italic;
 }
 .org-message-header-other {
 /* message-header-other */
 color: #4682b4;
 }
 .org-message-header-subject {
 /* message-header-subject */
 color: #000080;
 font-weight: bold;
 }
 .org-message-header-to {
 /* message-header-to */
 color: #191970;
 font-weight: bold;
 }
 .org-message-header-xheader {
 /* message-header-xheader */
 color: #0000ff;
 }
 .org-message-mml {
 /* message-mml */
 color: #228b22;
 }
 .org-message-separator {
 /* message-separator */
 color: #a52a2a;
 }
 .org-minibuffer-prompt {
 /* minibuffer-prompt */
 color: #0000cd;
 }
 .org-mm-uu-extract {
 /* mm-uu-extract */
 color: #006400;
 background-color: #ffffe0;
 }
 .org-mode-line {
 /* mode-line */
 color: #000000;
 background-color: #bfbfbf;
 }
 .org-mode-line-buffer-id {
 /* mode-line-buffer-id */
 font-weight: bold;
 }
 .org-mode-line-highlight {
 }
 .org-mode-line-inactive {
 /* mode-line-inactive */
 color: #333333;
 background-color: #e5e5e5;
 }
 .org-mouse {
 /* mouse */
 background-color: #000000;
 }
 .org-negation-char {
 }
 .org-next-error {
 /* next-error */
 background-color: #eedc82;
 }
 .org-nobreak-space {
 /* nobreak-space */
 color: #a52a2a;
 text-decoration: underline;
 }
 .org-org-agenda-date {
 /* org-agenda-date */
 color: #0000ff;
 }
 .org-org-agenda-date-weekend {
 /* org-agenda-date-weekend */
 color: #0000ff;
 font-weight: bold;
 }
 .org-org-agenda-restriction-lock {
 /* org-agenda-restriction-lock */
 background-color: #ffff00;
 }
 .org-org-agenda-structure {
 /* org-agenda-structure */
 color: #0000ff;
 }
 .org-org-archived {
 /* org-archived */
 color: #7f7f7f;
 }
 .org-org-code {
 /* org-code */
 color: #7f7f7f;
 }
 .org-org-column {
 /* org-column */
 background-color: #e5e5e5;
 }
 .org-org-column-title {
 /* org-column-title */
 background-color: #e5e5e5;
 font-weight: bold;
 text-decoration: underline;
 }
 .org-org-date {
 /* org-date */
 color: #a020f0;
 text-decoration: underline;
 }
 .org-org-done {
 /* org-done */
 color: #228b22;
 font-weight: bold;
 }
 .org-org-drawer {
 /* org-drawer */
 color: #0000ff;
 }
 .org-org-ellipsis {
 /* org-ellipsis */
 color: #b8860b;
 text-decoration: underline;
 }
 .org-org-formula {
 /* org-formula */
 color: #b22222;
 }
 .org-org-headline-done {
 /* org-headline-done */
 color: #bc8f8f;
 }
 .org-org-hide {
 /* org-hide */
 color: #e5e5e5;
 }
 .org-org-latex-and-export-specials {
 /* org-latex-and-export-specials */
 color: #8b4513;
 }
 .org-org-level-1 {
 /* org-level-1 */
 color: #0000ff;
 }
 .org-org-level-2 {
 /* org-level-2 */
 color: #b8860b;
 }
 .org-org-level-3 {
 /* org-level-3 */
 color: #a020f0;
 }
 .org-org-level-4 {
 /* org-level-4 */
 color: #b22222;
 }
 .org-org-level-5 {
 /* org-level-5 */
 color: #228b22;
 }
 .org-org-level-6 {
 /* org-level-6 */
 color: #5f9ea0;
 }
 .org-org-level-7 {
 /* org-level-7 */
 color: #da70d6;
 }
 .org-org-level-8 {
 /* org-level-8 */
 color: #bc8f8f;
 }
 .org-org-link {
 /* org-link */
 color: #a020f0;
 text-decoration: underline;
 }
 .org-org-property-value {
 }
 .org-org-scheduled-previously {
 /* org-scheduled-previously */
 color: #b22222;
 }
 .org-org-scheduled-today {
 /* org-scheduled-today */
 color: #006400;
 }
 .org-org-sexp-date {
 /* org-sexp-date */
 color: #a020f0;
 }
 .org-org-special-keyword {
 /* org-special-keyword */
 color: #bc8f8f;
 }
 .org-org-table {
 /* org-table */
 color: #0000ff;
 }
 .org-org-tag {
 /* org-tag */
 font-weight: bold;
 }
 .org-org-target {
 /* org-target */
 text-decoration: underline;
 }
 .org-org-time-grid {
 /* org-time-grid */
 color: #b8860b;
 }
 .org-org-todo {
 /* org-todo */
 color: #ff0000;
 }
 .org-org-upcoming-deadline {
 /* org-upcoming-deadline */
 color: #b22222;
 }
 .org-org-verbatim {
 /* org-verbatim */
 color: #7f7f7f;
 text-decoration: underline;
 }
 .org-org-warning {
 /* org-warning */
 color: #ff0000;
 font-weight: bold;
 }
 .org-outline-1 {
 /* outline-1 */
 color: #0000ff;
 }
 .org-outline-2 {
 /* outline-2 */
 color: #b8860b;
 }
 .org-outline-3 {
 /* outline-3 */
 color: #a020f0;
 }
 .org-outline-4 {
 /* outline-4 */
 color: #b22222;
 }
 .org-outline-5 {
 /* outline-5 */
 color: #228b22;
 }
 .org-outline-6 {
 /* outline-6 */
 color: #5f9ea0;
 }
 .org-outline-7 {
 /* outline-7 */
 color: #da70d6;
 }
 .org-outline-8 {
 /* outline-8 */
 color: #bc8f8f;
 }
 .outline-text-1, .outline-text-2, .outline-text-3, .outline-text-4, .outline-text-5, .outline-text-6 {
 /* Add more spacing between section. Padding, so that folding with org-info.js works as expected. */

 }

 .org-preprocessor {
 /* font-lock-preprocessor-face */
 color: #da70d6;
 }
 .org-query-replace {
 /* query-replace */
 color: #b0e2ff;
 background-color: #cd00cd;
 }
 .org-regexp-grouping-backslash {
 /* font-lock-regexp-grouping-backslash */
 font-weight: bold;
 }
 .org-regexp-grouping-construct {
 /* font-lock-regexp-grouping-construct */
 font-weight: bold;
 }
 .org-region {
 /* region */
 background-color: #eedc82;
 }
 .org-rmail-highlight {
 }
 .org-scroll-bar {
 /* scroll-bar */
 background-color: #bfbfbf;
 }
 .org-secondary-selection {
 /* secondary-selection */
 background-color: #ffff00;
 }
 .org-shadow {
 /* shadow */
 color: #7f7f7f;
 }
 .org-show-paren-match {
 /* show-paren-match */
 background-color: #40e0d0;
 }
 .org-show-paren-mismatch {
 /* show-paren-mismatch */
 color: #ffffff;
 background-color: #a020f0;
 }
 .org-string {
 /* font-lock-string-face */
 color: #bc8f8f;
 }
 .org-texinfo-heading {
 /* texinfo-heading */
 color: #0000ff;
 }
 .org-tool-bar {
 /* tool-bar */
 color: #000000;
 background-color: #bfbfbf;
 }
 .org-tooltip {
 /* tooltip */
 color: #000000;
 background-color: #ffffe0;
 }
 .org-trailing-whitespace {
 /* trailing-whitespace */
 background-color: #ff0000;
 }
 .org-type {
 /* font-lock-type-face */
 color: #228b22;
 }
 .org-underline {
 /* underline */
 text-decoration: underline;
 }
 .org-variable-name {
 /* font-lock-variable-name-face */
 color: #b8860b;
 }
 .org-variable-pitch {
 }
 .org-vertical-border {
 }
 .org-warning {
 /* font-lock-warning-face */
 color: #ff0000;
 font-weight: bold;
 }
 .rss_box {}
 .rss_title, rss_title a {}
 .rss_items {}
 .rss_item a:link, .rss_item a:visited, .rss_item a:active {}
 .rss_item a:hover {}
 .rss_date {}

} /* END OF @media all */

@media screen
{
 #table-of-contents {
 float: right;
 border: 1px solid #CCC;
 max-width: 50%;
 overflow: auto;
 }
} /* END OF @media screen */
</Style>"
      )
;; --8<-------------------------- separator ------------------------>8--
;;(setq message-default-charset 'utf-8)
;; --8<-------------------------- separator ------------------------>8--
;; override original behavior of exporting freemind for wordpress format
(defun my-org-freemind-write-node (mm-buffer drawers-regexp
                                             num-left-nodes base-level
                                             current-level next-level this-m2
                                             this-node-end
                                             this-children-visible
                                             next-node-start
                                             next-has-some-visible-child)
  (let* (this-icons
         this-bg-color
         this-m2-escaped
         this-rich-node
         this-rich-note
         )
    (when (string-match "TODO" this-m2)
      (setq this-m2 (replace-match "" nil nil this-m2))
      (add-to-list 'this-icons "button_cancel")
      (setq this-bg-color "#ffff88")
      (when (string-match "\\[#\\(.\\)\\]" this-m2)
        (let ((prior (string-to-char (match-string 1 this-m2))))
          (setq this-m2 (replace-match "" nil nil this-m2))
          (cond
           ((= prior ?A)
            (add-to-list 'this-icons "full-1")
            (setq this-bg-color "#ff0000"))
           ((= prior ?B)
            (add-to-list 'this-icons "full-2")
            (setq this-bg-color "#ffaa00"))
           ((= prior ?C)
            (add-to-list 'this-icons "full-3")
            (setq this-bg-color "#ffdd00"))
           ((= prior ?D)
            (add-to-list 'this-icons "full-4")
            (setq this-bg-color "#ffff00"))
           ((= prior ?E)
            (add-to-list 'this-icons "full-5"))
           ((= prior ?F)
            (add-to-list 'this-icons "full-6"))
           ((= prior ?G)
            (add-to-list 'this-icons "full-7"))
           ))))
    (setq this-m2 (org-trim this-m2))
    (setq this-m2-escaped (org-freemind-escape-str-from-org this-m2))
    (let ((node-notes (org-freemind-org-text-to-freemind-subnode/note
                       this-m2-escaped
                       this-node-end
                       (1- next-node-start)
                       drawers-regexp)))
      (setq this-rich-node (nth 0 node-notes))
      (setq this-rich-note (nth 1 node-notes)))
    (with-current-buffer mm-buffer
      (insert "<node><richcontent TYPE=\"NODE\"><html><body><p>"
              this-m2-escaped "</p></body></html></richcontent>")
      (when this-icons
        (dolist (icon this-icons)
          (insert "<icon builtin=\"" icon "\"/>\n")))
      )
    (with-current-buffer mm-buffer
      ;;(when this-rich-note (insert this-rich-note))
      (when this-rich-node (insert this-rich-node))))
  num-left-nodes)

(defun update-question-to-blog()
  (interactive)
  (progn
    (question)
    (defalias 'org-freemind-write-node 'my-org-freemind-write-node)
    (org-export-as-freemind)
    (shell-command "~/backup/essential/Dropbox/private_data/backup_small/update-blog.sh")
    )
  )
(add-hook 'org-mode-hook
          (lambda ()
            (defalias 'org-freemind-write-node 'my-org-freemind-write-node)))
;; --8<-------------------------- separator ------------------------>8--
(defun my-unfill-region ()
  (interactive)
  (make-variable-buffer-local 'fill-column)
  (setq fill-column 10000)
  (unfill-region (point-min) (point-max))
  )
(defalias 'uf 'my-unfill-region)
;; --8<-------------------------- separator ------------------------>8--
;; (setq desktop-load-locked-desktop 't)
;;(setq font-lock-function-name-face '((t (:foreground "YellowGreen" :background "Wheat"))))
;;(setq font-lock-function-name-face '((t (:foreground "YellowGreen"))))
;;(setq font-lock-function-name-face 'font-lock-function-name-face)

(make-face 'function-name)
(set-face-foreground 'function-name "YellowGreen")
(setq font-lock-function-name-face 'function-name)
;; --8<-------------------------- separator ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/openwith/openwith.el"))
;; (openwith-mode t)
;; ;; ask for confirmation before invoke external program
;; (setq openwith-confirm-invocation t)
;; (cond
;;  ((eq system-type 'gnu/linux)
;;   ;; clean up previous open associations, and reconfigure
;;   (setq openwith-associations
;;         '(("\\.\\(doc\\|docx\\|xlsx\\|xls\\|ppt\\|pptx\\)\\'" "libreoffice" (file))
;;           ("\\.epub\\'" "calibre" (file))
;;           ;;("\\.pdf\\'" "evince" (file))
;;           ;; ("\\.\\(png\\|bmp\\)\\'" "display" (file))
;;           )))
;;  ((eq system-type 'windows-nt)
;;   ;;TODO problematic
;;   (setq openwith-associations
;;         '(("\\.\\(doc\\|docx\\)\\'" "winword" (file))
;;           )))
;;  )

(add-hook 'message-mode-hook 'disable-openwith-associations)
(defun disable-openwith-associations ()
    (if (object-p 'openwith-associations)
        (progn
          (make-local-variable 'openwith-associations)
          (setq openwith-associations "")
          )
      )
)
;; ;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'post-command-hook 'invoke-voice-command)
(defun invoke-voice-command ()
  (interactive)
  (if (string= (buffer-name) "voice")
      (let (start end text)
        (save-excursion
          (move-beginning-of-line nil)
          (setq start (point))
          (move-end-of-line nil)
          (setq end (point))
          (setq text (buffer-substring-no-properties start end))
          (run-voice-command text)
          )
        )
    )
  )
(global-set-key (kbd "<C-tab>") 'invoke-voice-command) ;; TODO

(defun run-voice-command (text)
  (let* ((command-rule-list
          '(
            ("腾讯" . "open -a /Applications/QQ.app")
            ("内部" . "open -a /Applications/RTX.app")
            ("音乐" . "mplayer /Users/mac/backup/multimediea/music/boyzone--everyday_i_love_you.mp3 &")
            ("文件" . "open /Users/mac/")
            ("微博" . "open http://www.weibo.com")
            ("邮箱" . "open http://www.126.com")
            ("淘宝" . "open http://www.taobao.com")
            ))
         command)
    (setq command (assoc-default text command-rule-list 'string-match))
    (if command
        (shell-command command)
      ))
  )
;; --8<-------------------------- separator ------------------------>8--
;;gnuplot
(add-to-list 'load-path (concat EMACS_VENDOR "/gnuplot-mode"))
(load-file (concat EMACS_VENDOR "/org-plot/org-plot.el"))
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(add-to-list 'auto-mode-alist '("\\.gp$" . gnuplot-mode))
;;(global-set-key [(f9)] 'gnuplot-make-buffer)
;; --8<-------------------------- separator ------------------------>8--
;; ios programming
(if (eq system-type 'darwin)
    (progn
      (load-file (concat EMACS_VENDOR "emacs-xcode-document-viewer/xcode-document-viewer.el"))
      (setq xcdoc:document-path "/Users/mac/Library/Developer/Shared/Documentation/DocSets/com.apple.adc.documentation.AppleiOS6.1.iOSLibrary.docset") ;; TODO
      (setq xcdoc:open-w3m-other-buffer t)
      (defun xcdoc:docsetutil-command ()
        (or (executable-find "docsetutil")
            (and (file-executable-p "/Applications/Xcode.app/Contents/Developer/usr/bin/docsetutil") "/Applications/Xcode.app/Contents/Developer/usr/bin/docsetutil")
            (error "docsetutil command is not found. Perhaps you dont have Xcode man.")))

      )
  )
;; --8<-------------------------- separator ------------------------>8--
;; File: tmp.el ends here
