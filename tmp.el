;; -*- coding: utf-8 -*-
;; File: tmp.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-07-07 21:58:59>
;; --8<-------------------------- separator ------------------------>8--
(defun save-information ()
  (dolist (func kill-emacs-hook)
    (unless (memq func '(exit-gnus-on-exit server-force-stop))
      (funcall func)))
  (unless (eq 'listen (process-status server-process))
    (server-start)))

(run-with-idle-timer 300 t 'save-information)
;; --8<-------------------------- separator ------------------------>8--
(size-indication-mode 1)
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
;; (load-file (concat EMACS_VENDOR "/command-frequency/command-frequency.el"))
;; (require 'command-frequency)
;; (command-frequency-table-load)
;; (command-frequency-mode 1)
;; (command-frequency-autosave-mode 1)
;; --8<-------------------------- separator ------------------------>8--
(defun rgrau-erc-oops (txt)
  (when (member txt '("ls" "xb" "cd"))
    (setq erc-send-this nil)))

(add-to-list 'erc-send-pre-hook 'rgrau-erc-oops)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/screenshot/screenshot.el"))
(setq screenshot-default-scheme "local")
;; --8<-------------------------- separator ------------------------>8--
(defun max-line-length ()
  "Return the max line length in the current buffer"
  (let ((max-len 0))
    (save-excursion
      (goto-char (point-min))
      (while (eq (forward-line) 0)
        (end-of-line)
        (when (> (current-column) max-len)
          (setq max-len (current-column))))
      max-len)))
;; --8<-------------------------- separator ------------------------>8--
;; Specifies whether the desktop should be loaded if locked.
(setq desktop-load-locked-desktop t)
;; --8<-------------------------- separator ------------------------>8--
(setq calendar-view-diary-initially-flag t)
(add-hook 'diary-display-hook 'diary-fancy-display)
;; --8<-------------------------- separator ------------------------>8--
;; File: tmp.el ends here
