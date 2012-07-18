;; -*- coding: utf-8 -*-
;; File: tmp.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-07-18 23:10:18>
;; --8<-------------------------- separator ------------------------>8--
;; (defun save-information ()
;;   (dolist (func kill-emacs-hook)
;;     (unless (memq func '(exit-gnus-on-exit server-force-stop))
;;       (funcall func)))
;;   (unless (eq 'listen (process-status server-process))
;;     (server-start)))

;; (run-with-idle-timer 300 t 'save-information)
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
(defconst my-mode-line-buffer-identification
  (list
   '(:eval
     (let ((host-name
            (if (file-remote-p default-directory)
                (tramp-file-name-host
                 (tramp-dissect-file-name default-directory))
              (system-name))))
       (if (string-match "^[^0-9][^.]*\\(\\..*\\)" host-name)
           (substring host-name 0 (match-beginning 1))
         host-name)))
   ": %12b"))

(setq-default
 mode-line-buffer-identification
 my-mode-line-buffer-identification)

(add-hook
 'dired-mode-hook
 '(lambda ()
    (setq
     mode-line-buffer-identification
     my-mode-line-buffer-identification)))
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
(defun man-face-settings ()
  "Face settings for `man'."
  (setq Man-overstrike-face 'yellow-face)
  (setq Man-underline-face 'underline-green-face)
  (setq Man-reverse-face 'red-face))

(eval-after-load "man" `(man-face-settings))
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
(setq mouse-yank-at-point t) ;; mouse yank commands yank at point instead of at click.
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/goto-last-change/goto-last-change.el"))
(global-set-key "\C-x\C-\\" 'goto-last-change)
(autoload 'goto-last-change
  "goto-last-change" "Set point to the position of the last change." t)
(defadvice goto-last-change-with-auto-marks (before mav-goto-last-change activate)
  "Split the window beforehand to retain the current view"
  (unless (eq last-command 'goto-last-change-with-auto-marks)
    (split-window-vertically)))
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
;;       ido-enable-flex-matching t
;;       ido-enable-last-directory-history nil
;;       ido-enable-regexp nil
;;       ido-max-directory-size 300000
;;       ido-max-file-prompt-width 0.3
;;       ;; ido-use-filename-at-point (quote guess)
;;       ido-use-url-at-point t
;;       ido-auto-merge-work-directories-length 0
;;       ido-use-virtual-buffers t)

;; ;; Allow the same buffer to be open in different frames
;; (setq ido-default-buffer-method 'selected-window)
;; --8<-------------------------- separator ------------------------>8--
;; File: tmp.el ends here
